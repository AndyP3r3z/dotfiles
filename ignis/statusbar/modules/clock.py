from datetime import datetime as dt

from ignis.widgets import Label
from ignis.widgets import Button
from ignis.utils import Poll

def update(lbl: Label, format: str) -> None:
	text: str = f"{dt.now():{format}}"
	lbl.set_label(text)
	return

def clock(format: str = "%H:%M:%S", update_at: int = 300, style: str = "") -> Button:
	label: Label = Label()
	Poll(update_at, lambda _: update(label, format))
	return Button(
		child=label,
		style=style
	)
