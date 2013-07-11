#!/usr/bin/node

var b = require('bonescript');

b.getPlatform(printData);
function printData(x) {
    console.log('name = ' + x.name);
    console.log('version = ' + x.version);
    console.log('serialNumber = ' + x.serialNumber);
    console.log('bonescript = ' + x.bonescript);
    console.log();
}

b.pinMode("P9_11", b.OUTPUT, 7, 'pullup', 'slow');
b.pinMode("P9_13", b.OUTPUT, 7, 'pullup', 'slow');
b.pinMode("P9_15", b.OUTPUT, 7, 'pullup', 'slow');
b.pinMode("P9_17", b.OUTPUT, 7, 'pullup', 'slow');

b.getPinMode("P9_11", printPinMux);
b.getPinMode("P9_13", printPinMux);
b.getPinMode("P9_15", printPinMux);
b.getPinMode("P9_17", printPinMux);

function printPinMux(x) {
    console.log('mux = ' + x.mux);
    console.log('pullup = ' + x.pullup);
    console.log('slew = ' + x.slew);
    if(x.options) {
        console.log('options = ' + x.options.join(','));
    }
    console.log('pin = ' + x.pin);
    console.log('name = ' + x.name);
    console.log('err = ' + x.err);
    console.log();
}
