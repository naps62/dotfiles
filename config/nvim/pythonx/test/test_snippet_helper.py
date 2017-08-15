from snippet_helpers import *

def test_path_without_extension():
    path = "spec/models/user_spec.rb"
    assert path_without_extension(path) == "spec/models/user_spec"

def test_path_as_class_name():
    path = "lib/project/module.ex"
    assert path_as_class_name(path, separator = ".") == "Lib.Project.Module"

    path = "lib/project/blacklisted/some_controller.ex"
    blacklist = ["lib", "blacklisted"]
    assert path_as_class_name(path, separator = ".", blacklist=blacklist) == "Project.SomeController"
