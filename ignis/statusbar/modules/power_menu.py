from subprocess import run as shell
from ignis.widgets import Button, Icon

def power_menu(command: str, icon: str = "system-shutdown", size: int = 24) -> Button:
	return Button(
		child=Icon(image=icon, pixel_size=size),
		on_click=lambda _: shell(command, shell=True),
		style="background: none; border-style: none;"
	)
