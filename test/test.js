const fz = require('zigbee-herdsman-converters/converters/fromZigbee');
const tz = require('zigbee-herdsman-converters/converters/toZigbee');
const exposes = require('zigbee-herdsman-converters/lib/exposes');
const reporting = require('zigbee-herdsman-converters/lib/reporting');
const extend = require('zigbee-herdsman-converters/lib/extend');
const e = exposes.presets;
const ea = exposes.access;

const definition = {
    zigbeeModel: ['HY0123'],
    model: 'IHG4210',
    vendor: 'HONYAR',
    description: 'MiJia temperature & humidity sensor',
    fromZigbee: [fz.battery, fz.temperature, fz.humidity], 
    toZigbee: [],
    exposes: [e.battery(), e.temperature(), e.humidity()],
};

module.exports = definition;


// const fz = require('zigbee-herdsman-converters/converters/fromZigbee');
// const tz = require('zigbee-herdsman-converters/converters/toZigbee');
// const exposes = require('zigbee-herdsman-converters/lib/exposes');
// const reporting = require('zigbee-herdsman-converters/lib/reporting');
// const extend = require('zigbee-herdsman-converters/lib/extend');
// const e = exposes.presets;
// const ea = exposes.access;

// const definition = {
//     zigbeeModel: ['HY0123'],
//     model: 'IHG4210',
//     vendor: 'HONYAR',
//     description: 'HONYAR temperature & humidity sensor',
//     meta: {battery: {voltageToPercentage: '3V_2100'}},
//     fromZigbee: [fz.battery, fz.temperature, fz.humidity],
//     toZigbee: [],
//     exposes: [e.battery(), e.temperature(), e.humidity(), e.battery_voltage()]
// };