import Toybox.Graphics;
import Toybox.WatchUi;
using Toybox.System;

class webReturnView extends WatchUi.View {

    hidden var _message;


    function initialize(message) {
        View.initialize();
        _message = message;
        System.println(message);
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.SpeedLayout(dc));
        var label = View.findDrawableById("webrtn") as WatchUi.Text;
        if (label != null) {
            label.setText(_message);
        }

    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        //dc.clear();

    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}