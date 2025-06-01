import Toybox.Graphics;
import Toybox.WatchUi;

class PypilotcommandView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        comType = "data";
        req.makeRequest("status");
        
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        if (comType.equals("command") == true) {
            drawStatus(self);
            View.onUpdate(dc);
            return;
        }

        if (req.newData) {
            var parts = splitString(req.kdata, ",");
            var status = parts[0];
            var hdg = parts[1];
            var diff = parts[2];

            var label = View.findDrawableById("autopilot") as WatchUi.Text;
            var hdgLabel = View.findDrawableById("hdg") as WatchUi.Text;
            var diffLabel = View.findDrawableById("hdgDiff") as WatchUi.Text;
            
            if (label != null) {
                if (status.toNumber() == 1) {
                    label.setText("ON!");
                    label.setColor(Graphics.COLOR_GREEN);
                    diffLabel.setText(diff+ "°");
                }
                else {
                    label.setText("OFF!");
                    label.setColor(Graphics.COLOR_RED);
                    diffLabel.setText("---"+ "°");
                }
                hdgLabel.setText(hdg+ "°");
            }
        }
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
