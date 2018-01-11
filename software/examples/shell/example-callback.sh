#!/bin/sh
# Connects to localhost:4223 by default, use --host and --port to change this

uid=XYZ # Change XYZ to the UID of your Motion Detector Bricklet 2.0

# Handle incoming motion detected callbacks
tinkerforge dispatch motion-detector-v2-bricklet $uid motion-detected\
 --execute "echo Motion Detected" &

# Handle incoming detection cycle ended callbacks
tinkerforge dispatch motion-detector-v2-bricklet $uid detection-cycle-ended\
 --execute "echo Detection Cycle Ended (next detection possible in ~2 seconds)" &

echo "Press key to exit"; read dummy

kill -- -$$ # Stop callback dispatch in background
