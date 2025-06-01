import Toybox.Graphics;
import Toybox.WatchUi;

class windView extends WatchUi.View {

       function initialize() {
        View.initialize();
    }


    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WindLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        if (comType.equals("command") == true) {
            drawStatus(self);
            View.onUpdate(dc);
            return;
        }
        // Call the parent onUpdate function to redraw the layout
        if (req.newData) {
            var parts = splitString(req.kdata, ",");
            var status = parts[0];
            var tws = parts[1];
            var twa = parts[2];
            var spd = parts[3];

            var label = View.findDrawableById("autopilot") as WatchUi.Text;
            var twsLabel = View.findDrawableById("TWSLabel") as WatchUi.Text;
            var twaLabel = View.findDrawableById("TWALabel") as WatchUi.Text;
            var spdLabel = View.findDrawableById("SPDLabel") as WatchUi.Text;
            
            if (label != null) {
                if (status.toNumber() == 1) {
                    label.setText("ON!");
                    label.setColor(Graphics.COLOR_GREEN);
                }
                else {
                    label.setText("OFF!");
                    label.setColor(Graphics.COLOR_RED);
                }
                twsLabel.setText(tws);
                twaLabel.setText(twa+ "°");
                spdLabel.setText(spd);
            }
        }
        View.onUpdate(dc);
        //dc.clear();

    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
