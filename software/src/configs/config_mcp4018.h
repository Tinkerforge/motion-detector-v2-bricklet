/* motion-detector-v2-bricklet
 * Copyright (C) 2017 Olaf Lüke <olaf@tinkerforge.com>
 *
 * config_MCP4018.h: Config for MCP4018
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

#ifndef CONFIG_MCP4018_H
#define CONFIG_MCP4018_H

#include "xmc_gpio.h"

#define MCP4018_I2C_BAUDRATE         100000

#define MCP4018_I2C_ADDRESS          0b0101111
#define MCP4018_I2C                  XMC_I2C0_CH1

#define MCP4018_SCL_PORT             XMC_GPIO_PORT0
#define MCP4018_SCL_PIN              8
#define MCP4018_SCL_PIN_MODE         XMC_GPIO_MODE_OUTPUT_OPEN_DRAIN_ALT7
#define MCP4018_SCL_INPUT            XMC_USIC_CH_INPUT_DX1
#define MCP4018_SCL_SOURCE           1
#define MCP4018_SCL_FIFO_SIZE        XMC_USIC_CH_FIFO_SIZE_16WORDS
#define MCP4018_SCL_FIFO_POINTER     32

#define MCP4018_SDA_PORT             XMC_GPIO_PORT0
#define MCP4018_SDA_PIN              6
#define MCP4018_SDA_PIN_MODE         XMC_GPIO_MODE_OUTPUT_OPEN_DRAIN_ALT7
#define MCP4018_SDA_INPUT            XMC_USIC_CH_INPUT_DX0
#define MCP4018_SDA_SOURCE           2
#define MCP4018_SDA_FIFO_SIZE        XMC_USIC_CH_FIFO_SIZE_16WORDS
#define MCP4018_SDA_FIFO_POINTER     48

#endif
