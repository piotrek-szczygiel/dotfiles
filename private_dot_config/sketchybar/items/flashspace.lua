local colors = require("colors")

local flashspace_bin = "/Applications/FlashSpace.app/Contents/Resources/flashspace"

sbar.exec(flashspace_bin .. " list-workspaces", function(workspace_list)
    sbar.exec(flashspace_bin .. " get-workspace", function(current)
        local sid = 0
        local workspaces = {}

        current = current:gsub("\n$", "")

        for workspace_name in workspace_list:gmatch("([^\r\n]+)") do
            sid = sid + 1

            local workspace_id = "flashspace." .. sid
            table.insert(workspaces, workspace_id)

            local workspace = sbar.add("item", workspace_id, {
                label = {
                    string = workspace_name,
                    color = (workspace_name == current) and colors.white or colors.grey
                },
                click_script = flashspace_bin .. " workspace --name '" .. workspace_name .. "'"
            })

            workspace:subscribe("flashspace_workspace_change", function(env)
                if env.WORKSPACE == workspace_name then
                    workspace:set({
                        label = {
                            color = colors.white
                        }
                    })
                else
                    workspace:set({
                        label = {
                            color = colors.grey
                        }
                    })
                end
            end)
        end

        local bracket = sbar.add("bracket", "flashspace.bracket", workspaces, {
            background = {
                color = colors.bg2,
                border_color = colors.black,
                height = 30,
            }

        })

        -- Double border
        sbar.add("bracket", { bracket.name }, {
            background = {
                color = colors.transparent,
                border_color = colors.grey,
                border_width = 1,
                height = 30,
            },
        })
    end)
end)
