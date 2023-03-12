

AI = {}


function AI:load()
   self.img = love.graphics.newImage("assets/2.png")
   self.width = self.img:getWidth()
   self.height = self.img:getHeight()
   self.x = love.graphics.getWidth() - self.width - 50
   self.y = love.graphics.getHeight() / 2
   self.yVel = 0
   self.speed = 500

   self.timer = 0
   self.rate = 0.5
end


function AI:update(dt)
   self:move(dt)
   self.timer = self.timer + dt
   if self.timer > self.rate then
      self.timer = 0
      self:acquireTarget()
      self:checkBoundaries()
   end
end

function AI:checkBoundaries()
   if self.y - self.height > love.graphics.getHeight() then
      self.y = love.graphics.getHeight() - self.height
   end
end


function AI:move(dt)
   self.y = self.y + self.yVel * dt
end


function AI:acquireTarget()
   if Ball.y + Ball.height < self.y then
      self.yVel = -self.speed
   elseif Ball.y > self.y + self.height then
      self.yVel = self.speed
   else
      self.yVel = 0
   end
end


function AI:draw()
   love.graphics.draw(self.img, self.x, self.y)
end
