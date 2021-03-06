/* motion-detector-v2-bricklet
 * Copyright (C) 2017 Olaf Lüke <olaf@tinkerforge.com>
 *
 * communication.h: TFP protocol message handling
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#ifndef COMMUNICATION_H
#define COMMUNICATION_H

#include <stdint.h>
#include <stdbool.h>

#include "bricklib2/protocols/tfp/tfp.h"
#include "bricklib2/bootloader/bootloader.h"

// Default functions
BootloaderHandleMessageResponse handle_message(const void *data, void *response);
void communication_tick(void);
void communication_init(void);

// Constants
#define MOTION_DETECTOR_V2_MOTION_NOT_DETECTED 0
#define MOTION_DETECTOR_V2_MOTION_DETECTED 1

#define MOTION_DETECTOR_V2_BOOTLOADER_MODE_BOOTLOADER 0
#define MOTION_DETECTOR_V2_BOOTLOADER_MODE_FIRMWARE 1
#define MOTION_DETECTOR_V2_BOOTLOADER_MODE_BOOTLOADER_WAIT_FOR_REBOOT 2
#define MOTION_DETECTOR_V2_BOOTLOADER_MODE_FIRMWARE_WAIT_FOR_REBOOT 3
#define MOTION_DETECTOR_V2_BOOTLOADER_MODE_FIRMWARE_WAIT_FOR_ERASE_AND_REBOOT 4

#define MOTION_DETECTOR_V2_BOOTLOADER_STATUS_OK 0
#define MOTION_DETECTOR_V2_BOOTLOADER_STATUS_INVALID_MODE 1
#define MOTION_DETECTOR_V2_BOOTLOADER_STATUS_NO_CHANGE 2
#define MOTION_DETECTOR_V2_BOOTLOADER_STATUS_ENTRY_FUNCTION_NOT_PRESENT 3
#define MOTION_DETECTOR_V2_BOOTLOADER_STATUS_DEVICE_IDENTIFIER_INCORRECT 4
#define MOTION_DETECTOR_V2_BOOTLOADER_STATUS_CRC_MISMATCH 5

#define MOTION_DETECTOR_V2_STATUS_LED_CONFIG_OFF 0
#define MOTION_DETECTOR_V2_STATUS_LED_CONFIG_ON 1
#define MOTION_DETECTOR_V2_STATUS_LED_CONFIG_SHOW_HEARTBEAT 2
#define MOTION_DETECTOR_V2_STATUS_LED_CONFIG_SHOW_STATUS 3

// Function and callback IDs and structs
#define FID_GET_MOTION_DETECTED 1
#define FID_SET_SENSITIVITY 2
#define FID_GET_SENSITIVITY 3
#define FID_SET_INDICATOR 4
#define FID_GET_INDICATOR 5

#define FID_CALLBACK_MOTION_DETECTED 6
#define FID_CALLBACK_DETECTION_CYCLE_ENDED 7

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetMotionDetected;

typedef struct {
	TFPMessageHeader header;
	uint8_t motion;
} __attribute__((__packed__)) GetMotionDetected_Response;

typedef struct {
	TFPMessageHeader header;
	uint8_t sensitivity;
} __attribute__((__packed__)) SetSensitivity;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetSensitivity;

typedef struct {
	TFPMessageHeader header;
	uint8_t sensitivity;
} __attribute__((__packed__)) GetSensitivity_Response;

typedef struct {
	TFPMessageHeader header;
	uint8_t top_left;
	uint8_t top_right;
	uint8_t bottom;
} __attribute__((__packed__)) SetIndicator;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) GetIndicator;

typedef struct {
	TFPMessageHeader header;
	uint8_t top_left;
	uint8_t top_right;
	uint8_t bottom;
} __attribute__((__packed__)) GetIndicator_Response;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) MotionDetected_Callback;

typedef struct {
	TFPMessageHeader header;
} __attribute__((__packed__)) DetectionCycleEnded_Callback;


// Function prototypes
BootloaderHandleMessageResponse get_motion_detected(const GetMotionDetected *data, GetMotionDetected_Response *response);
BootloaderHandleMessageResponse set_sensitivity(const SetSensitivity *data);
BootloaderHandleMessageResponse get_sensitivity(const GetSensitivity *data, GetSensitivity_Response *response);
BootloaderHandleMessageResponse set_indicator(const SetIndicator *data);
BootloaderHandleMessageResponse get_indicator(const GetIndicator *data, GetIndicator_Response *response);

// Callbacks
bool handle_motion_detected_callback(void);
bool handle_detection_cycle_ended_callback(void);

#define COMMUNICATION_CALLBACK_TICK_WAIT_MS 1
#define COMMUNICATION_CALLBACK_HANDLER_NUM 2
#define COMMUNICATION_CALLBACK_LIST_INIT \
	handle_motion_detected_callback, \
	handle_detection_cycle_ended_callback, \


#endif
