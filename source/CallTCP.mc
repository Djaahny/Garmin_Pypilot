using Toybox.System;
using Toybox.Communications;
using Toybox.Application as App;
using Toybox.Lang;
import Toybox.WatchUi;

    var url = "http://192.168.1.103:5500/";

class WebRequest {

    var kdata = "no data!" as Lang.String;
    var newData = false as Lang.Boolean;



    // set up the response callback function
    function onReceive(responseCode as Lang.Number, data as Lang.String) as Void
    { 
        if (responseCode == 200) {
            System.println("Request Successful");                   // print success
            kdata = data;
            System.println(kdata);
            //WatchUi.switchToView(new screen2View(data), new PypilotcommandMenuDelegate(), WatchUi.SLIDE_UP);
        }
        else {
            System.println("Response: " + responseCode);            // print response code
            kdata = "no data!";
            //data = "data ver";
            //This is mostlikely the body of the messages that is formated wrong if we get a -400
        }
        newData = true;
        WatchUi.requestUpdate();




    }

    function makeRequest(command) {
        newData = false;
        var params = {                                              // set the parameters
                comType => command
        };
        var options = {                                             // set the options
            "method" => Communications.HTTP_REQUEST_METHOD_GET,      // set HTTP method
            // "headers" => {                                           // set headers
            //                 "Content-Type" => Communications.REQUEST_CONTENT_TYPE_URL_ENCODED
                //            },
                                                                    // set response type
            "responseType" => Communications.HTTP_RESPONSE_CONTENT_TYPE_TEXT_PLAIN};

        var responseCallback = method(:onReceive);                  // set responseCallback to
                                                                    // onReceive() method
        // Make the Communications.makeWebRequest() call
        System.println("looking up: " +url);
        Communications.makeWebRequest(url, params, options, responseCallback);
    }
}