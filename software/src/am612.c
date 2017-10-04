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

	ccu4_pwm_init(LED_RED_PIN,   LED_RED_CCU4_SLICE,   LED_PERIOD_VALUE);
	ccu4_pwm_init(LED_GREEN_PIN, LED_GREEN_CCU4_SLICE, LED_PERIOD_VALUE);
	ccu4_pwm_init(LED_BLUE_PIN,  LED_BLUE_CCU4_SLICE,  LED_PERIOD_VALUE);

	memset(&am612, 0, sizeof(AM612));
}

void am612_tick(void) {
	if(am612.red != am612.red_last) {
		ccu4_pwm_set_duty_cycle(LED_RED_CCU4_SLICE, am612.red);
		am612.red_last = am612.red;
		logd("AM612: New red %u\n\r", am612.red);
	}

	if(am612.green != am612.green_last) {
		ccu4_pwm_set_duty_cycle(LED_GREEN_CCU4_SLICE, am612.green);
		am612.green_last = am612.green;
		logd("AM612: New green %u\n\r", am612.green);
	}

	if(am612.blue != am612.blue_last) {
		ccu4_pwm_set_duty_cycle(LED_BLUE_CCU4_SLICE, am612.blue);
		am612.blue_last = am612.blue;
		logd("AM612: New blue %u\n\r", am612.blue);
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
