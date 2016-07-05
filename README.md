# garagedoor2
The garage door controller was written in LUA to run on ESP8266 with nodemcu.<br>
The monitor/controller operates via its own webserver more or less standalone.

I say this project is more/less standalone because there is a requirement to have a few css and js files served from a separate webserver. This was required because of space constraints on the ESP8266.  
I am sure the .js files can be reduced in size to only included the functions I am using and served locally. 
Required access to the following (See garage.html header):
bootstrap.min.css
jquery-2.1.3.min.js
jquery-confirm.js
jquery-confirm.css

<b>NodeMCU</b><br>
Build a customer firmware from: http://nodemcu-build.com/ <br>
Select master abd only the default modules (file, GPIO, net, node, timer, uart, wifi).  <br>
There used to be an option to compile with integer but does not seem its an option any longer. <br>
Last tested with nodeMCU 0.9.6 integer: https://github.com/nodemcu/nodemcu-firmware/releases/tag/0.9.6-dev_20150704 <br><br>

Thanks to Marcos kirsch project "nodemcu-httpserver" which allowed the serving or webpages larger then 1.4kb.<br>
His project can be found: https://github.com/marcoskirsch/nodemcu-httpserver
