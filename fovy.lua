
local Global = require "global"
local Anim8 = require "lib.anim8"

local Fovy = {}

function Fovy:sign(val)
	if val > 0 then
		return 1
	elseif val < 0 then
		return -1
	else
		return 0
	end
end

function Fovy:drawDebug()
	if not Global.Debug then return end

	love.graphics.setColor(1, 1, 1)
	love.graphics.print("KITZA", 0, 0)
	love.graphics.print("made by amdrei", 0, 12)
end

function Fovy:instanceAdd(obj)
	table.insert(Global.Instances, obj)
end

function Fovy:newSprite(imageURL, width, height, gridRow, gridColumn, speed)
	local sprite = {}

	sprite.image = love.graphics.newImage(imageURL)
	sprite.grid = Anim8.newGrid(width, height, sprite.image:getWidth(), sprite.image:getHeight())
	sprite.anim = Anim8.newAnimation(sprite.grid(gridRow, gridColumn), speed)

	return sprite
end

function Fovy:distance2D(x1, y1, x2, y2)
	return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

function Fovy:colliding(a, b)
	if a.pos.x < b.pos.x + b.hitbox.width and
		a.pos.x + a.hitbox.width > b.pos.x and
		a.pos.y < b.pos.y + b.hitbox.height and
		a.pos.y + a.hitbox.height > b.pos.y then
		return true
	end
end

function Fovy:rgb(r, g, b)
	return {r = r, g = g, b = b}
end

function Fovy:printTable(t)
	for k, v in pairs(t) do
		print(k, v)
	end
end

function Fovy:vec2(x, y)
	return {x = x, y = y}
end

function Fovy:vec3(x, y, z)
	return {x = x, y = y, z = z}
end

function Fovy:dim(width, height)
	return {width = width, height = height}
end

function Fovy:lerp(a, b, t)
	return a + (b - a) * t
end

function Fovy:createInstance(obj)
	table.insert(Global.Instances, obj)
end

return Fovy

