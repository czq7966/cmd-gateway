// let onoff = require("onoff");

// let pin = new onoff.Gpio(13, "in");


// let state = 0
// while(1) {
//             let val = pin.readSync();
//             if (val != state) {
//                             console.log(val);
//                             state = val;
//                         }
            
// }


for (let index = 1; index < 256; index++){
    console.log("ping 192.168.50." + index + " -n 1")
}

    