local awful = require("awful")
local wibox = require("wibox")

local custom_update_widget = {}

function custom_update_widget.get_update_command()
    -- Replace the placeholders with the actual update commands for each package manager
    local nala_cmd = "nala update"
    local flatpak_cmd = "flatpak update"
    local nix_cmd = "nix-channel --update && nix-env -u"
    local pip_cmd = "pip install --upgrade pip"

    local update_cmd = string.format("%s && %s && %s && %s", nala_cmd, flatpak_cmd, nix_cmd, pip_cmd)

    return update_cmd
end

function custom_update_widget.update()
    local update_cmd = custom_update_widget.get_update_command()

    -- You can choose to show the output of the update command in a notification or a terminal window.
    -- For simplicity, we'll use the awful.spawn function to run the command in the terminal.
    awful.spawn(terminal_cmd .. " -e '" .. update_cmd .. "'")
end

function custom_update_widget.create()
    local update_button = wibox.widget {
        text = "Update",
        align = "center",
        valign = "center",
        widget = wibox.widget.textbox
    }

    update_button:connect_signal("button::release", function() custom_update_widget.update() end)

    return update_button
end

return custom_update_widget
