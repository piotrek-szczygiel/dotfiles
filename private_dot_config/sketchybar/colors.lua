local sbar = require("sketchybar")

local light_mode = {
    -- In your config, `white` is used for text; keep it dark for light mode
    white       = 0xff1f2329, -- primary text (≈ #1F2329)
    black       = 0xff9aa4b2, -- inner borders (≈ #9AA4B2)
    grey        = 0xffcbd3dd, -- outer bracket borders (≈ #CBD3DD)
    transparent = 0x00000000,

    -- Accents (darker, tuned for light backgrounds)
    red         = 0xffd44b52, -- ≈ #D44B52
    green       = 0xff2f8f4f, -- ≈ #2F8F4F
    blue        = 0xff2a79c5, -- ≈ #2A79C5
    yellow      = 0xffb97a1f, -- ≈ #B97A1F
    orange      = 0xffc5661e, -- ≈ #C5661E
    magenta     = 0xff6e57cf, -- ≈ #6E57CF

    -- Bar and popups
    bar         = {
        bg     = 0xf0e9f0f7, -- light cool tint, translucent (≈ #E9F0F7 @ 94%)
        border = 0xffc7d0db  -- subtle bar edge
    },
    popup       = {
        bg     = 0xc0ffffff, -- popover sheet
        border = 0xffc7d0db
    },

    -- Surfaces used by your items
    bg1         = 0xfff1f5fb, -- secondary surface (slightly darker than bar)
    bg2         = 0xffffffff, -- primary capsule background for items (white)

    -- Original dark palette values kept for reference mapping
    -- black (dark theme)   -> inner border here
    -- white (dark theme)   -> text here

    with_alpha  = function(color, alpha)
        if alpha > 1.0 or alpha < 0.0 then
            return color
        end
        return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
    end
}

local dark_mode = {
    black = 0xff181819,
    white = 0xffe2e2e3,
    red = 0xfffc5d7c,
    green = 0xff9ed072,
    blue = 0xff76cce0,
    yellow = 0xffe7c664,
    orange = 0xfff39660,
    magenta = 0xffb39df3,
    grey = 0xff7f8490,
    transparent = 0x00000000,

    bar = {
        bg = 0xf02c2e34,
        border = 0xff2c2e34
    },
    popup = {
        bg = 0xc02c2e34,
        border = 0xff7f8490
    },
    bg1 = 0xff363944,
    bg2 = 0xff414550,

    with_alpha = function(color, alpha)
        if alpha > 1.0 or alpha < 0.0 then
            return color
        end
        return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
    end
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
