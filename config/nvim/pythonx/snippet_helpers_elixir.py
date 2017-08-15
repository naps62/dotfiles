from snippet_helpers import *
import re

def ex_path_without_first_dir(path):
    return re.sub(r"^([a-z-]+\/){1}", "", path)

def ex_module_name(path, snip):
    separator = "."
    blacklist = ["apps", "lib", "test", "models", "controllers"]
    snip.rv = path_as_class_name(path, separator, blacklist)

def ex_project_name(snip):
    snip.rv = path_as_class_name(current_project_name())
