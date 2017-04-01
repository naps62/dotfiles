from snippet_helpers import *
import re

def rb_class_name(path, snip):
    path = path_without_first_dir(path)
    path = path_without_extension(path)
    snip.rv = path_as_class_name(path, separator="::")

def rb_assign_instance_var_list(args, snip):
    handler = lambda arg: rb_assign_instance_var(arg, snip)

    count = 0
    snip.shift(1)
    for arg in args.split(","):
        regex = re.compile("[*&]*([a-zA-Z0-9_]+)")
        match = regex.match(arg.strip())
        if match:
            if count > 0: snip.rv += "\n"
            count += 1
            snip.rv += snip.mkline("@{0} = {0}".format(match.group(1)))
