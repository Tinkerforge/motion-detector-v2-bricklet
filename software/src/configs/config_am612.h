/* motion-detector-v2-bricklet
 * Copyright (C) 2017 Olaf Lüke <olaf@tinkerforge.com>
 *
 * config_am612.h: Config for AM612 PIR sensor
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

#ifndef CONFIG_AM612_H
#define CONFIG_AM612_H

#include "xmc_gpio.h"

#define AM612_VOUT_PIN                  P0_12
#define AM612_ENABLE_PIN                P0_9

#define AM612_SENSITIVITY_PERIOD_VALUE  255

#define AM612_SENSITIVITY_PIN           P1_0
#define AM612_SENSITIVITY_CCU4_SLICE    0

#define LED_PERIOD_VALUE                255

#define LED_TOP_LEFT_PIN                P1_2
#define LED_TOP_LEFT_CCU4_SLICE         2

#define LED_TOP_RIGHT_PIN               P1_1
#define LED_TOP_RIGHT_CCU4_SLICE        1

#define LED_BOTTOM_PIN                  P1_3
#define LED_BOTTOM_CCU4_SLICE           3

#endif
