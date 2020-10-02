Laser = Object:extend()

math.randomseed(os.time())
function Laser:new(x, y, L, R)
    self.image = love.graphics.newImage("assets/laser.png")
    self.x = x
    self.y = y
    self.speed = 700
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
    self.left = L
    self.right = R
end

function Laser:update(dt)
    if self.right then
        self.x = self.x + self.speed * dt
    elseif self.left then
        self.x = self.x - self.speed * dt
    end
end

function Laser:draw()
    love.graphics.draw(self.image, self.x, self.y, math.rad(90))
end

function Laser:checkCollision(obj)
    local self_left = self.x
    local self_right = self.x + self.width
    local self_top = self.y
    local self_bottom = self.y + self.height

    local obj_left = obj.x
    local obj_right = obj.x + obj.width
    local obj_top = obj.y 
    local obj_bottom = obj.y + obj.height

    if self_right > obj_left and
    self_left < obj_right and
    self_bottom > obj_top and
    self_top < obj_bottom then
        self.dead = true

        obj.x = math.random(0, love.graphics.getWidth())
        obj.y = math.random(0, love.graphics.getHeight())
    end
end
