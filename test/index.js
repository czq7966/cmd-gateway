let onoff = require("onoff");

let pin = new onoff.Gpio(13, "in");


let state = 0
while(1) {
            let val = pin.readSync();
            if (val != state) {
                            console.log(val);
                            state = val;
                        }
            
}