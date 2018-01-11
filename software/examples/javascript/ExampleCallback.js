var Tinkerforge = require('tinkerforge');

var HOST = 'localhost';
var PORT = 4223;
var UID = 'XYZ'; // Change XYZ to the UID of your Motion Detector Bricklet 2.0

var ipcon = new Tinkerforge.IPConnection(); // Create IP connection
var md = new Tinkerforge.BrickletMotionDetectorV2(UID, ipcon); // Create device object

ipcon.connect(HOST, PORT,
    function (error) {
        console.log('Error: ' + error);
    }
); // Connect to brickd
// Don't use device before ipcon is connected

// Register motion detected callback
md.on(Tinkerforge.BrickletMotionDetectorV2.CALLBACK_MOTION_DETECTED,
    // Callback function for motion detected callback
    function () {
        console.log('Motion Detected');
    }
);

// Register detection cycle ended callback
md.on(Tinkerforge.BrickletMotionDetectorV2.CALLBACK_DETECTION_CYCLE_ENDED,
    // Callback function for detection cycle ended callback
    function () {
        console.log('Detection Cycle Ended (next detection possible in ~2 seconds)');
    }
);

console.log('Press key to exit');
process.stdin.on('data',
    function (data) {
        ipcon.disconnect();
        process.exit(0);
    }
);
