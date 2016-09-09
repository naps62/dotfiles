#!/bin/sh

## git publish is a modified version of git-publish-branch, found:
## http://git-wt-commit.rubyforge.org/git-publish-branch
##
## As this is a fork of git-publish-branch, it retains the original copyright.
## git-publish-branch Copyright 2008 William Morgan <wmorgan-git-wt-add@masanjin.net>.
##
## The modifications are copyright.
## git publish Copyright 2010 Gavin Beatty <gavinbeatty@gmail.com>.
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or (at
## your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You can find the GNU General Public License at:
##   http://www.gnu.org/licenses/

set -e

# @VERSION@

SUBDIRECTORY_OK=Yes
OPTIONS_KEEPDASHDASH=""
OPTIONS_SPEC="\
git publish [options] [<remote>]
git publish [options] -d
--
v,verbose   print each command as it is run
n,dry-run   don't run any commands, just print them
f,force     don't do any checks on whether <local_branch> is tracking a branch already
b,branch=   the local branch whose tracking information we will change and that we will publish
d,delete    delete tracking configuration for <local_branch>
t,tracking-only only update tracking info - don't publish or delete any remote branches
version     print version info in 'git publish version \$version' format"

. "$(git --exec-path)/git-sh-setup"

version_print() {
    echo "git publish version ${VERSION}"
}

doit() {
    if test -n "$verbose" ; then
        echo "$@"
    fi
    if test -z "$dryrun" ; then
        "$@"
    fi
}
assert_HEAD() {
    if ! git rev-parse --verify -q HEAD >/dev/null ; then
        die "Cannot operate with detached HEAD without being given <branch>"
    fi
}

main() {
    dryrun=""
    force=""
    verbose=""
    delete=""
    branch=""
    track=""
    while test $# -ne 0 ; do
        case "$1" in
        -n|--dry-run)
            dryrun="true"
            verbose="true"
            ;;
        -f|--force)
            force="true"
            ;;
        -v|--verbose)
            verbose="true"
            ;;
        -d|--delete)
            delete="true"
            ;;
        -b|--branch)
            branch="$2"
            shift
            ;;
        -t|--tracking-only)
            track="true"
            ;;
        --version)
            version_print
            exit 0
            ;;
        --)
            shift
            break
            ;;
        esac
        shift
    done

    remote="origin"
    if test $# -gt 0 ; then
        remote="$1"
    fi
    if test $# -gt 1 ; then
        usage >&2
        exit 1
    fi

    if test -z "$branch" ; then
        assert_HEAD
        branch="$(git symbolic-ref HEAD)"
        branch="$(echo "$branch" | sed -e 's|^refs/heads/||')"
    fi

    if test -n "$delete" ; then
        if test -z "$track" ; then
            doit git push "$remote" ":refs/heads/${branch}"
        fi
        doit git config --unset "branch.${branch}.remote"
        doit git config --unset "branch.${branch}.merge"

    else
        if test -z "$force" ; then
            local_ref="$(git show-ref "heads/${branch}" || e=$?)"
            if test -z "$local_ref" ; then
                die "No local branch ${branch} exists!"
            fi
            remote_ref="$(git show-ref "remotes/${remote}/${branch}" || e=$?)"
            if test -n "$remote_ref" ; then
                die "A remote branch ${branch} on ${remote} already exists!"
            fi
            remote_config="$(git config "branch.${branch}.merge" || e=$?)"
            if test -n "$remote_config" ; then
                die "Local branch ${branch} is already tracking ${remote_config}"
            fi
        fi

        if test -z "$track" ; then
            doit git push "$remote" "${branch}:refs/heads/${branch}"
        fi
        doit git config "branch.${branch}.remote" "$remote"
        doit git config "branch.${branch}.merge" "refs/heads/${branch}"
    fi
}

trap "echo \"caught SIGINT\" ; exit 1 ;" INT
trap "echo \"caught SIGTERM\" ; exit 1 ;" TERM
trap "echo \"caught SIGHUP\" ; exit 1 ;" HUP

main "$@"

