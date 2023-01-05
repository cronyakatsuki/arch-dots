-- Base
import XMonad
import System.Exit
import qualified XMonad.StackSet as W

-- Actions
import XMonad.Actions.CycleWS (toggleWS')
import XMonad.Actions.MouseResize

-- Data
import qualified Data.Map        as M
import Data.Maybe (isJust)

-- Hooks
import XMonad.ManageHook
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.SetWMName

-- Layout modifiers
import XMonad.Layout.Renamed
import XMonad.Layout.Spacing
import XMonad.Layout.NoBorders
import XMonad.Layout.SimplestFloat
import XMonad.Layout.LayoutModifier
import XMonad.Layout.ResizableTile
import XMonad.Layout.WindowNavigation
import XMonad.Layout.PerWorkspace
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))

-- Utils
import XMonad.Util.Loggers
import XMonad.Util.NamedScratchpad
import XMonad.Util.SpawnOnce
import XMonad.Util.EZConfig

-- main loop
main :: IO ()
main = xmonad
    . ewmhFullscreen
    . ewmh
    . withEasySB (statusBarProp "xmobar ~/.config/xmobar/xmobarrc" (pure myXmobarPP)) toggleStrutsKey
    $ myConfig
  where
    toggleStrutsKey :: XConfig Layout -> (KeyMask, KeySym)
    toggleStrutsKey XConfig{ modMask = m } = (m, xK_F10)

-- My config
myConfig = def
  { modMask = myModMask
  , layoutHook = myLayoutHook
  , manageHook = myManageHook
  , focusFollowsMouse  = myFocusFollowsMouse
  , terminal = myTerminal
  , borderWidth = myBorderWidth
  , normalBorderColor = myNormalBorderColor
  , focusedBorderColor = myFocusedBorderColor
  , keys = myKeys
  , workspaces = myWorkspaces
  , startupHook = myStartupHook
  }

-- My variables
myModMask = mod4Mask
myTerminal = "alacritty"
myBorderWidth = 3

myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False

myNormalBorderColor = "#5b6078"
myFocusedBorderColor = "#939ab7"

myWorkspaces    = ["一","二","三","四","五","六","七","八","九"]

-- My startup hook
myStartupHook :: X ()
myStartupHook = do
  spawn "killall trayer"  -- kill current trayer on each restart
  spawnOnce "sxhkd -c $HOME/.config/sxhkd/general"
  spawnOnce "transmission-daemon"
  spawnOnce "syncthing"
  spawnOnce "lxsession"
  spawnOnce "picom"
  spawnOnce "clipmenud"
  spawnOnce "dunst"
  spawnOnce "discord --start-minimized"
  spawnOnce "keepassxc"
  spawn ("sleep 2 && trayer --edge top --align right --widthtype request --padding 6 --iconspacing 7 --SetDockType true --SetPartialStrut true --expand true --monitor 1 --transparent true --alpha 0 --tint 0x1e1e2e --height 26")
  setWMName "LG3D" -- Fix java programs

-- My scratchpads
myScratchPads :: [NamedScratchpad]
myScratchPads = [ NS "terminal" spawnTerm findTerm manageTerm
                , NS "wiki" spawnWiki findWiki manageWiki
                , NS "notes" spawnNotes findNotes manageNotes
                ]
  where
    spawnTerm  = myTerminal ++ " --class scratchpad"
    findTerm   = className =? "scratchpad"
    manageTerm = customFloating $ W.RationalRect l t w h
               where
                 h = 0.8
                 w = 0.8
                 t = 0.9 -h
                 l = 0.9 -w
    spawnWiki  = myTerminal ++ " --class wiki -e wiki"
    findWiki   = className =? "wiki"
    manageWiki = customFloating $ W.RationalRect l t w h
               where
                 h = 0.8
                 w = 0.8
                 t = 0.9 -h
                 l = 0.9 -w
    spawnNotes  = myTerminal ++ " --class wiki -e notes"
    findNotes   = className =? "notes"
    manageNotes = customFloating $ W.RationalRect l t w h
               where
                 h = 0.8
                 w = 0.8
                 t = 0.9 -h
                 l = 0.9 -w

