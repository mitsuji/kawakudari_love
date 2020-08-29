# kawakudari-love

This project implements part of the [std15.h](https://github.com/IchigoJam/c4ij/blob/master/src/std15.h) API (from [c4ij](https://github.com/IchigoJam/c4ij)) with [LÖVE](https://love2d.org/), and [Kawakudari Game](https://ichigojam.github.io/print/en/KAWAKUDARI.html) on top of it.

It will allow programming for [IchigoJam](https://ichigojam.net/index-en.html)-like targets using a Lua programming language.
```
function love.load()
   love.window.setTitle("kawakudari")
   love.window.setMode(512,384)
   love.window.setVSync(true)
   frame = 0
   
   std15 = newStd15(512,384,32,24)
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
      std15:locate(math.floor(math.random(32)),23)
      std15:putc(string.byte('*'))
      std15:scroll()

      if not (std15:scr(x,5) == string.byte('\0')) then
	 running = false
      end
      
   end
   frame = frame + 1
end
```

## Prerequisite

[Download](https://love2d.org) and install LÖVE suitable for your environment.

## How to use

To run it
```
$ love .
```

