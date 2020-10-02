function love.load()
    Object = require "src.class"
    require "src.player"
    require "src.target"
    require "src.laser"

    Player = Player()
    Target = Target()
    LaserList = {}

    local allstar = love.audio.newSource("assets/AllStar.mp3", "stream")
    allstar:setLooping(true)
    allstar:play()
end

function love.update(dt)
    Player:update(dt)
    Target:update(dt)

    for i, v in ipairs(LaserList) do
        v:update(dt)
        v:checkCollision(Target)

        if v.dead then
            table.remove(LaserList, i)
        end
    end
end

function love.draw()
    Player:draw()
    Target:draw()

    for i, v in ipairs(LaserList) do
        v:draw()
    end

end


function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end

    Player:keyPressed(key)
end