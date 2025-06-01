<H1> This program is for the Garmin Qualix 7 watch to control a Pypilot Autopilot</H1>
The watch app is done and compiles with ConncetIQ 5.1.0.
It communicates with BLE to a paired phone, and from there to a flask serverside agent that helps redistribute data.
The server-side is not written yet, but there is a small test server that can demo the watch app.
Have fun - the server-side part is to come. Once it's done, I'll try to publish it on the Garmin page. 
Until then, it can be sideloaded via USB cable to the watch.

True Spaghetti Coding INC.!

<h2>Manual:</h2>
Start the app and it shows the Autopilot status<be>
down button - turns AP on in all views<be>
up button - turns AP off in all views<be>
hold the up button (menu) to select different views<br>
goto setup and set the IP address (start button next segment - up/down increase number - auto save when leaving the setup screen)<be>



<h3>notes!</h3>
The structure of the program should be as following.

When stating - just stat by showing if the Pilot is on or off - if on show set course and course diff

button down -> on autopilot - button up -> off autopilot -done
menu button moves to various data menu pools -done
    screen 0 -> Autopilot -done
**    screen 1 -> course and speed --done
**    screen 2 -> wind speed and dir and boat speed --done
**    screen 3 -> engine data --done
**    screen 4 -> Waterlevel
    setup -done
    about

only update 1 sec if the light is on in the display - light timeout 5 sec as default - done

