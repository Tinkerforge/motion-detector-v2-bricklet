package main

import (
	"fmt"
	"github.com/Tinkerforge/go-api-bindings/ipconnection"
	"github.com/Tinkerforge/go-api-bindings/motion_detector_v2_bricklet"
)

const ADDR string = "localhost:4223"
const UID string = "XYZ" // Change XYZ to the UID of your Motion Detector Bricklet 2.0.

func main() {
	ipcon := ipconnection.New()
	defer ipcon.Close()
	md, _ := motion_detector_v2_bricklet.New(UID, &ipcon) // Create device object.

	ipcon.Connect(ADDR) // Connect to brickd.
	defer ipcon.Disconnect()
	// Don't use device before ipcon is connected.

	// Turn blue backlight LEDs on (maximum brightness)
	md.SetIndicator(255, 255, 255)

	fmt.Print("Press enter to exit.")
	fmt.Scanln()
}
