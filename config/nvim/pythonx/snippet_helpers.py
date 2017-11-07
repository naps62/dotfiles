import re
import inflection
import os

def path_without_extension(path):
    return re.sub(r"(.*?)\.(.*)$", "\\1", path)

def path_without_first_dir(path):
    if re.search(r"^(app|spec|lib/tasks|test|web)\/", path):
        return re.sub(r"^([a-z-]+\/){2}", "", path)
    else:
        return re.sub(r"^([a-z-]+\/){1}", "", path)

def path_first_dir(path):
    return re.sub(r"\/.*$", "", path)

def path_as_class_name(path, separator = "::", blacklist = [], prefix = None):
    path = path_without_extension(path)
    path = re.sub(r"^_", "", path)
    parts = path.split("/")
    uniq_parts = []
    if prefix:
        uniq_parts.append(prefix)
    for part in parts:
        camelized_part = inflection.camelize(part)
        print(part)
        if part not in blacklist and camelized_part not in uniq_parts:
            uniq_parts.append(camelized_part)
    return separator.join(uniq_parts)

def current_project_name():
    return re.sub(r".*\/([^/]*)$", "\\1", os.getcwd())

def filename_without_extension(path):
    return path.split("/")[-1].split(".")[0]
