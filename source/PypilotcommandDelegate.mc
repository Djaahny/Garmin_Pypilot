import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Timer;



class PypilotcommandDelegate extends WatchUi.BehaviorDelegate {

var myTimer = new Timer.Timer();

    function timerCallback() {
        myCount += 1;
        if (myCount > 10) {
            myTimer.stop();
            myCount = 0;
        }
        comType = "data";
        req.makeRequest("status");
    
}

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        myTimer.stop();
        WatchUi.pushView(new Rez.Menus.MainMenu(), new PypilotcommandMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }
    
    function onKey(keyEvent as KeyEvent) as Boolean {
        System.println(keyEvent.getKey());

        if (keyEvent.getKey()==KEY_DOWN) {
            comType = "command";
            req.makeRequest("on");
        }
        if (keyEvent.getKey()==KEY_UP) {
            comType = "command";
            req.makeRequest("off");
        }
        if (keyEvent.getKey()==5) {
            myTimer.start(method(:timerCallback), 1000, true);
        }
        return true;
    }

}