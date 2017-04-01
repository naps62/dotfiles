from snippet_helpers import *
import re

def scss_component_name(path, snip):
    name = filename_without_extension(path)
    snip.rv = path_as_class_name(name)
