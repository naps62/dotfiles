import XMonad
import XMonad.Util.CustomKeys
import XMonad.Util.EZConfig(additionalKeys)
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import System.Exit
import System.IO
import Graphics.X11.Xlib

-- actions
import XMonad.Actions.CycleWS
import XMonad.Actions.WindowGo
import qualified XMonad.Actions.Submap as SM
import XMonad.Actions.GridSelect
import XMonad.Actions.FloatKeys
import XMonad.Actions.Submap

-- utils

import XMonad.Util.Run
import qualified XMonad.Prompt          as P
import XMonad.Prompt.Shell
import XMonad.Prompt
import XMonad.Prompt.AppendFile (appendFilePrompt)
import XMonad.Prompt.RunOrRaise
import XMonad.Util.NamedWindows (getName)
import Graphics.X11.ExtraTypes.XF86
import XMonad.Util.Scratchpad
import XMonad.Util.NamedScratchpad

-- hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName

-- layouts
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.Reflect
import XMonad.Layout.IM
import XMonad.Layout.Tabbed
import XMonad.Layout.PerWorkspace (onWorkspace)
import XMonad.Layout.Grid
import XMonad.Layout.ComboP
import XMonad.Layout.Column
import XMonad.Layout.Named
import XMonad.Layout.TwoPane

-- Data.Ratio for IM layout
import Data.Ratio ((%))
import Data.List (isInfixOf)

import XMonad.Hooks.EwmhDesktops

browser = "/opt/google/chrome/google-chrome"
explorer = "thunar"

myModMask = mod1Mask

main = xmonad defaultConfig
  { modMask = mod4Mask
  , terminal = "uxterm"
  , layoutHook = noBorders $ layoutHook defaultConfig
  , keys = myKeys
  }

myKeys :: XConfig Layout -> M.Map (KeyMask, KeySym) (X ())
myKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $
  [
    ((modMask, xK_t), spawn $ XMonad.terminal conf)
  , ((modMask, xK_w), spawn browser)
  , ((modMask, xK_e), spawn explorer)
  , ((modMask, xK_space), spawn "PATH=/home/naps62/.bin:$PATH xboomx")

  -- layouts
  , ((modMask .|. shiftMask, xK_space), sendMessage NextLayout)
  , ((modMask, xK_b), sendMessage ToggleStruts)

  -- move focus between windows
  , ((modMask, xK_Tab   ), windows W.focusDown) -- %! Move focus to the next window
  , ((modMask .|. shiftMask, xK_Tab   ), windows W.focusUp  ) -- %! Move focus to the previous window

  -- refresh
  , ((modMask, xK_n), refresh)

  -- resizing
  , ((modMask, xK_h), sendMessage Shrink)
  , ((modMask, xK_l), sendMessage Expand)
  , ((modMask .|. shiftMask, xK_h), sendMessage MirrorShrink)
  , ((modMask .|. shiftMask, xK_l), sendMessage MirrorExpand)

  -- unfloat window
  , ((modMask, xK_z), withFocused $ windows . W.sink)

  -- volume
  , ((0, xF86XK_AudioLowerVolume   ), spawn "amixer set Master 2-")
  , ((0, xF86XK_AudioRaiseVolume   ), spawn "amixer set Master 2+")
  , ((0, xF86XK_AudioMute          ), spawn "amixer set Master toggle")

  -- quit, or restart
  , ((modMask .|. shiftMask, xK_q), io (exitWith ExitSuccess))
  , ((modMask, xK_q), restart "xmonad" True)
  ]
  ++
  -- mod-[1-9] %! Switch to workspace N
  -- mod-shift-[1..9] %! Move client to workspace N
  [((m .|. modMask, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) ([xK_1 .. xK_9] ++ [xK_0])
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
