local fileInfo = love.filesystem.getInfo("main.lua")
local lastModified = fileInfo and fileInfo.modtime or 0

function hotReload()
    local currentFileInfo = love.filesystem.getInfo("main.lua")
    local currentModified = currentFileInfo and currentFileInfo.modtime or 0

    if currentModified ~= lastModified then
        lastModified = currentModified
        love.event.quit("restart") -- Reinicia o jogo
    end
end
