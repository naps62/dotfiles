from snippet_helpers import *
import re

def js_class_name(path, snip):
    path = path_without_first_dir(path)
    path = path_without_extension(path)
    snip.rv = path_as_class_name(path, separator="::")
