<?php

require_once('Tinkerforge/IPConnection.php');
require_once('Tinkerforge/BrickletMotionDetectorV2.php');

use Tinkerforge\IPConnection;
use Tinkerforge\BrickletMotionDetectorV2;

const HOST = 'localhost';
const PORT = 4223;
const UID = 'XYZ'; // Change XYZ to the UID of your Motion Detector Bricklet 2.0

$ipcon = new IPConnection(); // Create IP connection
$md = new BrickletMotionDetectorV2(UID, $ipcon); // Create device object

$ipcon->connect(HOST, PORT); // Connect to brickd
// Don't use device before ipcon is connected

// Turn blue backlight LEDs on (maximum brightness)
$md->setIndicator(255, 255, 255);

echo "Press key to exit\n";
fgetc(fopen('php://stdin', 'r'));
$ipcon->disconnect();

?>
