return function (connection, args)
	connection:send("HTTP/1.0 200 OK\r\nContent-Type: application/json\r\nCache-Control: private, no-store\r\n\r\n")

	local function pushButton(connection, door)
	    print('Garage door button was pressed!', door)
		if door == 1 then 
			gpio.write(button1, gpio.LOW) 
			tmr.delay(300000)
			gpio.write(button1, gpio.HIGH)
		end
		if door == 2 then 
			gpio.write(button2, gpio.LOW) 
			tmr.delay(300000)
			gpio.write(button2, gpio.HIGH)
		end
		connection:send("<a> Press refresh to see current status</a>")
	end



	if     args.door == "1" then pushButton(connection, 1) 
	elseif args.door == "2" then pushButton(connection, 2)   
	else
		if (gpio.read(garage1) == 0)then
			connection:send('<div class="col-md-2"><input class="btn btn-block btn-lg btn-success" type="button" value="Door 1 closed" onclick="door1()"></div>')
		else
			connection:send('<div class="col-md-2"><input class="btn btn-block btn-lg btn-danger" type="button" value="Door 1 open" onclick="door1()"></div>')
		end
		if (gpio.read(garage2) == 0)then
			connection:send('<div class="col-md-2"><input class="btn btn-block btn-lg btn-success" type="button" value="Door 2 closed" onclick="door2()"></div>')
		else
			connection:send('<div class="col-md-2"><input class="btn btn-block btn-lg btn-danger" type="button" value="Door 2 open" onclick="door2()"></div>')
		end
	end 
end