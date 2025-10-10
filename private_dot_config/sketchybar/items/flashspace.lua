local colors = require("colors")

local flashspace_bin = "/Applications/FlashSpace.app/Contents/Resources/flashspace"

sbar.exec(flashspace_bin .. " list-workspaces", function(result)
    local sid = 0

    for name in result:gmatch("([^\r\n]+)") do
        sid = sid + 1

        local workspace = sbar.add("item", "workspace." .. sid, {
            label = {
                string = name
            }
        })

        workspace:subscribe("flashspace_workspace_change", function(env)
            if env.WORKSPACE == name then
                workspace:set({
                    label = {
                        color = colors.red
                    }
                })
            else
                workspace:set({
                    label = {
                        color = colors.white
                    }
                })
            end
        end)
    end
end)
