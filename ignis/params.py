from typing import Any

PARAMS: dict[str, Any] = {
	'statusbar': {
		'anchor': ['left', 'top', 'right'],
		'margins': {'top': 8, 'left': 9, 'right': 9, 'bottom': -5},
		'modules': {
			'start': ['app_launcher', 'window_title', 'workspaces'],
			'center': ['clock'],
			'end': ['system_tray', 'battery', 'power_menu']},
		'window_title': {'icon': True, 'title': False},
		'workspaces': {'spacing': 0},
		'clock': {
			'update_at': 500,
			'format': '%a, %H:%M'},
		'power_menu': {
			'command': 'wlogout --protocol layer-shell -L 450 -R 450'}
	}
}
