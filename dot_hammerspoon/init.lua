function toggle_app(bundleID)
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

hs.hotkey.bind({"alt"}, "1", toggle_app("com.github.wez.wezterm"))
hs.hotkey.bind({"alt"}, "2", toggle_app("com.jetbrains.intellij"))
hs.hotkey.bind({"alt"}, "3", toggle_app("company.thebrowser.Browser"))

hs.eventtap.new({hs.eventtap.event.types.systemDefined}, function(event)
    local systemKey = event:systemKey()

    if systemKey.key == "MUTE" then

        if not systemKey.down then
            local speakers = hs.audiodevice.findOutputByUID("ProxyAudioDevice_UID")
            local headphones = hs.audiodevice.findOutputByName("HyperX Cloud Alpha Wireless")

            if speakers:inUse() then
                headphones:setDefaultOutputDevice()
            else
                speakers:setDefaultOutputDevice()
            end
        end

        return true
    end
end):start()
