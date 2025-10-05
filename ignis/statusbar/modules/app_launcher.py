from ignis.widgets.button import Button
from ignis.widgets.icon import Icon
from subprocess import run as shell

def app_launcher(command: str | None = None, icon: str ="app-launcher") -> Button:
	command = command or "pkill wofi || wofi --show drun --allow-images true --insensitive true --matching multi-contains"
	return Button(
		on_click=lambda _: shell(command, shell=True),
		child=Icon(image=icon, pixel_size=25),
		style="background: none; border-style: none; padding: 0px 0px 0px 6px;"
	)