--Makes setting the spacingRaw simpler to write. The spacingRaw module adds a configurable amount of space around windows.
mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

-- Below is a variation of the above except no borders are applied
-- if fewer than two windows. So a single window has no gaps.
mySpacing' :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing' i = spacingRaw True (Border i i i i) True (Border i i i i) True

-- My layouts
tall = renamed [Replace "tall"]
          $ withBorder myBorderWidth
          $ windowNavigation
          $ mySpacing 8
          $ ResizableTall 1 (3/100) (1/2) []
monocle  = renamed [Replace "monocle"]
          $ withBorder myBorderWidth
          $ mySpacing 8
          $ windowNavigation
          $ Full
floats   = renamed [Replace "floats"]
          $ withBorder myBorderWidth
          $ simplestFloat

myLayoutHook = lessBorders OnlyScreenFloat
          $ avoidStruts
          $ mouseResize
          $ windowArrange
          $ myDefaultLayout
  where
    myDefaultLayout = onWorkspaces [(myWorkspaces !! 0), (myWorkspaces !! 3), (myWorkspaces !! 4)] (monocle ||| floats ||| tall)
                    $ onWorkspace (myWorkspaces !! 5) (floats ||| tall ||| monocle)
                    $ tall
                    ||| monocle
                    ||| floats

-- My manage hook
myManageHook :: ManageHook
myManageHook = composeAll
    [ className =? "firefox"          --> doShiftAndGo ( myWorkspaces !! 0)
    , className =? "newsboat"         --> doShiftAndGo ( myWorkspaces !! 3)
    , className =? "videos"           --> doShiftAndGo ( myWorkspaces !! 3)
    , className =? "ytfzf"            --> doShiftAndGo ( myWorkspaces !! 3)
    , className =? "lf"               --> doShiftAndGo ( myWorkspaces !! 3)
    , className =? "thunderbird"      --> doShiftAndGo ( myWorkspaces !! 4)
    , className =? "Ferdium"          --> doShiftAndGo ( myWorkspaces !! 4)
    , className =? "discord"          --> doShiftAndGo ( myWorkspaces !! 4)
    , className =? "tutanota-desktop" --> doShiftAndGo ( myWorkspaces !! 4)
    , className =? "Lutris"           --> doShiftAndGo ( myWorkspaces !! 5)
    , className =? "Steam"            --> doShiftAndGo ( myWorkspaces !! 5)
    , className =? "heroic"           --> doShiftAndGo ( myWorkspaces !! 5)
    , isDialog                        --> doFloat
    , className =? "Gimp"             --> doFloat
    , className =? "confirm"          --> doFloat
    , className =? "file_progress"    --> doFloat
    , className =? "dialog"           --> doFloat
    , className =? "download"         --> doFloat
    , className =? "error"            --> doFloat
    , className =? "notification"     --> doFloat
    , className =? "splash"           --> doFloat
    , className =? "toolbar"          --> doFloat
    , className =? "pinentry-gtk-2"   --> doFloat
    , className =? "Yad"              --> doCenterFloat
    , className =? "badd"             --> doCenterFloat
    , isFullscreen                    --> doFullFloat
    , namedScratchpadManageHook myScratchPads
    ]
    where
      doShiftAndGo ws = doF (W.greedyView ws) <+> doShift ws

