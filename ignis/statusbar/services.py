from ignis.services.mpris import MprisService
from ignis.services.hyprland import HyprlandService
from ignis.services.applications import ApplicationsService
from ignis.services.system_tray import SystemTrayService
from ignis.services.upower import UPowerService

MPRIS: MprisService = MprisService.get_default()
HYPR: HyprlandService = HyprlandService.get_default()
APPS: ApplicationsService = ApplicationsService.get_default()
TRAY: SystemTrayService = SystemTrayService.get_default()
BAT: UPowerService = UPowerService.get_default()
