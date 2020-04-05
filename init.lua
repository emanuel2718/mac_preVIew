--Author: Emanuel Ramirez
--Date: 04/05/2020

function init()
    appsWatcher = hs.application.watcher.new(previewWatcher)
    appsWatcher:start()
end

function previewWatcher(name, event, app)
    --If preview application is beign focused watch for VIM keybinds
    if (name == "Preview" and event == hs.application.watcher.activated) then

        --Scroll Left
        hs.hotkey.bind({}, "H",
        function()
            hs.eventtap.scrollWheel({2, 0}, {})
        end,nil,
        function()
            hs.eventtap.scrollWheel({2, 0}, {})
        end)

        --Scroll Down
        hs.hotkey.bind({}, "J",
        function()
            hs.eventtap.scrollWheel({0, -2}, {})
        end,nil,
        function()
            hs.eventtap.scrollWheel({0, -2}, {})
        end)

        --Scroll Up
        hs.hotkey.bind({}, "K",
        function()
            hs.eventtap.scrollWheel({0, 2}, {})
        end,nil,
        function()
            hs.eventtap.scrollWheel({0, 2}, {})
        end)

        --Scroll Right
        hs.hotkey.bind({}, "L",
        function()
            hs.eventtap.scrollWheel({-2, 0}, {})
        end,nil,
        function()
            hs.eventtap.scrollWheel({-2, 0}, {})
        end)
    end

    --Disable all VIM hotkeys when Preview application is not focused
    if (name == "Preview" and event == hs.application.watcher.deactivated) then
        
        --Disbale Scroll Left Hotkey
        hs.hotkey.disableAll({}, "H",
        function()
            hs.eventtap.scrollWheel({2, 0}, {})
        end,nil,
        function()
            hs.eventtap.scrollWheel({2, 0}, {})
        end)
       
        --Disbale Scroll Down Hotkey
        hs.hotkey.disableAll({}, "J",
        function()
            hs.eventtap.scrollWheel({0, -2}, {})
        end,nil,
        function()
            hs.eventtap.scrollWheel({0, -2}, {})
        end)

        --Disbale Scroll Up Hotkey
        hs.hotkey.disableAll({}, "K",
        function()
            hs.eventtap.scrollWheel({0, 2}, {})
        end,nil,
        function()
            hs.eventtap.scrollWheel({0, 2}, {})
        end)

        --Disbale Scroll Right Hotkey
        hs.hotkey.disableAll({}, "L",
        function()
            hs.eventtap.scrollWheel({-2, 0}, {})
        end,nil,
        function()
            hs.eventtap.scrollWheel({-2, 0}, {})
        end)
    end
end

init()

--TODO: Add more functionality?
-- Add more vim navigation commands
