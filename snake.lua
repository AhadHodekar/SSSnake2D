local Snake = {}

function Snake:load()
	self.speed = 0.2
	self.timer = 0
	self.direction = "right"
	self.segments = { {
		x = 5,
		y = 5,
	} }
end

function Snake:update(dt)
	Snake:move(dt)
	-- Snake:checkBoundaries()
end

function Snake:move(dt)
	Snake.timer = Snake.timer + dt
	if Snake.timer >= Snake.speed then
		Snake.timer = 0

		local head = Snake.segments[1]
		local newHead = { x = head.x, y = head.y }

		if Snake.direction == "right" then
			newHead.x = newHead.x + 1
		elseif Snake.direction == "left" then
			newHead.x = newHead.x - 1
		elseif Snake.direction == "up" then
			newHead.y = newHead.y - 1
		elseif Snake.direction == "down" then
			newHead.y = newHead.y + 1
		end

		table.insert(Snake.segments, 1, newHead)
		table.remove(Snake.segments) -- remove all (no growth)
	end
end

function Snake:checkBoundaries()
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

function Snake:draw()
	love.graphics.setColor(0, 1, 0)
	for _, segment in ipairs(Snake.segments) do
		love.graphics.rectangle(
			"fill",
			(segment.x - 1) * GRID_SIZE,
			(segment.y - 1) * GRID_SIZE,
			GRID_SIZE - 1,
			GRID_SIZE - 1
		)
	end
	love.graphics.setColor(1, 1, 1)
end

return Snake