-- My keybindings in a nice readable format
myKeys = \c -> mkKeymap c $
  [ ("M-S-q", kill) -- kill active window
  , ("M-<Space>", sendMessage NextLayout) -- cycle layout
  , ("M-S-<Space>", withFocused toggleFloat) -- toggle floating state of a window
  , ("M-j", windows W.focusDown) -- Move focus down
  , ("M-k", windows W.focusDown) -- Move focus up
  , ("M-S-<Return>", windows W.swapMaster) -- Move Focused window to master
  , ("M-S-j", windows W.swapDown) --Move window down the stack
  , ("M-S-k", windows W.swapUp) -- Move window up the stack
  , ("M-h", sendMessage Shrink) -- Shrink master
  , ("M-l", sendMessage Expand) -- Expand master
  , ("M-,", sendMessage (IncMasterN 1)) -- Increase master count
  , ("M-.", sendMessage (IncMasterN (-1))) -- Decrease msaster count
  , ("M-C-e", io (exitWith ExitSuccess)) -- Quit xmonad
  , ("M-S-r", spawn "xmonad --recompile && xmonad --restart") -- Restart xmonad
  , ("M-<Tab>", toggleWS' ["NSP"]) -- Toogle last used workspace, ignoring named scratchpad
  , ("M-s t", namedScratchpadAction myScratchPads "terminal") -- Toggle scratchpad
  , ("M-s w", namedScratchpadAction myScratchPads "wiki") -- Toggle scratchpad
  , ("M-s n", namedScratchpadAction myScratchPads "notes") -- Toggle scratchpad
  , ("M-1", windows $ W.greedyView $ myWorkspaces !! 0) -- Check workspace 1
  , ("M-2", windows $ W.greedyView $ myWorkspaces !! 1) -- Check workspace 2
  , ("M-3", windows $ W.greedyView $ myWorkspaces !! 2) -- Check workspace 3
  , ("M-4", windows $ W.greedyView $ myWorkspaces !! 3) -- Check workspace 4
  , ("M-5", windows $ W.greedyView $ myWorkspaces !! 4) -- Check workspace 5
  , ("M-6", windows $ W.greedyView $ myWorkspaces !! 5) -- Check workspace 6
  , ("M-7", windows $ W.greedyView $ myWorkspaces !! 6) -- Check workspace 7
  , ("M-8", windows $ W.greedyView $ myWorkspaces !! 7) -- Check workspace 8
  , ("M-9", windows $ W.greedyView $ myWorkspaces !! 8) -- Check workspace 9
  , ("M-S-1", windows $ W.shift $ myWorkspaces !! 0) -- Send window to workspace 1
  , ("M-S-2", windows $ W.shift $ myWorkspaces !! 1) -- Send window to workspace 2
  , ("M-S-3", windows $ W.shift $ myWorkspaces !! 2) -- Send window to workspace 3
  , ("M-S-4", windows $ W.shift $ myWorkspaces !! 3) -- Send window to workspace 4
  , ("M-S-5", windows $ W.shift $ myWorkspaces !! 4) -- Send window to workspace 5
  , ("M-S-6", windows $ W.shift $ myWorkspaces !! 5) -- Send window to workspace 6
  , ("M-S-7", windows $ W.shift $ myWorkspaces !! 6) -- Send window to workspace 7
  , ("M-S-8", windows $ W.shift $ myWorkspaces !! 7) -- Send window to workspace 8
  , ("M-S-9", windows $ W.shift $ myWorkspaces !! 8) -- Send window to workspace 9
  ]
  where
  toggleFloat w = windows (\s -> if M.member w (W.floating s)
                  then W.sink w s
                  else (W.float w (W.RationalRect (1/6) (1/6) (2/3) (2/3)) s))

-- My xmobar workspace and other things config
myXmobarPP :: PP
myXmobarPP = filterOutWsPP ["NSP"]
      $ def
    { ppSep             = magenta " • "
    , ppTitleSanitize   = xmobarStrip
    , ppCurrent         = white . wrap " " "" . xmobarBorder "Bottom" "#89b4fa" 3
    , ppHidden          = white . wrap " " ""
    , ppHiddenNoWindows = lowWhite . wrap " " ""
    , ppUrgent          = red . wrap (yellow "!") (yellow "!")
    , ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
    , ppExtras          = [logTitles formatFocused formatUnfocused]
    }
  where
    formatFocused   = wrap (white    "[") (white    "]") . magenta . ppWindow
    formatUnfocused = wrap (lowWhite "[") (lowWhite "]") . blue    . ppWindow

    -- | Windows should have *some* title, which should not not exceed a
    -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 25

    blue, lowWhite, magenta, red, white, yellow :: String -> String
    magenta  = xmobarColor "#eba0ac" ""
    blue     = xmobarColor "#cba6f7" ""
    white    = xmobarColor "#cdd6f4" ""
    yellow   = xmobarColor "#f9e2af" ""
    red      = xmobarColor "#f38ba8" ""
    lowWhite = xmobarColor "#585b70" ""
