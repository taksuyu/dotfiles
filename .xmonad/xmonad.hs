-- Imports
import XMonad
import XMonad.Actions.SwapWorkspaces
import XMonad.Actions.UpdatePointer
import XMonad.Actions.Warp
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ICCCMFocus
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Layout.Fullscreen
import XMonad.Layout.Grid
import XMonad.Layout.NoBorders
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.XMonad
import qualified XMonad.StackSet as W

import qualified Data.Map as Map

-- Main
main :: IO ()
main = xmonad =<<

    statusBar
        -- The program
        --("dzen2 " ++ "-xs 1 -ta l -fn source-code-pro")
        "xmobar"
        -- Printing information
        --defaultPP
        xmobarPP'
        -- Toggle option
        toggleStrutsKey
        -- xmonad config
        defaultConfig'

-- Config
defaultConfig' = defaultConfig

    { keys = keys'
    , layoutHook = layoutHook'
    , manageHook = manageHook'
    , terminal = "termite"
    , modMask = mod4Mask  -- Start key
    , logHook = takeTopFocus
    }

-- Toggle bar with grave key
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_grave)

-- Pretty print format
xmobarPP' = xmobarPP

    { ppTitle = xmobarColor "green" "" . shorten 200 }

-- Combine custom keys with the defaults
keys' x = modifiedKeys x `Map.union` keys defaultConfig x

-- Layout Hook
layoutHook' = smartBorders (normal ||| Grid ||| full) where

    normal = Tall (1) (3/100) (1/2)
    full = noBorders (fullscreenFull Full)

-- Manage Hook
manageHook' = composeAll

    [ isFullscreen --> (doF W.focusDown <+> doFullFloat)]

-- Custom key bindings
modifiedKeys conf@( XConfig {XMonad.modMask = modm}) = Map.fromList $

    -- Function keys
    [ ((modm, xK_F3), shellPrompt defaultXPConfig)
    , ((modm, xK_F12), xmonadPrompt defaultXPConfig)

    -- Stop mouse from wiggling when I got my hands on the keyboard switching windows
    , ((modm, xK_Tab), windows W.focusDown >> warpToWindow 0.99 0.99)
    ]

    ++

    [ ((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f) >> warpToWindow 0.99 0.99)
      | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
      , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]
    ]

    ++

    -- Swap workspace with active workspace
    [ ((modm .|. controlMask, k), windows $ swapWithCurrent i)
      | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
    ]

