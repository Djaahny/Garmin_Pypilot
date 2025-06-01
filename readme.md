<H1> This program is for the Garmin Qualix 7 watch to control a Pypilot Autopilot</H1>
The watch app is done and compiles with ConncetIQ 5.1.0.
It communicates with BLE to a paired phone, and from there to a flask serverside agent that helps redistribute data.
The server-side is not written yet, but there is a small test server that can demo the watch app.
Have fun - the server-side part to come.
True Spagetticoding!



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

