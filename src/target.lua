Target = Object:extend()

math.randomseed(os.time())
function Target:new()
    self.image = love.graphics.newImage("assets/fquad.png")
    self.x = math.random(0, love.graphics.getWidth())
    self.y = math.random(0, love.graphics.getHeight())
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end

function Target:update(dt)
    
end

function Target:draw()
    love.graphics.draw(self.image, self.x, self.y, 0, 0.25, 0.25)
end