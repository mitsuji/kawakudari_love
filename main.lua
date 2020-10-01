require ('ichigojam')

function love.load()
   love.window.setTitle("kawakudari")
   love.window.setMode(512,384)
   love.window.setVSync(true)
   
   std15 = new_std15(512,384,32,24)
   frame = 0
   x = 15
   running = true
   
end

function love.update()
   if not running then
      return
   end
   if frame % 5 == 0 then
      if love.keyboard.isDown("left") then
	 x = x -1
      end
      if love.keyboard.isDown("right") then
	 x = x +1
      end
      
      std15:locate(x,5)
      std15:putc(string.byte('0'))
      std15:locate((math.random(32)-1),23)
      std15:putc(string.byte('*'))
      std15:scroll(direction.up)

      if not (std15:scr(x,5) == 0) then
	 std15:locate(0,23)
	 std15:putstr("Game Over...")
	 std15:putnum(frame)
	 running = false
      end
      
   end
   frame = frame + 1
end

function love.draw()
   std15:draw_screen()
end

