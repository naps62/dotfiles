from snippet_helpers_elixir import *

class SnipMock:
    def __init__(self):
        self.rv = ""

def test_ex_module_name():
    snip = SnipMock()

    # for umbrella apps
    path = "apps/some_app/lib/some_app/models/user.ex"
    ex_module_name(path, snip)
    assert snip.rv == "SomeApp.User"

    # for regular apps
    path = "lib/some_app/models/user.ex"
    ex_module_name(path, snip)
    assert snip.rv == "SomeApp.User"

    # for test files
    path = "test/some_app/models/user_test.exs"
    ex_module_name(path, snip)
    assert snip.rv == "SomeApp.UserTest"
