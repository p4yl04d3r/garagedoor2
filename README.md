# garagedoor2
Garage door controller written in LUA to run on ESP8266 with nodemcu.
The monitor/controller operates via its own webserver more or less standalone.

I say this project is more/less standalone because there is a requirment to have a few css and js files served from 
an existing webserver. This was required because of space constrains on the ESP8266.  
I am sure the .js files can be reduced in size to only included the functions I am using and served locally. 
Required access to the following (See garage.html header):
bootstrap.min.css
jquery-2.1.3.min.js
jquery-confirm.js
jquery-confirm.css

Build a customer firmware from: http://nodemcu-build.com/
Select master abd only the default modules (file, GPIO, net, node, timer, uart, wifi). 
There used to be an option to compile with integer but does not seem its an option any longer.
Last tested with nodeMCU 0.9.6 integer: https://github.com/nodemcu/nodemcu-firmware/releases/tag/0.9.6-dev_20150704

Webserver was based off of the work of Marcos kirsch with the nodemcu-httpserver. 
https://github.com/marcoskirsch/nodemcu-httpserver
