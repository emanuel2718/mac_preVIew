--Author: Emanuel Ramirez
--Date: 04/05/2020

scrollingSped = 2

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
            hs.eventtap.scrollWheel({scrollingSped, 0}, {})
        end,nil,
        function()
            hs.eventtap.scrollWheel({scrollingSped, 0}, {})
        end)

        --Scroll Down
        hs.hotkey.bind({}, "J",
        function()
            hs.eventtap.scrollWheel({0, -scrollingSped}, {})
        end,nil,
        function()
            hs.eventtap.scrollWheel({0, -scrollingSped}, {})
        end)

        --Scroll Up
        hs.hotkey.bind({}, "K",
        function()
            hs.eventtap.scrollWheel({0, scrollingSped}, {})
        end,nil,
        function()
            hs.eventtap.scrollWheel({0, scrollingSped}, {})
        end)

        --Scroll Right
        hs.hotkey.bind({}, "L",
        function()
            hs.eventtap.scrollWheel({-scrollingSped, 0}, {})
        end,nil,
        function()
            hs.eventtap.scrollWheel({-scrollingSped, 0}, {})
        end)
    end

    --Disable all VIM hotkeys when Preview application is not focused
    if (name == "Preview" and event == hs.application.watcher.deactivated) then
        
        --Disbale Scroll Left Hotkey
        hs.hotkey.disableAll({}, "H",
        function()
            hs.eventtap.scrollWheel({scrollingSped, 0}, {})
        end,nil,
        function()
            hs.eventtap.scrollWheel({scrollingSped, 0}, {})
        end)
       
        --Disbale Scroll Down Hotkey
        hs.hotkey.disableAll({}, "J",
        function()
            hs.eventtap.scrollWheel({0, -scrollingSped}, {})
        end,nil,
        function()
            hs.eventtap.scrollWheel({0, -scrollingSped}, {})
        end)

        --Disbale Scroll Up Hotkey
        hs.hotkey.disableAll({}, "K",
        function()
            hs.eventtap.scrollWheel({0, scrollingSped}, {})
        end,nil,
        function()
            hs.eventtap.scrollWheel({0, scrollingSped}, {})
        end)

        --Disbale Scroll Right Hotkey
        hs.hotkey.disableAll({}, "L",
        function()
            hs.eventtap.scrollWheel({-scrollingSped, 0}, {})
        end,nil,
        function()
            hs.eventtap.scrollWheel({-scrollingSped, 0}, {})
        end)
    end
end

init()
