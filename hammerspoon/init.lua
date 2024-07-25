local open_wezterm = function()
    local appName = "WezTerm"
    local app = hs.application.get(appName)

    if app == nil or app:isHidden() or not(app:isFrontmost()) then
        hs.application.launchOrFocus(appName)
    else
        app:hide()
    end
end

hs.loadSpoon("ReloadConfiguration")


hs.hotkey.bind({"ctrl"}, "t", open_wezterm)

spoon.ReloadConfiguration:start()
hs.alert.show("Reloaded!")
