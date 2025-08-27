local Snake = {}

local snakeControls = {
	UP = "up",
	DOWN = "down",
	LEFT = "left",
	RIGHT = "right",
}

function Snake:load()
	self.speed = 0.2
	self.timer = 0
	self.direction = "right"
	self.segments = { {
		x = 25,
		y = 25,
	} }
end

function Snake:update(dt)
	Snake:control()
	Snake:move(dt)
	-- Snake:checkBoundaries()
end

function Snake:control()
	if love.keyboard.isDown("w") then
		self.direction = snakeControls.UP
	end
	if love.keyboard.isDown("s") then
		self.direction = snakeControls.DOWN
	end
	if love.keyboard.isDown("a") then
		self.direction = snakeControls.LEFT
	end
	if love.keyboard.isDown("d") then
		self.direction = snakeControls.RIGHT
	end
end

function Snake:move(dt)
	Snake.timer = Snake.timer + dt
	if Snake.timer >= Snake.speed then
		Snake.timer = 0

		local head = Snake.segments[1]
		local newHead = { x = head.x, y = head.y }

		if Snake.direction == snakeControls.RIGHT then
			newHead.x = newHead.x + 1
		elseif Snake.direction == snakeControls.LEFT then
			newHead.x = newHead.x - 1
		elseif Snake.direction == snakeControls.UP then
			newHead.y = newHead.y - 1
		elseif Snake.direction == snakeControls.DOWN then
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
			"line",
			(segment.x - 1) * GRID_SIZE,
			(segment.y - 1) * GRID_SIZE,
			GRID_SIZE - 1,
			GRID_SIZE - 1
		)
	end
	love.graphics.setColor(1, 1, 1)
end

return Snake
