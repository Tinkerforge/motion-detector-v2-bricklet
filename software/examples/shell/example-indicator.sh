#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Motion Detector Bricklet 2.0

# Turn blue backlight LEDs on (maximum brightness)
tinkerforge call motion-detector-v2-bricklet $uid set-indicator 255 255 255
