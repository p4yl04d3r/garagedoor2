-- Setup Station mode
wifi.setmode(wifi.STATION)
wifi.sta.config("<ssid>","<password>")   -- Change WIFI creds
wifi.sta.autoconnect(1)

--Configure GPIO:
led     = 1   -- GPIO5 connect to door open status LED. High means one of the doors is open
garage1 = 2   -- GPIO4  connect to garage door1 status switch
garage2 = 7   -- GPIO13 connect to garage door2 status switch
button1 = 5   -- GPIO14 connect to garage door1 opener button
button2 = 6   -- GPIO12 connect to garage door2 opener button
gpio.mode(led, gpio.OUTPUT)           -- In house status LED
gpio.mode(button1, gpio.OUTPUT)       -- Garage1 door opener button
gpio.mode(button2, gpio.OUTPUT)       -- Garage2 door opener button
gpio.mode(garage1, gpio.INPUT,gpio)   -- Garage1 door status switch
gpio.mode(garage2, gpio.INPUT,gpio)   -- Garage2 door status switch
gpio.write(button1, gpio.HIGH)
gpio.write(button2, gpio.HIGH)
gpio.write(led, gpio.HIGH)            -- init LED to HIGH until the webserver is started.

--Start check of garage doors
tmr.alarm(2, 10000, 1, function() 
   if ((gpio.read(garage1) == 1) or (gpio.read(garage2) == 1))then
      -- Turn LED on if door is open.
      gpio.write(led, gpio.HIGH)
   else
      -- Turn LED off if door is closed.
     gpio.write(led, gpio.LOW)   end
end )	
	
-- Compile server code and remove original .lua files.  Compile lua scripts saves ram.
-- This only happens the first time afer the .lua files are uploaded.
local compileAndRemoveIfNeeded = function(f)
   if file.open(f) then
      file.close()
      print('Compiling:', f)
      node.compile(f)
      file.remove(f)
      collectgarbage()
   end
end

local serverFiles = {'httpserver.lua', 'httpserver-error.lua', 'httpserver-header.lua', 'httpserver-request.lua', 'httpserver-static.lua', 'garage.lua' }
for i, f in ipairs(serverFiles) do compileAndRemoveIfNeeded(f) end

compileAndRemoveIfNeeded = nil
serverFiles = nil
collectgarbage()

-- Print IP address
tmr.alarm(0,6000,0,function() print(wifi.sta.getip()) end)

-- Pause before we call our program. This will give us a chance to recover from crashes as we develop.
tmr.alarm(1,10000,0,function() dofile('httpserver.lc') end)