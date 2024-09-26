-- this lua only draws lines, no numbers or crosshairs or whatever

angles = {-90, -80, -70, -60, -50, -40, -30, -20, -10, 0, 10, 20, 30, 40, 50, 60, 70, 80, 90} -- total 19 angles

function onTick()
	pitch = input.getNumber(1)
	roll = input.getNumber(2)
end

function onDraw()
	w = screen.getWidth()				  -- get screen's width and height
	h = screen.getHeight()					
	
	heightsize = 152 -- 8x amount of angles we have, increase for more space between each line (recommended to use a multiple of 19)
	
	screen.setColor(0, 255, 0)			 -- Set draw color to green
	angle = math.rad(roll * 360 + 90)
	space = heightsize / 19 -- calculate distance between each blip

	xpos = w / 2 -- center of screen
	ypos = h / 2 -- center of screen

	length = 5 -- length of the line
	
	for i=-9,9 do
		sang = math.sin(angle) -- sine angle
		cang = math.cos(angle) -- cosine angle
		x1 = sang * length + xpos
		y1 = cang * length + ypos
		x2 = sang * -length + xpos
		y2 = cang * -length + xpos
		
		x1 = x1 + math.cos(-angle) * ((space * i) + (pitch) * heightsize)
		y1 = y1 + math.sin(-angle) * ((space * i) + (pitch) * heightsize)
		
		x2 = x2 + math.cos(-angle) * ((space * i) + (pitch) * heightsize)
		y2 = y2 + math.sin(-angle) * ((space * i) + (pitch) * heightsize)
		screen.drawLine(x1, y1, x2, y2)
	end
end