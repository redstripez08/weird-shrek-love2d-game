Player = Object:extend()

function Player:new()
    self.image = love.graphics.newImage("assets/shrek.png")
    self.x = 100
    self.y = 100
    self.r = 0
    self.speed = 500
    self.faceRight = true
    self.faceLeft = false
end

function Player:update(dt)
    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        self.x = self.x + self.speed *dt
        self.faceRight = true
        self.faceLeft = false
    elseif love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        self.x = self.x - self.speed *dt
        self.faceRight = false
        self.faceLeft = true
    end

    if love.keyboard.isDown("up") or love.keyboard.isDown("w") then
        self.y = self.y - self.speed *dt
    elseif love.keyboard.isDown("down") or love.keyboard.isDown("s") then
        self.y = self.y + self.speed *dt
    end
end

function Player:draw()
    if self.faceRight then
        love.graphics.draw(self.image, self.x, self.y, 0, 0.25, 0.25)
    elseif self.faceLeft then 
        love.graphics.draw(self.image, self.x, self.y, 0, -0.25, 0.25)
    end
end

function Player:keyPressed(key)
    if key == "space" then
        table.insert(LaserList, Laser(self.x, self.y, self.faceLeft, self.faceRight))
    end
end
