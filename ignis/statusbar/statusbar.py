from importlib import import_module
from keyword import iskeyword
from os.path import dirname
from types import ModuleType
from typing import Any, Callable, Literal

from ignis.widgets import Box, CenterBox, Window

CONFIG_DIR: str = dirname(__file__)
_modules: dict[str, ModuleType] = {}

def _assert_secure_module(name: str) -> None:
	name = name.strip()
	not_valid_identifier_error: str = f"'{name}' is not a valid identifier."
	not_existing_module_error: str = f"'modules.{name}' doesn't exist. Make sure your module inside `{CONFIG_DIR}/modules`."
	not_existing_callable_error: str = f"No callable named '{name}' in 'modules.{name}'. Make sure your module name and function are called the same."
	# 1. Make sure it is secure.
	if iskeyword(name) or not name.isidentifier():
		raise ValueError(not_valid_identifier_error)
	# 2. Make sure it exists.
	module: ModuleType
	try:
		module = import_module(f".modules.{name}", package="statusbar")
	except ModuleNotFoundError:
		raise ModuleNotFoundError(not_existing_module_error)
	_modules[name] = module
	func: Any | None = getattr(module, name, None)
	if not callable(func):
		raise ValueError(not_existing_callable_error)
	return

def _create_module(name: str, **kwargs) -> Any:
	name = name.strip()
	module_kwargs: dict[str, Any] | None = kwargs.get(name)
	module: ModuleType = _modules[name]
	func: Callable = getattr(module, name)
	if module_kwargs is None: return func()
	return func(**module_kwargs)

def _create_style(
		**kwargs
		) -> str:
	style: str = ""
	for k, v in kwargs.items():
		if v is None: continue
		style += f"{k.replace('_', '-')}: {v};"
	return style

def statusbar(
		anchor: list[Literal['left', 'top', 'right']] | None = ["left", "top", "right"],
		margins: dict[Literal['top', 'left', 'right', 'bottom'], int] = {"top": 0, "left": 0, "right": 0, "bottom": 0},
		padding: str = "0px",
		border_radius: str | None = None,
		font_family: str | None = None,
		modules: dict[Literal['start', 'center', 'end'], str | list[str] | None] = {"start": None, "center": None, "end": None},
		**kwargs: Any
	) -> Window:
	print(kwargs)
	for value in modules.values():
		if value is None: continue
		assert isinstance(value, (list, str)), "Modules must be a string or a list of strings."
		if isinstance(value, str): value = [value]
		for mod_name in value:
			_assert_secure_module(mod_name)
		continue
	style: str = _create_style(border_radius=border_radius, font_family=font_family)
	return Window(
		namespace="status_bar",
		anchor=anchor, # type: ignore
		margin_top=margins.get("top", 0),
		margin_left=margins.get("left", 0),
		margin_right=margins.get("right", 0),
		margin_bottom=margins.get("bottom", 0),
		style=style,
		exclusivity="exclusive",
		child=CenterBox(
			vertical=False,
			start_widget=Box(
				child=[
					_create_module(m, **kwargs)
					for m in modules["start"]], # type: ignore
				style=f"padding: {padding};"
			) if modules.get("start") else None,
			center_widget=Box(
				child=[
					_create_module(m, **kwargs)
					for m in modules["center"]], # type: ignore
				style=f"padding: {padding};"
			) if modules.get("center") else None,
			end_widget=Box(
				child=[
					_create_module(m, **kwargs)
					for m in modules["end"]], # type: ignore
				style=f"padding: {padding};"
			) if modules.get("end") else None,
		)
	)


