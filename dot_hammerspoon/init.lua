hs.alert.show "Hammerspoon config loaded"

local function reloadConfig(files)
  local doReload = false
  for _, file in pairs(files) do
    if file:sub(-4) == ".lua" then
      doReload = true
    end
  end
  if doReload then
    hs.reload()
  end
end

Watcher = hs.pathwatcher.new(os.getenv "HOME" .. "/.hammerspoon/", reloadConfig)
Watcher:start()

local function toggleApp(bundleID)
  return function()
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
  end
end

hs.hotkey.bind({ "alt" }, "space", toggleApp "com.mitchellh.ghostty")
hs.hotkey.bind({ "alt" }, "b", toggleApp "company.thebrowser.Browser")
hs.hotkey.bind({ "alt" }, "i", toggleApp "com.jetbrains.intellij")
hs.hotkey.bind({ "alt" }, "v", toggleApp "com.microsoft.VSCode")

hs.hotkey.bind({ "alt" }, "0", function()
  hs.alert.show(hs.application.frontmostApplication():bundleID())
end)

function cycleWindowsOnCurrentScreen()
  local currentApp = hs.application.frontmostApplication()
  local currentScreen = hs.screen.mainScreen()

  local windows = {}

  for _, window in ipairs(currentApp:allWindows()) do
    if window:screen() == currentScreen then
      table.insert(windows, window)
    end
  end

  if #windows > 1 then
    local currentWindow = hs.window.focusedWindow()
    local nextWindow = nil

    for i, window in ipairs(windows) do
      if window:id() == currentWindow:id() then
        nextWindow = windows[(i % #windows) + 1]
        break
      end
    end

    if nextWindow then
      nextWindow:focus()
    end
  end
end

hs.hotkey.bind({ "cmd" }, "`", cycleWindowsOnCurrentScreen)

EventTap = hs.eventtap.new({ hs.eventtap.event.types.systemDefined }, function(event)
  local systemKey = event:systemKey()

  if systemKey.key == "MUTE" then
    if not systemKey.down then
      local speakers = hs.audiodevice.findOutputByUID "ProxyAudioDevice_UID"
      local headphones = hs.audiodevice.findOutputByName "HyperX Cloud Alpha Wireless"

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
EventTap:start()
