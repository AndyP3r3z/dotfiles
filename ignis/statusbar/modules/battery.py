from ignis.widgets import Box, Icon, Label
from ignis.services.upower import UPowerDevice
from ..services import BAT

def battery_item(device: UPowerDevice, icon: bool, percentage: bool) -> Box:
	child: list = []
	if icon:
		child.append(Icon(icon_name=device.bind("icon_name")))
	if percentage:
		child.append(Label(label=device.bind("percent", lambda i: f" {int(i)}% ")))
	box: Box = Box(
		setup=lambda slf: device.connect("removed", lambda _: slf.unparent()),
		child=child)
	return box

def main(icon: bool = True,  percentage: bool = True) -> Box:
	return Box(
		setup=lambda slf: BAT.connect(
			"battery-added",
			lambda _, device: slf.append(battery_item(device, icon, percentage))
		),
		css_classes=["st-battery"]
	)
