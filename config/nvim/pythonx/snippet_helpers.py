import re
import inflection
import os

#
# Ruby
#

def rb_class_name(path):
    path = path_without_first_dir(path)
    path = path_without_extension(path)
    return path_as_class_name(path, separator="::")

def rb_assign_instance_var(arg):
    regex = re.compile("[*&]*([a-zA-Z0-9_]+)")
    match = regex.match(arg.strip())
    if match:
        return snip.mkline("@{0} = {0}".format(match.group(1)), "  ")
    else:
        return ""

def rb_assign_instance_var_list(args):
    return "\n".join(list(map(ruby_assign_instance_var, args.split(",")))).rstrip()

#
# Elixir
#

def ex_module_name(path):
    path = path_without_first_dir(path)
    path = path_without_extension(path)
    return path_as_class_name(current_project_name() + "/" + path, separator=".")

def ex_project_name():
    return path_as_class_name(current_project_name())

#
# SCSS
#

def scss_component_name(path):
    name = filename_without_extension(path)
    return path_as_class_name(name)

#
# Helpers
#

def path_without_extension(path):
    return re.sub(r"(.*?)(_spec|_test)?\.(.*)$", "\\1", path)

def path_without_first_dir(path):
    if re.search(r"^(app|spec|lib/tasks|test|web)\/", path):
        return re.sub(r"^([a-z-]+\/){2}", "", path)
    else:
        return re.sub(r"^([a-z-]+\/){1}", "", path)

def path_first_dir(path):
    return re.sub(r"\/.*$", "", path)

def path_as_class_name(path, separator = "::"):
    path = re.sub(r"^_", "", path)
    return separator.join(list(map(inflection.camelize, path.split("/"))))

def current_project_name():
    return re.sub(r".*\/([^/]*)$", "\\1", os.getcwd())

def filename_without_extension(path):
    return path.split("/")[-1].split(".")[0]
