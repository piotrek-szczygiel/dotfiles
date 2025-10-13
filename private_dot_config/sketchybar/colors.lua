local sbar = require("sketchybar")

local light_mode = {
    text        = 0xff1f2329,
    border      = 0xff9aa4b2,
    outline     = 0xffcbd3dd,
    transparent = 0x00000000,

    red         = 0xffd44b52,
    green       = 0xff2f8f4f,
    blue        = 0xff2a79c5,
    yellow      = 0xffb97a1f,
    orange      = 0xffc5661e,
    magenta     = 0xff6e57cf,

    bar         = {
        bg     = 0xf0e9f0f7,
        border = 0xffc7d0db
    },
    popup       = {
        bg     = 0xc0ffffff,
        border = 0xffc7d0db
    },

    surface     = 0xffffffff,
    surface_alt = 0xfff1f5fb,
}

local dark_mode = {
    text        = 0xffe8eaed,
    border      = 0xff8d96a3,
    outline     = 0xff3a404a,
    transparent = 0x00000000,

    red         = 0xfff36b7a,
    green       = 0xffa5d67a,
    blue        = 0xff64aeea,
    yellow      = 0xffe4c46e,
    orange      = 0xffeea158,
    magenta     = 0xffc2a5ff,

    bar         = {
        bg     = 0xf0121418,
        border = 0xff0e1014
    },
    popup       = {
        bg     = 0xc0181b21,
        border = 0xff4a525e
    },

    surface     = 0xff232831,
    surface_alt = 0xff1b2027,
}

sbar.add("event", "appearance_changed", "AppleInterfaceThemeChangedNotification")

local watcher = sbar.add("item", "theme.watcher", { drawing = false })
watcher:subscribe("appearance_changed", function()
    sbar.exec("sketchybar --reload")
end)

local cmd = [[/usr/bin/defaults read -g AppleInterfaceStyle 2>/dev/null || echo "Light"]]
local out = io.popen(cmd):read("*l") or "Light"

if out == "Light" then
    return light_mode
else
    return dark_mode
end
