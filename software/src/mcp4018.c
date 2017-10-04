/* motion-detector-v2-bricklet
 * Copyright (C) 2017 Olaf Lüke <olaf@tinkerforge.com>
 *
 * mcp4018.c: MCP4018 I2C potentiometer driver
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

#include "mcp4018.h"

#include "configs/config_mcp4018.h"
#include "bricklib2/hal/i2c_fifo/i2c_fifo.h"
#include "bricklib2/logging/logging.h"

#include "xmc_i2c.h"

MCP4018 mcp4018;


void mcp4018_init_i2c(void) {
	mcp4018.i2c_fifo.baudrate         = MCP4018_I2C_BAUDRATE;
	mcp4018.i2c_fifo.address          = MCP4018_I2C_ADDRESS;
	mcp4018.i2c_fifo.i2c              = MCP4018_I2C;

	mcp4018.i2c_fifo.scl_port         = MCP4018_SCL_PORT;
	mcp4018.i2c_fifo.scl_pin          = MCP4018_SCL_PIN;
	mcp4018.i2c_fifo.scl_mode         = MCP4018_SCL_PIN_MODE;
	mcp4018.i2c_fifo.scl_input        = MCP4018_SCL_INPUT;
	mcp4018.i2c_fifo.scl_source       = MCP4018_SCL_SOURCE;
	mcp4018.i2c_fifo.scl_fifo_size    = MCP4018_SCL_FIFO_SIZE;
	mcp4018.i2c_fifo.scl_fifo_pointer = MCP4018_SCL_FIFO_POINTER;

	mcp4018.i2c_fifo.sda_port         = MCP4018_SDA_PORT;
	mcp4018.i2c_fifo.sda_pin          = MCP4018_SDA_PIN;
	mcp4018.i2c_fifo.sda_mode         = MCP4018_SDA_PIN_MODE;
	mcp4018.i2c_fifo.sda_input        = MCP4018_SDA_INPUT;
	mcp4018.i2c_fifo.sda_source       = MCP4018_SDA_SOURCE;
	mcp4018.i2c_fifo.sda_fifo_size    = MCP4018_SDA_FIFO_SIZE;
	mcp4018.i2c_fifo.sda_fifo_pointer = MCP4018_SDA_FIFO_POINTER;

	i2c_fifo_init(&mcp4018.i2c_fifo);
}

void mcp4018_set_value(const uint8_t value) {
	mcp4018.value = value > 127 ? 127 : value;
}

void mcp4018_init(void) {
	mcp4018.value = 127;
	mcp4018.value_last = 255;
	mcp4018_init_i2c();
}

void mcp4018_tick(void) {
	if(mcp4018.value != mcp4018.value_last) {
		I2CFifoState state = i2c_fifo_next_state(&mcp4018.i2c_fifo);
		if((state == I2C_FIFO_STATE_IDLE) || (state == I2C_FIFO_STATE_WRITE_DIRECT_READY)) {
			logd("MCP4018: New value %u\n\r", mcp4018.value);

			// Sensitivity decreases with increasing value, so we write the reciprocal value to the I2C pot.
			uint8_t sensitivity_value = 127 - mcp4018.value;
			i2c_fifo_write_direct(&mcp4018.i2c_fifo, 1, &sensitivity_value, true);
			mcp4018.value_last = mcp4018.value;
		} else if(state != I2C_FIFO_STATE_WRITE_DIRECT) {
			// The only valid states are idle, write direct or write direct ready.
			// In all other cases we assume that there is an error and reinit i2c
			mcp4018_init_i2c();
			loge("MCP4018: Unexpected state %u\n\r", state);
		}
	}
}
