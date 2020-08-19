

#include "bindings/hal_common.h"
#include "bindings/bricklet_motion_detector_v2.h"

#define UID "XYZ" // Change XYZ to the UID of your Motion Detector Bricklet 2.0

void check(int rc, const char* msg);



// Callback function for motion detected callback
void motion_detected_handler(TF_MotionDetectorV2 *device, void *user_data) {
	(void)device; (void)user_data; // avoid unused parameter warning

	tf_hal_printf("Motion Detected\n");
}

// Callback function for detection cycle ended callback
void detection_cycle_ended_handler(TF_MotionDetectorV2 *device, void *user_data) {
	(void)device; (void)user_data; // avoid unused parameter warning

	tf_hal_printf("Detection Cycle Ended (next detection possible in ~2 seconds)\n");
}


TF_MotionDetectorV2 md;

void example_setup(TF_HalContext *hal) {
	// Create device object
	check(tf_motion_detector_v2_create(&md, UID, hal), "create device object");


	// Register motion detected callback to function motion_detected_handler
	tf_motion_detector_v2_register_motion_detected_callback(&md,
	                                                       motion_detected_handler,
	                                                       NULL);

	// Register detection cycle ended callback to function detection_cycle_ended_handler
	tf_motion_detector_v2_register_detection_cycle_ended_callback(&md,
	                                                             detection_cycle_ended_handler,
	                                                             NULL);

}

void example_loop(TF_HalContext *hal) {
	// Poll for callbacks
	tf_hal_callback_tick(hal, 0);
}
