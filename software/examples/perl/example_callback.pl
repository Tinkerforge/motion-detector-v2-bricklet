#!/usr/bin/perl

use Tinkerforge::IPConnection;
use Tinkerforge::BrickletMotionDetectorV2;

use constant HOST => 'localhost';
use constant PORT => 4223;
use constant UID => 'XYZ'; # Change XYZ to the UID of your Motion Detector Bricklet 2.0

# Callback subroutine for motion detected callback
sub cb_motion_detected
{
    print "Motion Detected\n";
}

# Callback subroutine for detection cycle ended callback
sub cb_detection_cycle_ended
{
    print "Detection Cycle Ended (next detection possible in ~2 seconds)\n";
}

my $ipcon = Tinkerforge::IPConnection->new(); # Create IP connection
my $md = Tinkerforge::BrickletMotionDetectorV2->new(&UID, $ipcon); # Create device object

$ipcon->connect(&HOST, &PORT); # Connect to brickd
# Don't use device before ipcon is connected

# Register motion detected callback to subroutine cb_motion_detected
$md->register_callback($md->CALLBACK_MOTION_DETECTED, 'cb_motion_detected');

# Register detection cycle ended callback to subroutine cb_detection_cycle_ended
$md->register_callback($md->CALLBACK_DETECTION_CYCLE_ENDED, 'cb_detection_cycle_ended');

print "Press key to exit\n";
<STDIN>;
$ipcon->disconnect();
