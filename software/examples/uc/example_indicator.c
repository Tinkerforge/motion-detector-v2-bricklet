// This example is not self-contained.
// It requres usage of the example driver specific to your platform.
// See the HAL documentation.

#include "bindings/hal_common.h"
#include "bindings/bricklet_motion_detector_v2.h"

#define UID "XYZ" // Change XYZ to the UID of your Motion Detector Bricklet 2.0

void check(int rc, const char* msg);

void example_setup(TF_HAL *hal);
void example_loop(TF_HAL *hal);


static TF_MotionDetectorV2 md;

void example_setup(TF_HAL *hal) {
	// Create device object
	check(tf_motion_detector_v2_create(&md, UID, hal), "create device object");

	// Turn blue backlight LEDs on (maximum brightness)
	check(tf_motion_detector_v2_set_indicator(&md, 255, 255, 255), "call set_indicator");
}

void example_loop(TF_HAL *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
