#!/usr/bin/env -S python3 -B
# https://gitlab.com/wef/dotfiles/-/blob/master/bin/sway-toolwait
TIME_STAMP="20220423.125733"

# dependencies: i3ipc: https://i3ipc-python.readthedocs.io/en/latest/

# Copyright (C) 2020-2022 Bob Hepple <bob dot hepple at gmail dot com>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at
# your option) any later version.
# 
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

from i3ipc import Connection
import argparse 
import subprocess, sys
import time
from multiprocessing import Process

sys.dont_write_bytecode = True

global parser, i3, retval, args, start_time

def verbose(msg):
    if args.verbose:
        elapsed_time = time.time() - start_time
        print(f"{elapsed_time}s: {parser.prog}: {msg}")
        
def sleep_and_run_command():
    "This runs in a separate process"
    s = 0.1 # just enough to let i3ipc.main() loop start
    verbose(f"Runner process sleeping for {s}s") 
    time.sleep(s)
    verbose(f"Running: {args.command}")
    # perhaps a simple fork/spawn here would suffice (and be quicker?)
    subprocess.Popen(args.command)
    
def on_window(i3, e):
    "callback function from i3ipc.main() loop"
    verbose(f"Got a {e.change} window event:")
    if e.ipc_data['container']['app_id']:
        verbose(f"app_id: {e.ipc_data['container']['app_id']}")
    else:
        verbose(f"Class: {e.ipc_data['container']['window_properties']['class']}, instance: {e.ipc_data['container']['window_properties']['instance']}")
        
    retval = 0

    waitfor = args.command[0]
    if args.waitfor:
        waitfor = args.waitfor
        
    finished = False
    if args.nocheck:
        finished = True
    else:
        if e.ipc_data['container']['app_id']:
            if e.ipc_data['container']['app_id'] == waitfor:
                finished = True
        else:
            if e.ipc_data['container']['window_properties']['instance'] == waitfor:
                finished = True
        if finished:
            verbose(f"a new window for '{waitfor}' appeared")
        else:
            verbose(f"a new window appeared but it was not for '{waitfor}'")

    if finished:
        i3.main_quit() # else continue to wait
        
if __name__ == "__main__":

    parser = argparse.ArgumentParser(formatter_class=argparse.RawDescriptionHelpFormatter,
        description="""
Run 'command', wait for a window to open, then exit. If no window
appears in 'timeout' seconds (eg by running a non-GUI program like
'date') then terminate.
""",
        epilog="""eg.
                            
    %(prog)s firefox # this gives time for the window to be created before:
    swaymsg "floating disable; border none"

To run more complex commands use "--". eg.
        
    %(prog)s -- bash -c "some complex bash commands"

This may be similar to the ancient Sun OpenWindows command toolwait or
the X11 version at
http://www.ibiblio.org/pub/linux/X11/xutils/toolwait-0.9.tar.gz
    """)
    parser.add_argument('-n' , '--nocheck', dest='nocheck', action='store_true', help='don\'t check that the window that opens is for that command (default = %(default)s)')
    parser.add_argument('-v', '--verbose', dest='verbose', action='store_true', help='verbose operation')
    parser.add_argument('-m', '--mark', dest='mark', type = str, help='mark to add to window', default='')
    parser.add_argument('-t', '--timeout', dest='timeout', type = float, help='timeout (default = %(default)s secs)', default=30.0)
    parser.add_argument('-w', '--waitfor', dest='waitfor', help='app_id (wayland) or instance string (xwayland) to wait for')
    parser.add_argument('command', nargs='+', help='command to run')
    args = parser.parse_args()

    i3 = Connection()
    i3.on('window::new', on_window)

    retval = 1
    start_time = time.time()
    # run the command without waiting ie in background:
    Process(target=sleep_and_run_command).start()
    i3.main(timeout = args.timeout)

    # i3ipc gives no indication that a timeout has occured, so check the clock:
    elapsed_time = time.time() - start_time
    if elapsed_time <= args.timeout:
        retval = 0
    else:
        verbose(f"timed out after {args.timeout} secs")

    if args.mark != '':
        mark_cmd=f'swaymsg mark "{args.mark}"'
        verbose(f"Running: {mark_cmd}")
        subprocess.run([ mark_cmd ], shell = True)
        
    verbose(f"terminated, retval={retval}")
    sys.exit(retval)
    
# Local variables:
# mode: python
# time-stamp-pattern: "4/TIME_STAMP=\"%:y%02m%02d.%02H%02M%02S\""
# eval: (add-hook 'before-save-hook 'time-stamp)
# End:
