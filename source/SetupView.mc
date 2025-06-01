import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Application;


var IPseg1;
var IPseg2;
var IPseg3;
var IPseg4;

class SetupView extends WatchUi.View {

   function initialize() {
        View.initialize();
    }
    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.SetupLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        printIP();
    }


    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        printIP();
        View.onUpdate(dc);
        //dc.clear();

    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void { 
        Properties.setValue("IPSeg1",IP[0].toString());
        Properties.setValue("IPSeg2",IP[1].toString());
        Properties.setValue("IPSeg3",IP[2].toString());
        Properties.setValue("IPSeg4",IP[3].toString());
        updateURL();
        /////// write code to save the IP!!!!
    }

    function printIP() as Void {
        var label = View.findDrawableById("seg1") as WatchUi.Text;
        if (label != null) {
            label.setText(IP[0].toString());
            if (seg_num == 0) {
                label.setColor(Graphics.COLOR_GREEN);
                label = View.findDrawableById("seg4") as WatchUi.Text;
                label.setColor(Graphics.COLOR_WHITE);
            }
        }
        label = View.findDrawableById("seg2") as WatchUi.Text;
        if (label != null) {
            label.setText(IP[1].toString());
            if (seg_num == 1) {
                label.setColor(Graphics.COLOR_GREEN);
                label = View.findDrawableById("seg1") as WatchUi.Text;
                label.setColor(Graphics.COLOR_WHITE);
            }
        }
        label = View.findDrawableById("seg3") as WatchUi.Text;
        if (label != null) {
            label.setText(IP[2].toString());
            if (seg_num == 2) {
                label.setColor(Graphics.COLOR_GREEN);
                label = View.findDrawableById("seg2") as WatchUi.Text;
                label.setColor(Graphics.COLOR_WHITE);
            }
        }
        label = View.findDrawableById("seg4") as WatchUi.Text;
        if (label != null) {
            label.setText(IP[3].toString());
            if (seg_num == 3) {
                label.setColor(Graphics.COLOR_GREEN);
                label = View.findDrawableById("seg3") as WatchUi.Text;
                label.setColor(Graphics.COLOR_WHITE);
            }
        }
    }

}

