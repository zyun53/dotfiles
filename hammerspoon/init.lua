local open_wezterm = function()
    local appName = "WezTerm"
    local app = hs.application.get(appName)

    if app == nil or app:isHidden() or not(app:isFrontmost()) then
        hs.application.launchOrFocus(appName)
    else
        app:hide()
    end
end

function toggleApp(appName, key)
  hs.hotkey.bind({"ctrl"}, key, function()
    local app = hs.application.get(appName)
    if app == nil then
      hs.application.launchOrFocus("/Applications/" .. appName .. ".app")
    elseif app:isFrontmost() then
      app:hide()
    else
      hs.application.launchOrFocus("/Applications/" .. appName .. ".app")
    end
  end)
end

hs.loadSpoon("ReloadConfiguration")


-- hs.hotkey.bind({"ctrl"}, "t", open_wezterm)

-- toggleApp("WezTerm", "space")
toggleApp("Visual Studio Code", "8")
toggleApp("Slack", "9")
toggleApp("Ghostty", "0")

spoon.ReloadConfiguration:start()
hs.alert.show("Reloaded!")
