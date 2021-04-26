const fs = require("fs");
const path = require("path");


const fromFileName = path.resolve(__dirname, "10-mqtt.js");
const toFileName = path.resolve(__dirname, "../../node_modules/@node-red/nodes/core/network/10-mqtt.js");

const files = new Map();
files.set(  path.resolve(__dirname, "node_modules/@node-red/nodes/core/network/10-mqtt.js"), 
            path.resolve(__dirname, "../../node_modules/@node-red/nodes/core/network/10-mqtt.js"));
files.set(  path.resolve(__dirname, "data/node_modules/gree-hvac-client/lib/client.js"), 
            path.resolve(__dirname, "../../data/node_modules/gree-hvac-client/lib/client.js"));


files.forEach((toFileName, fromFileName) => {
  console.log(fromFileName + " = " + toFileName);
  fs.copyFileSync(fromFileName, toFileName);
}, files);
