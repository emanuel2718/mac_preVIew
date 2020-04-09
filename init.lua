--Author: Emanuel Ramirez
--Date: 04/05/2020

 


function init()
    --Scrolling speed
    SPEED = 2

    --Modes
    INSERTMODE = false
    NORMALMODE = true

    appsWatcher = hs.application.watcher.new(previewWatcher)
    appsWatcher:start()
end


function previewWatcher(name, event, app)
    --If preview application is beign focused watch for VIM keybinds
    if (name == "Preview" and event == hs.application.watcher.activated) then

        --Enable Keybind: Enter Normal Mode
        hs.hotkey.bind({}, 'ESCAPE',
        function()
            if INSERTMODE then
            hs.alert.show('NORMAL')
            NORMALMODE = true
            INSERTMODE = false
            enableInsertKey()
            enableAllKeys()
            end
        end,nil, nil)

        --Enable Keybind: Enter Insert Mode
        hs.hotkey.bind({}, "I",
        function()
            if NORMALMODE then
            hs.alert.show('INSERT')
            INSERTMODE = true
            NORMALMODE = false
            disableInsertKey()
            disableScrollingKeys()
            end
        end,nil, nil)

        --Enable Keybind: Scroll Left
        hs.hotkey.bind({}, "H",
        function()
            hs.eventtap.scrollWheel({SPEED, 0}, {})
        end,nil,
        function()
            hs.eventtap.scrollWheel({SPEED, 0}, {})
        end)

        --Enable Keybind: Scroll Down
        hs.hotkey.bind({}, "J",
        function()
            hs.eventtap.scrollWheel({0, -SPEED}, {})
        end,nil,
        function()
            hs.eventtap.scrollWheel({0, -SPEED}, {})
        end)

        --Enable Keybind: Scroll Up
        hs.hotkey.bind({}, "K",
        function()
            hs.eventtap.scrollWheel({0, SPEED}, {})
        end,nil,
        function()
            hs.eventtap.scrollWheel({0, SPEED}, {})
        end)

        --Enable Keybind: Scroll Right
        hs.hotkey.bind({}, "L",
        function()
            hs.eventtap.scrollWheel({-SPEED, 0}, {})
        end,nil,
        function()
            hs.eventtap.scrollWheel({-SPEED, 0}, {})
        end)
    end

    --Disable all VIM keybinds when Preview application is NOT focused
    if (name == "Preview" and event == hs.application.watcher.deactivated) then
        disableAllKeys()
    end
end

function enableAllKeys()


    --Enable Keybind: Scroll Left
    hs.hotkey.bind({}, "H",
    function()
        hs.eventtap.scrollWheel({SPEED, 0}, {})
    end,nil,
    function()
        hs.eventtap.scrollWheel({SPEED, 0}, {})
    end)

    --Enable Keybind: Scroll Down
    hs.hotkey.bind({}, "J",
    function()
        hs.eventtap.scrollWheel({0, -SPEED}, {})
    end,nil,
    function()
        hs.eventtap.scrollWheel({0, -SPEED}, {})
    end)

    --Enable Keybind: Scroll Up
    hs.hotkey.bind({}, "K",
    function()
        hs.eventtap.scrollWheel({0, SPEED}, {})
    end,nil,
    function()
        hs.eventtap.scrollWheel({0, SPEED}, {})
    end)

    --Enable Keybind: Scroll Right
    hs.hotkey.bind({}, "L",
    function()
        hs.eventtap.scrollWheel({-SPEED, 0}, {})
    end,nil,
    function()
        hs.eventtap.scrollWheel({-SPEED, 0}, {})
    end)

end

function disableAllKeys()

    --Disable: Normal Mode Keybind
    hs.hotkey.disableAll({}, 'ESCAPE',
    function()
        disableScrollingKeys()
    end,nil, nil)

    --Disable: Insert Mode Keybind
    hs.hotkey.disableAll({}, "I",
    function()
        --hs.alert.show('Insert Mode')
        disableScrollingKeys()
    end,nil, nil)

    --Disbale: Scroll Left Keybind
    hs.hotkey.disableAll({}, "H",
    function()
        hs.eventtap.scrollWheel({SPEED, 0}, {})
    end,nil,
    function()
        hs.eventtap.scrollWheel({SPEED, 0}, {})
    end)
    
    --Disbale: Scroll Down Keybind
    hs.hotkey.disableAll({}, "J",
    function()
        hs.eventtap.scrollWheel({0, -SPEED}, {})
    end,nil,
    function()
        hs.eventtap.scrollWheel({0, -SPEED}, {})
    end)

    --Disbale: Scroll Up Keybind
    hs.hotkey.disableAll({}, "K",
    function()
        hs.eventtap.scrollWheel({0, SPEED}, {})
    end,nil,
    function()
        hs.eventtap.scrollWheel({0, SPEED}, {})
    end)

    --Disbale: Scroll Right Keybind
    hs.hotkey.disableAll({}, "L",
    function()
        hs.eventtap.scrollWheel({-SPEED, 0}, {})
    end,nil,
    function()
        hs.eventtap.scrollWheel({-SPEED, 0}, {})
    end)
end

function enableInsertKey()
    --Enable insert key when in Normal mode; So we can go back
    --to Insert Mode if we wanted to.

    --Enable: Insert Mode Keybind
    hs.hotkey.bind({}, "I",
    function()
        if NORMALMODE then
        hs.alert.show('Insert Mode')
        INSERTMODE = true
        NORMALMODE = false
        disableInsertKey()
        disableScrollingKeys()
        end
    end,nil, nil)
end

function disableInsertKey()
    --Disable Insert key when we are in Insert Mode; So we can type
    --the letter 'i'.

    --Disable: Insert Mode Keybind
    hs.hotkey.disableAll({}, "I",
    function()
        if NORMALMODE then
        hs.alert.show('Insert Mode')
        INSERTMODE = true
        NORMALMODE = false
        disableInsertKey()
        disableScrollingKeys()
        end
    end,nil, nil)
end

function disableScrollingKeys()

    --Disable: Scroll Left Keybind
    hs.hotkey.disableAll({}, "H",
    function()
        hs.eventtap.scrollWheel({SPEED, 0}, {})
    end,nil,
    function()
        hs.eventtap.scrollWheel({SPEED, 0}, {})
    end)
    
    --Disable: Scroll Down Keybind
    hs.hotkey.disableAll({}, "J",
    function()
        hs.eventtap.scrollWheel({0, -SPEED}, {})
    end,nil,
    function()
        hs.eventtap.scrollWheel({0, -SPEED}, {})
    end)

    --Disable: Scroll Up Keybind
    hs.hotkey.disableAll({}, "K",
    function()
        hs.eventtap.scrollWheel({0, SPEED}, {})
    end,nil,
    function()
        hs.eventtap.scrollWheel({0, SPEED}, {})
    end)

    --Disable: Scroll Right Keybind
    hs.hotkey.disableAll({}, "L",
    function()
        hs.eventtap.scrollWheel({-SPEED, 0}, {})
    end,nil,
    function()
        hs.eventtap.scrollWheel({-SPEED, 0}, {})
    end)
end

init()
