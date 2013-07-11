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
b.pinMode("P9_19", b.OUTPUT, 7, 'pullup', 'slow');
b.pinMode("P9_25", b.OUTPUT, 7, 'pullup', 'slow');

b.getPinMode("P9_11", printPinMux);
b.getPinMode("P9_13", printPinMux);
b.getPinMode("P9_19", printPinMux);
b.getPinMode("P9_25", printPinMux);

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
