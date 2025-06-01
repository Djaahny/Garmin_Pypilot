import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.Timer;
import Toybox.Graphics;



var req = new WebRequest();
var myCount =  0;
var IP as Array<Number> = [255, 255, 255, 255];
var view = "autopilot";
var comType = "data";


function splitString(s as String, delimiter as String) as Array<String> {
    var result = [] as Array<String>;
    var search = s;

    var index = search.find(delimiter);
    while (index != null) {
        result.add(search.substring(0, index));
        search = search.substring(index + delimiter.length(), null); // remainder after delimiter
        index = search.find(delimiter); // find next
    }

    // Add remaining part
    result.add(search);

    return result;
}

function updateURL() as Void {
            url = "http://" + IP[0].toString() + "." + IP[1].toString() + "." + IP[2].toString() + "." + IP[3].toString() + ":5500/";
}

function drawStatus(view) as Void {
    var label = view.findDrawableById("autopilot") as WatchUi.Text;
    var parts = splitString(req.kdata, ",");
    var status = parts[0];
    if (label != null) {
        if (status.toNumber() == 1) {
            label.setText("ON!");
            label.setColor(Graphics.COLOR_GREEN);
        }
        else {
            label.setText("OFF!");
            label.setColor(Graphics.COLOR_RED);
        }
    }
}

class PypilotcommandApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
        loadip();//load the IP from the storage and set it in a global var - if no IP set Default and load SETUP view
        //System.println("here:" + IP[0].toString() +" doh");
        //System.println(Properties.getValue("IPSeg1"));
        updateURL();

    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        //return [ new PypilotcommandView(), new PypilotcommandDelegate() ];
        return [ new PypilotcommandView(), new PypilotcommandDelegate() ];

    }

}

function getApp() as PypilotcommandApp {
    return Application.getApp() as PypilotcommandApp;
}

function loadip() as Void {
    IP[0] = Properties.getValue("IPSeg1");
    IP[1] = Properties.getValue("IPSeg2");
    IP[2] = Properties.getValue("IPSeg3");
    IP[3] = Properties.getValue("IPSeg4");
    for (var i = 0; i < 4; i += 1) {
        if (IP[i] == null) {
            IP[i] = 255;
        }
    }
}