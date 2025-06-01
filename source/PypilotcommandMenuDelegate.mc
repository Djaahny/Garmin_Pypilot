import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;



class PypilotcommandMenuDelegate extends WatchUi.MenuInputDelegate {

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) as Void {
        System.println(item);
        if (item == :autopilot) {
            view = "autopilot";
            WatchUi.pushView(new PypilotcommandView(), new PypilotcommandDelegate(), WatchUi.SLIDE_UP);
        }
        else if (item == :speed) {
            view = "speed";
            comType = "data";
            req.makeRequest("speed");
            WatchUi.pushView(new speedView(), new genericDelegate(), WatchUi.SLIDE_UP);
        }
        else if (item == :wind) {
            view = "wind";
            comType = "data";
            req.makeRequest("wind");
            WatchUi.pushView(new windView(), new genericDelegate(), WatchUi.SLIDE_UP);
        }
        else if (item == :engine) {
            view = "engine";
            comType = "data";
            req.makeRequest("engine");
            WatchUi.pushView(new engineView(), new genericDelegate(), WatchUi.SLIDE_UP);
        }
        else if (item == :water) {
            view = "water";
            comType = "data";
            req.makeRequest("water");
            WatchUi.pushView(new waterView(), new genericDelegate(), WatchUi.SLIDE_UP);
        }
        else if (item == :GPS) {
            view = "GPS";
            WatchUi.pushView(new GPSView(), new genericDelegate(), WatchUi.SLIDE_UP);
        }
        else if (item == :Setup) {
            view = "setup";
            WatchUi.pushView(new SetupView(), new SetupDelegate(), WatchUi.SLIDE_UP);
        }
        else if (item == :Version) {
            view = "version";
            WatchUi.pushView(new VersionView(), new genericDelegate(), WatchUi.SLIDE_UP);
        }
    }

}