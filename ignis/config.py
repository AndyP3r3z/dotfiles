#!/usr/bin/env python3
#
# Date:    2025/09/04
# Author:  andyp3r3z
#
# Ignis configuration file.

from tomllib import load as load_toml
from typing import Any
from os.path import dirname

from statusbar import statusbar

CONFIG_DIR: str = dirname(__file__)

with open(f"{CONFIG_DIR}/config.toml", "rb") as config_file:
	BAR_CONFIG: dict[str, Any] = load_toml(config_file)["statusbar"]

statusbar(**BAR_CONFIG)
