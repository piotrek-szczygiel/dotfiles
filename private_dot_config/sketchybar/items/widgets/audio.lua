local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

local audio_device_icon = sbar.add("item", "widgets.audio", {
    position = "right",
    icon = {
        string = icons.audio.speakers,
        padding_left = 0,
        color = colors.text,
        font = {
            style = settings.font.style_map["Regular"],
            size = 16.0
        }
    },
    label = {
        drawing = false
    }
})

local volume_bracket = sbar.add("bracket", "widgets.audio.bracket", { audio_device_icon.name }, {
    background = {
        color = colors.surface_alt
    }
})

sbar.add("item", "widgets.audio.padding", {
    position = "right",
    width = settings.group_paddings
})

local speakers = "MPG271QX OLED"
local headphones = "A50 Game"

local function refresh_audio_source()
    sbar.exec("SwitchAudioSource -t output -c", function(result)
        local current = result:sub(1, -2)
        if current == speakers then
            audio_device_icon:set({
                icon = {
                    string = icons.audio.speakers,
                    padding_left = 1
                }
            })
        elseif current == headphones then
            audio_device_icon:set({
                icon = {
                    string = icons.audio.headphones,
                    padding_left = 1
                }
            })
        elseif current:match("^MacBook") ~= nil then
            audio_device_icon:set({
                icon = {
                    string = icons.audio.macbook
                }
            })
        elseif current:match("^AirPods") ~= nil then
            audio_device_icon:set({
                icon = {
                    string = icons.audio.airpods
                }
            })
        else
            audio_device_icon:set({
                icon = {
                    string = icons.audio.unknown
                }
            })
        end
    end)
end

local function switch_audio_source(env)
    if env.BUTTON == "right" then
        sbar.exec("open /System/Library/PreferencePanes/Sound.prefpane")
        return
    end

    sbar.exec("SwitchAudioSource -t output -c", function(result)
        local current = result:sub(1, -2)
        if current == speakers then
            sbar.exec("SwitchAudioSource -t output -s '" .. headphones .. "'")
        else
            sbar.exec("SwitchAudioSource -t output -s '" .. speakers .. "'")
        end
        refresh_audio_source()
    end)
end

audio_device_icon:subscribe("mouse.clicked", switch_audio_source)
audio_device_icon:subscribe("volume_change", refresh_audio_source)
