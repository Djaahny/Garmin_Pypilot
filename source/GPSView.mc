import Toybox.Graphics;
import Toybox.WatchUi;
using Toybox.Time;
using Toybox.System;
using Toybox.Attention;



class GPSView extends WatchUi.View {

    var timeLabel;

   function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.GPSLayout(dc));
        timeLabel = View.findDrawableById("timeLabel");
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        var myTime = System.getClockTime(); // ClockTime object
        timeLabel.setText(myTime.hour.format("%02d") + ":" + myTime.min.format("%02d") + ":" + myTime.sec.format("%02d"));
        if (myTime.sec.equals(59)) {
            Attention.playTone(Attention.TONE_LOUD_BEEP);
            var vibePattern = [ new Attention.VibeProfile(50, 500) ];
            Attention.vibrate(vibePattern);
        }
        View.onUpdate(dc);
        //dc.clear();
        WatchUi.requestUpdate();


    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
