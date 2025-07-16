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


function toggleAudioDevice()
  local speakers = hs.audiodevice.findOutputByName "MPG271QX OLED"
  local headphones = hs.audiodevice.findOutputByName "HyperX Cloud Alpha Wireless"

  local newDevice = speakers
  if speakers:uid() == hs.audiodevice.defaultOutputDevice():uid() then
    newDevice = headphones
  end

  newDevice:setDefaultOutputDevice()
  hs.notify.show("Sound output", "", newDevice:name())
end

hs.hotkey.bind({ "cmd" }, "f12", toggleAudioDevice)
