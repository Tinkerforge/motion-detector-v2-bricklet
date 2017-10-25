/* motion-detector-v2-bricklet
 * Copyright (C) 2017 Olaf Lüke <olaf@tinkerforge.com>
 *
 * am612.c: AM612 PIR Sensor driver
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

#include "am612.h"

#include "configs/config_am612.h"

#include "bricklib2/logging/logging.h"
#include "bricklib2/hal/ccu4_pwm/ccu4_pwm.h"

#include "xmc_gpio.h"

AM612 am612;

void am612_init(void) {
	const XMC_GPIO_CONFIG_t enable_pin_config = {
		.mode         = XMC_GPIO_MODE_OUTPUT_PUSH_PULL,
		.output_level = XMC_GPIO_OUTPUT_LEVEL_HIGH,
	};
	XMC_GPIO_Init(AM612_ENABLE_PIN, &enable_pin_config);

	const XMC_GPIO_CONFIG_t vout_pin_config = {
		.mode             = XMC_GPIO_MODE_INPUT_TRISTATE,
		.input_hysteresis = XMC_GPIO_INPUT_HYSTERESIS_LARGE,
	};
	XMC_GPIO_Init(AM612_VOUT_PIN, &vout_pin_config);

	ccu4_pwm_init(AM612_SENSITIVITY_PIN, AM612_SENSITIVITY_CCU4_SLICE, 400);

	ccu4_pwm_init(LED_TOP_LEFT_PIN,  LED_TOP_LEFT_CCU4_SLICE,  LED_PERIOD_VALUE);
	ccu4_pwm_init(LED_TOP_RIGHT_PIN, LED_TOP_RIGHT_CCU4_SLICE, LED_PERIOD_VALUE);
	ccu4_pwm_init(LED_BOTTOM_PIN,    LED_BOTTOM_CCU4_SLICE,    LED_PERIOD_VALUE);

	memset(&am612, 0, sizeof(AM612));
	am612.sensitivity = 50;
	am612.sensivitity_last = 255;
}

void am612_tick(void) {
	if(am612.sensitivity != am612.sensivitity_last) {
		ccu4_pwm_set_duty_cycle(AM612_SENSITIVITY_CCU4_SLICE, 300 + am612.sensitivity);
		am612.sensivitity_last = am612.sensitivity;
		logd("AM612: New sens %u\n\r", am612.sensitivity);
	}

	if(am612.top_left != am612.top_left_last) {
		ccu4_pwm_set_duty_cycle(LED_TOP_LEFT_CCU4_SLICE, am612.top_left);
		am612.top_left_last = am612.top_left;
		logd("AM612: New top_left %u\n\r", am612.top_left);
	}

	if(am612.top_right != am612.top_right_last) {
		ccu4_pwm_set_duty_cycle(LED_TOP_RIGHT_CCU4_SLICE, am612.top_right);
		am612.top_right_last = am612.top_right;
		logd("AM612: New top_right %u\n\r", am612.top_right);
	}

	if(am612.bottom != am612.bottom_last) {
		ccu4_pwm_set_duty_cycle(LED_BOTTOM_CCU4_SLICE, am612.bottom);
		am612.bottom_last = am612.bottom;
		logd("AM612: New bottom %u\n\r", am612.bottom);
	}

	bool new_vout = XMC_GPIO_GetInput(AM612_VOUT_PIN);
	if(new_vout != am612.vout) {
		if(new_vout) {
			am612.send_motion_detected = true;
		} else {
			am612.send_detection_cycle_ended = true;
		}
		logd("AM612: New vout %u\n\r", new_vout);
		am612.vout = new_vout;
	}

}
