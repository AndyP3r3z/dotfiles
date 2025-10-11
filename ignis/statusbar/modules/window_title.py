from typing import Literal
from ignis.services.applications import Application
from ignis.widgets import Label, Box, Icon
from ..services import HYPR, APPS

def _get_app(cl: str, output: Literal['icon', 'name']) -> str:
	query: str = cl
	app: Application
	try:
		app = APPS.search(APPS.apps, query)[0]
	except IndexError:
		return ""
	return app.icon if output == 'icon' else app.name

def main(icon: bool = True, title: bool = True) -> Box:
	child: list = []
	if icon: child.append(
		Icon(
			image=HYPR.active_window.bind("class_name", lambda cl: _get_app(cl, 'icon')),
			pixel_size=25,
		)
	)
	if title: child.append(
		Label(
			ellipsize="end",
			max_width_chars=40,
			label=HYPR.active_window.bind("class_name", lambda cl: _get_app(cl, 'name')),
			style="margin-left: 1rem;",
		)
	)
	return Box(child=child, css_classes=["st-window-title"])
