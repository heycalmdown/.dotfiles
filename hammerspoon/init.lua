
function esc()
    local win = hs.window.focusedWindow()
    local app = win:application()
    local title = app:title()
    if title == 'MacVim' or title == 'Code' or title == 'iTerm2' or title == 'Alfred 3' then
        local inputEnglish = "com.apple.keylayout.ABC"

        local input_source = hs.keycodes.currentSourceID()

        if not (input_source == inputEnglish) then
            hs.eventtap.keyStroke({}, 'right')
            hs.keycodes.currentSourceID(inputEnglish)
        end

        hs.eventtap.keyStroke({}, 'escape')
    else
        hs.alert.show(app:title())
    end
end

function onWifiTransition(event, interface, old_sid, new_ssid)
    hs.alert.show(new_ssid)
end

hs.hotkey.bind({'control'}, "[", esc)

hs.loadSpoon('WiFiTransitions')
spoon.WiFiTransitions.actions = {
    {
        fn = onWifiTransition
    }
}
spoon.WiFiTransitions:start()