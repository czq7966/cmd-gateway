const fs = require("fs");
const path = require("path");

// 方法五 copyFile 
const fromFileName = path.resolve(__dirname, "10-mqtt.js");
const toFileName = path.resolve(__dirname, "../../node_modules/@node-red/nodes/core/network/10-mqtt.js");

fs.copyFileSync(fromFileName, toFileName);
