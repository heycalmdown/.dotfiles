
function esc()
    local win = hs.window.focusedWindow()
    local app = win:application()
    local title = app:title()
    local inputEnglish = "com.apple.keylayout.ABC"
    local input_source = hs.keycodes.currentSourceID()

    if title == 'MacVim' or title == 'Code' or title == 'iTerm2' or title == 'Alfred 3' or title == 'Emacs' then
        if not (input_source == inputEnglish) then
            hs.eventtap.keyStroke({}, 'right')
            hs.keycodes.currentSourceID(inputEnglish)
        end

        hs.eventtap.keyStroke({}, 'escape')
    elseif title == 'Bear' then
        if not (input_source == inputEnglish) then
            hs.eventtap.keyStroke({}, 'right')
            hs.keycodes.currentSourceID(inputEnglish)
        end
    else
        hs.alert.show(app:title())
    end
end

function onWifiTransition(event, interface, old_sid, new_ssid)
    hs.alert.show('WiFi - ' .. new_ssid)
end

hs.hotkey.bind({'control'}, "[", esc)

hs.loadSpoon('WiFiTransitions')
spoon.WiFiTransitions.actions = {
    {
        fn = onWifiTransition
    }
}
spoon.WiFiTransitions:start()

-- local lastChangeCount = hs.pasteboard.changeCount()

-- function isempty(s)
--   return s == nil or s == ''
-- end

-- function trim(s)
--   if isempty(s) then
--     return ""
--   end
--   return (s:gsub("^%s*(.-)%s*$", "%1"))
-- end

-- hs.timer.new(1, function()
--   local currentChangeCount = hs.pasteboard.changeCount()
--   if lastChangeCount ~= currentChangeCount then
--     for i, v in ipairs(hs.pasteboard.contentTypes()) do
--       if v == "public.utf8-plain-text" then
--         local clipping = trim(hs.pasteboard.getContents())
--         local len = string.len(clipping)
--         local endIndex = utf8.offset(clipping, 30)
--         if endIndex == nil then
--           hs.alert.show(string.sub(clipping, 1, len))
--         else
--           hs.alert.show(string.sub(clipping, 1, endIndex - 1) .. "...")
--         end
--       elseif v == "public.png" then
--         local img = hs.pasteboard.readImage()
--         local size = img:size()
--         hs.alert.show("PNG [" .. math.floor(size["w"]) .. "x" .. math.floor(size["h"]) .. "]")
--       elseif v == "public.tiff" then
--         local img = hs.pasteboard.readImage()
--         local size = img:size()
--         hs.alert.show("TIFF [" .. math.floor(size["w"]) .. "x" .. math.floor(size["h"]) .. "]")
--       else
--         print(v)
--       end
--     end
--     lastChangeCount = currentChangeCount
--   end
-- end):start()
