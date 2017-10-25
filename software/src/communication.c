/* motion-detector-v2-bricklet
 * Copyright (C) 2017 Olaf Lüke <olaf@tinkerforge.com>
 *
 * communication.c: TFP protocol message handling
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

#include "communication.h"

#include "bricklib2/utility/communication_callback.h"
#include "bricklib2/protocols/tfp/tfp.h"

#include "am612.h"

extern AM612 am612;

BootloaderHandleMessageResponse handle_message(const void *message, void *response) {
	switch(tfp_get_fid_from_message(message)) {
		case FID_GET_MOTION_DETECTED: return get_motion_detected(message, response);
		case FID_SET_SENSITIVITY: return set_sensitivity(message);
		case FID_GET_SENSITIVITY: return get_sensitivity(message, response);
		case FID_SET_INDICATOR: return set_indicator(message);
		case FID_GET_INDICATOR: return get_indicator(message, response);
		default: return HANDLE_MESSAGE_RESPONSE_NOT_SUPPORTED;
	}
}


BootloaderHandleMessageResponse get_motion_detected(const GetMotionDetected *data, GetMotionDetected_Response *response) {
	response->header.length = sizeof(GetMotionDetected_Response);
	response->motion = am612.vout;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_sensitivity(const SetSensitivity *data) {
	if(data->sensitivity > 100) {
		return HANDLE_MESSAGE_RESPONSE_INVALID_PARAMETER;
	}

	am612.sensitivity = data->sensitivity;

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_sensitivity(const GetSensitivity *data, GetSensitivity_Response *response) {
	response->header.length = sizeof(GetSensitivity_Response);
	response->sensitivity   = am612.sensitivity;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}

BootloaderHandleMessageResponse set_indicator(const SetIndicator *data) {
	am612.top_left  = data->top_left;
	am612.top_right = data->top_right;
	am612.bottom    = data->bottom;

	return HANDLE_MESSAGE_RESPONSE_EMPTY;
}

BootloaderHandleMessageResponse get_indicator(const GetIndicator *data, GetIndicator_Response *response) {
	response->header.length = sizeof(GetIndicator_Response);
	response->top_left      = am612.top_left;
	response->top_right     = am612.top_right;
	response->bottom        = am612.bottom;

	return HANDLE_MESSAGE_RESPONSE_NEW_MESSAGE;
}



bool handle_motion_detected_callback(void) {
	static bool is_buffered = false;
	static MotionDetected_Callback cb;

	if(!is_buffered) {
		if(am612.send_motion_detected) {
			tfp_make_default_header(&cb.header, bootloader_get_uid(), sizeof(MotionDetected_Callback), FID_CALLBACK_MOTION_DETECTED);
			am612.send_motion_detected = false;
		} else {
			return false;
		}
	}

	if(bootloader_spitfp_is_send_possible(&bootloader_status.st)) {
		bootloader_spitfp_send_ack_and_message(&bootloader_status, (uint8_t*)&cb, sizeof(MotionDetected_Callback));
		is_buffered = false;
		return true;
	} else {
		is_buffered = true;
	}

	return false;
}

bool handle_detection_cycle_ended_callback(void) {
	static bool is_buffered = false;
	static DetectionCycleEnded_Callback cb;

	if(!is_buffered) {
		if(am612.send_detection_cycle_ended) {
			tfp_make_default_header(&cb.header, bootloader_get_uid(), sizeof(DetectionCycleEnded_Callback), FID_CALLBACK_DETECTION_CYCLE_ENDED);
			am612.send_detection_cycle_ended = false;
		} else {
			return false;
		}
	}

	if(bootloader_spitfp_is_send_possible(&bootloader_status.st)) {
		bootloader_spitfp_send_ack_and_message(&bootloader_status, (uint8_t*)&cb, sizeof(DetectionCycleEnded_Callback));
		is_buffered = false;
		return true;
	} else {
		is_buffered = true;
	}

	return false;
}

void communication_tick(void) {
	communication_callback_tick();
}

void communication_init(void) {
	communication_callback_init();
}
