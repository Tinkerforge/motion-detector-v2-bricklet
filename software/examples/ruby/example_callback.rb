#!/usr/bin/env ruby
# -*- ruby encoding: utf-8 -*-

require 'tinkerforge/ip_connection'
require 'tinkerforge/bricklet_motion_detector_v2'

include Tinkerforge

HOST = 'localhost'
PORT = 4223
UID = 'XYZ' # Change XYZ to the UID of your Motion Detector Bricklet 2.0

ipcon = IPConnection.new # Create IP connection
md = BrickletMotionDetectorV2.new UID, ipcon # Create device object

ipcon.connect HOST, PORT # Connect to brickd
# Don't use device before ipcon is connected

# Register motion detected callback
md.register_callback(BrickletMotionDetectorV2::CALLBACK_MOTION_DETECTED) do
  puts 'Motion Detected'
end

# Register detection cycle ended callback
md.register_callback(BrickletMotionDetectorV2::CALLBACK_DETECTION_CYCLE_ENDED) do
  puts 'Detection Cycle Ended (next detection possible in ~2 seconds)'
end

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
