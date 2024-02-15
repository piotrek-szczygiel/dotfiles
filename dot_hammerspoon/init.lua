function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Hammerspoon config loaded")

function toggleApp(bundleID)
    return (function()
        app = hs.application.get(bundleID)
        if app ~= nil then
            if app:isFrontmost() then
                app:hide()
            else
                app:activate()
            end
        else
            hs.application.launchOrFocusByBundleID(bundleID)
        end
    end)
end

hs.hotkey.bind({"alt"}, "1", toggleApp("com.github.wez.wezterm"))
hs.hotkey.bind({"alt"}, "2", toggleApp("com.jetbrains.intellij"))
hs.hotkey.bind({"alt"}, "3", toggleApp("company.thebrowser.Browser"))

hs.eventtap.new({hs.eventtap.event.types.systemDefined}, function(event)
    local systemKey = event:systemKey()
    local cmd = hs.eventtap.checkKeyboardModifiers()["cmd"]

    if systemKey.key == "MUTE" then
        if not systemKey.down then
            local speakers = hs.audiodevice.findOutputByUID("ProxyAudioDevice_UID")
            local headphones = hs.audiodevice.findOutputByName("HyperX Cloud Alpha Wireless")

            local newDevice = speakers
            if speakers:uid() == hs.audiodevice.defaultOutputDevice():uid() then
                newDevice = headphones
            end

            newDevice:setDefaultOutputDevice()
            hs.notify.show("Sound output", "", newDevice:name())
        end
        return true
    elseif systemKey.key == "SOUND_UP" then
        if cmd  then
            return true, {hs.eventtap.event.newSystemKeyEvent("BRIGHTNESS_UP", systemKey.down)}
        end
    elseif systemKey.key == "SOUND_DOWN" then
        if cmd  then
            return true, {hs.eventtap.event.newSystemKeyEvent("BRIGHTNESS_DOWN", systemKey.down)}
        end
    end
end):start()
