/* motion-detector-v2-bricklet
 * Copyright (C) 2017 Olaf Lüke <olaf@tinkerforge.com>
 *
 * am612.h: AM612 PIR Sensor driver
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

#ifndef AM612_H
#define AM612_H

#include <stdint.h>
#include <stdbool.h>

typedef struct {
	bool vout;
	bool send_motion_detected;
	bool send_detection_cycle_ended;

	uint8_t sensitivity;
	uint8_t sensivitity_last;

	uint8_t red;
	uint8_t green;
	uint8_t blue;

	uint8_t red_last;
	uint8_t green_last;
	uint8_t blue_last;
} AM612;

void am612_init(void);
void am612_tick(void);

#endif
