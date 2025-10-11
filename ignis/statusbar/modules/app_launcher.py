from ignis.widgets.button import Button
from ignis.widgets.icon import Icon
from subprocess import run as shell

def main(command: str | None = None, icon: str ="view-app-grid-symbolic") -> Button:
	command = command or "pkill wofi || wofi --show drun --allow-images true --insensitive true --matching multi-contains"
	return Button(
		on_click=lambda _: shell(command, shell=True),
		child=Icon(image=icon, pixel_size=25),
		css_classes=["st-app-launcher"],
	)
