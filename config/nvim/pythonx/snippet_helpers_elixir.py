from snippet_helpers import *

def ex_module_name(path):
    path = path_without_first_dir(path)
    path = path_without_extension(path)
    return path_as_class_name(current_project_name() + "/" + path, separator=".")

def ex_project_name():
    return path_as_class_name(current_project_name())
