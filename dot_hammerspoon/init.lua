hs.alert.show("Hammerspoon config loaded")

function reloadConfig(files)
    local doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end

watcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig)
watcher:start()

function toggleApp(bundleID)
    return (function()
        local app = hs.application.get(bundleID)
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
hs.hotkey.bind({"alt"}, "2", toggleApp("com.microsoft.VSCode"))
hs.hotkey.bind({"alt"}, "3", toggleApp("com.jetbrains.intellij"))
hs.hotkey.bind({"alt"}, "4", toggleApp("company.thebrowser.Browser"))

hs.hotkey.bind({"alt"}, "0", function() hs.alert.show(hs.application.frontmostApplication():bundleID()) end)

eventtap = hs.eventtap.new({hs.eventtap.event.types.systemDefined}, function(event)
    local systemKey = event:systemKey()

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
    end
end)
eventtap:start()
