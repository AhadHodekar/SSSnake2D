local Snake = require("snake")
local Blob = require("blob")

-- @constants
SCORE = 0
GRID_SIZE = 20
GRID_WIDTH = 30
GRID_HEIGHT = 20

local function exit_game()
	if love.keyboard.isDown("q") then
		love.event.quit()
	end
end

-- local function checkCollision(a, b)
-- 	return a.x < b.x + b.width and b.x < a.x + a.width and a.y < b.y + b.height and b.y < a.y + a.height
-- end

function love.load()
	love.window.setMode(GRID_WIDTH * GRID_SIZE, GRID_HEIGHT * GRID_SIZE)
	Snake:load()
	Blob:load()
end

function love.update(dt)
	Snake:update(dt)
	Blob:update(dt)

	-- if checkCollision(Snake, Blob) then
	-- 	SCORE = SCORE + 1
	-- 	Blob.x = math.random(100, 600)
	-- 	Blob.y = math.random(100, 600)
	-- end

	if SCORE == 7 then
		love.event.quit()
	end

	exit_game()
end

function love.draw()
	Snake:draw()
	Blob:draw()
	local score = "Score: " .. tostring(SCORE)
	love.graphics.print(score, 10, 10)
end
