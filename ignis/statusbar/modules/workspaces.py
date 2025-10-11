from collections.abc import Callable
from json import loads as parse_json
from typing import Literal

from ignis.services.hyprland import HyprlandWorkspace
from ignis.widgets.button import Button
from ignis.widgets.label import Label
from ignis.widgets import EventBox

from ..services import HYPR

def special_is_active(workspace_id: int) -> bool:
	jsonstring: str = HYPR.send_command("j/monitors")
	active_id: int = parse_json(
			jsonstring
	)[0]["specialWorkspace"]["id"]
	return active_id == workspace_id

def workspace_button(
		workspace: HyprlandWorkspace,
		is_special: bool,
		labels: list[str]
		) -> Button:
	label: str = labels[0]
	font_size: str = "medium"
	switch_to_workspace: Callable = lambda _: workspace.switch_to()
	if HYPR.active_workspace.id == workspace.id:
		label = labels[1]
		font_size = "large"
	if is_special:
		name: str = workspace.name.split(":")[1]
		switch_to_workspace = lambda _: HYPR.send_command(f"dispatch togglespecialworkspace {name}")
	widget: Button = Button(
		on_click=switch_to_workspace,
		child=Label(label=label),
		style=f"font-size: {font_size};",
		css_classes=["st-clickable"],
		halign="start",
		valign="center"
	)
	return widget

def scroll_workspaces(direction: Literal['up', 'down']) -> None:
	current: int = HYPR.active_workspace["id"]
	target: int = ( current - 1 ) if direction == "up" else current + 1
	if target == 11: return
	HYPR.switch_to_workspace(target)
	return

def main(spacing: int = 5, indicators: list[str] = ["", "", "", ""]) -> EventBox:
	return EventBox(
		on_scroll_up=lambda _: scroll_workspaces("up"),
		on_scroll_down=lambda _: scroll_workspaces("down"),
		spacing=spacing,
		css_classes=["st-workspaces"],
		child=HYPR.bind_many(
			["workspaces", "active_workspace"],
			transform=lambda workspaces, _: [
				workspace_button(
					i, is_special=(special:=i.id<0),
					labels=indicators[2:] if special else indicators[:2])
				for i in workspaces]
		)
	)
