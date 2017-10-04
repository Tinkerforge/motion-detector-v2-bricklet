/* motion-detector-v2-bricklet
 * Copyright (C) 2017 Olaf Lüke <olaf@tinkerforge.com>
 *
 * mcp4018.h: MCP4018 I2C potentiometer driver
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

#ifndef MCP4018_H
#define MCP4018_H

#include <stdint.h>

#include "bricklib2/hal/i2c_fifo/i2c_fifo.h"

typedef struct {
	uint8_t value;
	uint8_t value_last;
	I2CFifo i2c_fifo;
} MCP4018;

void mcp4018_set_value(const uint8_t value);
void mcp4018_init(void);
void mcp4018_tick(void);

#endif
