local Blob = {}
function Blob:load()
	self.width = 50
	self.height = 50
	self.x = love.graphics.getWidth() - (self.height * 5)
	self.y = 50
end

function Blob:update(dt) end

function Blob:draw()
	love.graphics.setColor(0.75, 0, 1)
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
	love.graphics.setColor(1, 1, 1)
end

return Blob
