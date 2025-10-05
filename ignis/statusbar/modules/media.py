from ignis.widgets import Box, Icon, Label
from ignis.services.mpris import MprisPlayer
from ..services import MPRIS

def mpris_title(player: MprisPlayer, icon: str) -> Box:
	return Box(
		spacing=10,
		setup=lambda slf: player.connect(
			"closed", lambda _: slf.unparent(),
		),
		child=[
			Icon(image=icon),
			Label(
				ellipsize="end",
				max_width_chars=20,
				label=player.bind("title"),
			)
		]
	)

def media(icon: str = "audio-x-generic-symbolic") -> Box:
	return Box(
		spacing=10,
		child=[
			Label(
				label="No media players",
				visible=MPRIS.bind(
					"players",
					lambda val: len(val)==0
				)
			)
		],
		setup=lambda slf: MPRIS.connect(
			"player-added",
			lambda _, player: slf.append(mpris_title(player, icon))
		)
	)
