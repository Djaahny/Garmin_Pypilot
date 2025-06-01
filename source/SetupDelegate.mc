import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Timer;

//read the ip from the screen
// press menu and activate firste number - change color
// press menu again and next number - continue to end
// at last press the IP is stored in the storage memery

var seg_num = 0;

class SetupDelegate extends WatchUi.BehaviorDelegate {




    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new PypilotcommandMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }
    
    function onKey(keyEvent as KeyEvent) as Boolean {
        if (keyEvent.getKey()==KEY_DOWN) {
            if (IP[seg_num]>0) {
                IP[seg_num] = IP[seg_num]-1;
            }
            WatchUi.requestUpdate();
        }

        if (keyEvent.getKey()==KEY_UP) {
            if (IP[seg_num]<255) {
                IP[seg_num] = IP[seg_num]+1;
            }
            WatchUi.requestUpdate();
        }

        if (keyEvent.getKey()==5) {
        }
        if (keyEvent.getKey()==4) {
            if (seg_num<3) {
                seg_num = seg_num +1;
            }
            else {
                seg_num = 0;
            }
            WatchUi.requestUpdate();

        }
        return true;
    }

}