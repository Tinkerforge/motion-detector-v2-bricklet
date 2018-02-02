#!/usr/bin/perl

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletMotionDetectorV2;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change XYZ to the UID of your Motion Detector Bricklet 2.0

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $md = Tinkerforge::BrickletMotionDetectorV2->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Turn blue backlight LEDs on (maximum brightness)
$md->set_indicator(255, 255, 255);

print "Press key to exit\n";
<STDIN>;
$ipcon->disconnect();
