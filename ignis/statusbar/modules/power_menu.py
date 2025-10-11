from subprocess import run as shell
from ignis.widgets import Button, Icon

def main(command: str, icon: str = "system-shutdown-symbolic", size: int = 24) -> Button:
	return Button(
		child=Icon(image=icon, pixel_size=size),
		on_click=lambda _: shell(command, shell=True),
		css_classes=["st-powermenu"]
	)
