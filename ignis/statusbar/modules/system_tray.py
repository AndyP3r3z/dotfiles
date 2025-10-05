from asyncio import create_task

from ignis.dbus_menu import DBusMenu
from ignis.services.system_tray import SystemTrayItem
from ..services import TRAY
from ignis.widgets import Box, Button, Icon

def tray_item(item: SystemTrayItem, size: int) -> Button:
	menu: DBusMenu | None = item.menu.copy() if item.menu else None
	return Button(
		child=Box(
			child=[
				Icon(image=item.bind("icon"), pixel_size=size),
				menu
			]
		),
		tooltip_text=item.bind("tooltip"),
		on_click=lambda _: menu.popup() if menu else None,
		setup=lambda slf: item.connect("removed", lambda _: slf.unparent()),
		on_right_click=lambda _: create_task(item.activate_async()),
		style="background: none",
	)

def system_tray(icon_size: int = 24, spacing: int = 0) -> Box:
	return Box(
		setup=lambda slf: TRAY.connect(
			"added",
			lambda _, item: slf.append(tray_item(item, icon_size))),
		spacing=spacing
	)
