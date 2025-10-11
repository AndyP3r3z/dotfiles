#!/usr/bin/env python3
#
# Date:    2025/09/04
# Author:  andyp3r3z
#
# Ignis configuration file.

from types import ModuleType
from typing import Any
from importlib import import_module
from os.path import dirname

from ignis.css_manager import CssManager, CssInfoPath
from ignis.utils import get_current_dir

# This is where the real config lives (more declarative).
from params import PARAMS

# This imports all modules declared in `PARAMS` dict.
# You should be able to import your modules as if you were using
# `from module_name import main`, where `main` is the function that will be
# executed with the params given.

css_manager: CssManager = CssManager.get_default()
css_manager.apply_css(
	CssInfoPath(
		name="main",
		path=get_current_dir()+"/style.scss"))

for module_name, module_config in PARAMS.items():
	module: ModuleType = import_module(module_name)
	func: Any | None = getattr(module, 'main', None)
	if not callable(func):
		raise ValueError(f"`from {module_name} import main` failed.")
	func(**module_config)
