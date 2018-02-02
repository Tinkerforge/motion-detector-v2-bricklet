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

# Turn blue backlight LEDs on (maximum brightness)
md.set_indicator 255, 255, 255

puts 'Press key to exit'
$stdin.gets
ipcon.disconnect
