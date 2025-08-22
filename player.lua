local Player = {}

function Player:load()
	self.x = love.graphics.getWidth() / 2
	self.y = love.graphics.getHeight() / 2
	self.width = 40
	self.height = 40
	self.speed = 700
end

function Player:update(dt)
	Player:move(dt)
	Player:checkBoundaries()
end

function Player:move(dt)
	if love.keyboard.isDown("w") or love.keyboard.isDown("k") then
		self.y = self.y - self.speed * dt
	elseif love.keyboard.isDown("s") or love.keyboard.isDown("j") then
		self.y = self.y + self.speed * dt
	elseif love.keyboard.isDown("a") or love.keyboard.isDown("h") then
		self.x = self.x - self.speed * dt
	elseif love.keyboard.isDown("d") or love.keyboard.isDown("l") then
		self.x = self.x + self.speed * dt
	end
end

function Player:checkBoundaries()
	if self.y < 0 then
		self.y = 0
	elseif self.y + self.height > love.graphics.getHeight() then
		self.y = love.graphics.getHeight() - self.height
	end

	if self.x < 0 then
		self.x = 0
	elseif self.x + self.width > love.graphics.getWidth() then
		self.x = love.graphics.getWidth() - self.width
	end
end

function Player:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Player
