from snippet_helpers import *
import re

def ex_module_name(path, snip):
    if is_umbrella_app(path):
        ex_umbrella_module_name(path, snip)
    else:
        ex_regular_module_name(path, snip)

def ex_regular_module_name(path, snip):
    path = path_without_first_dir(path)
    path = path_without_extension(path)
    snip.rv = path_as_class_name(current_project_name() + "/" + path, separator=".")

def ex_umbrella_module_name(path, snip):
    path = path_without_extension(path)
    parts = path.split("/")
    blacklist = ["apps", "lib"]
    uniq_parts = []
    for part in parts:
       if part not in blacklist and part not in uniq_parts:
          uniq_parts.append(part)
    snip.rv = path_as_class_name("/".join(uniq_parts), separator=".")

def ex_project_name(snip):
    snip.rv = path_as_class_name(current_project_name())

def is_umbrella_app(path):
    regex = re.compile("^apps/")
    return regex.match(path)
