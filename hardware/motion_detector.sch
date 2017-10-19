EESchema Schematic File Version 2
LIBS:tinkerforge
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:motion_detector-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Motion Detector Bricklet 2.0"
Date "2017-09-05"
Rev "2.0"
Comp "Tinkerforge GmbH"
Comment1 "Licensed under CERN OHL v.1.1"
Comment2 "Copyright (©) 2017, B.Nordmeyer <bastian@tinkerforge.com>"
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 8200 3100 2    60   Output ~ 0
VOUT
$Comp
L XMC1XXX24 U1
U 1 1 59AEBB4E
P 3700 1800
F 0 "U1" H 3550 2200 60  0000 C CNN
F 1 "XMC1XXX24" H 3700 1400 60  0000 C CNN
F 2 "kicad-libraries:QFN24-4x4mm-0.5mm" H 3850 2550 60  0001 C CNN
F 3 "" H 3850 2550 60  0000 C CNN
	1    3700 1800
	1    0    0    -1  
$EndComp
$Comp
L AM612 U3
U 1 1 59AEC5E1
P 7400 3100
F 0 "U3" H 7150 3350 60  0000 C CNN
F 1 "AM612" H 7400 2850 60  0000 C CNN
F 2 "AM612" H 7400 3100 60  0001 C CNN
F 3 "" H 7400 3100 60  0001 C CNN
	1    7400 3100
	1    0    0    -1  
$EndComp
Text GLabel 6500 2950 0    60   Input ~ 0
VSENS
$Comp
L GND #PWR01
U 1 1 59AEC852
P 7000 3850
F 0 "#PWR01" H 7000 3850 30  0001 C CNN
F 1 "GND" H 7000 3780 30  0001 C CNN
F 2 "" H 7000 3850 60  0000 C CNN
F 3 "" H 7000 3850 60  0000 C CNN
	1    7000 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 3850 7000 3250
Wire Wire Line
	7000 2950 6500 2950
$Comp
L VCC #PWR02
U 1 1 59AEC9B6
P 7950 2850
F 0 "#PWR02" H 7950 2700 50  0001 C CNN
F 1 "VCC" H 7950 3000 50  0000 C CNN
F 2 "" H 7950 2850 50  0001 C CNN
F 3 "" H 7950 2850 50  0001 C CNN
	1    7950 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 3250 7950 3250
Wire Wire Line
	7950 2850 7950 3350
$Comp
L C C7
U 1 1 59AEC9ED
P 7950 3550
F 0 "C7" V 7800 3500 50  0000 L CNN
F 1 "100nF" V 8100 3450 50  0000 L CNN
F 2 "C0603F" H 7950 3550 60  0001 C CNN
F 3 "" H 7950 3550 60  0000 C CNN
	1    7950 3550
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR03
U 1 1 59AECA42
P 7950 3850
F 0 "#PWR03" H 7950 3850 30  0001 C CNN
F 1 "GND" H 7950 3780 30  0001 C CNN
F 2 "" H 7950 3850 60  0000 C CNN
F 3 "" H 7950 3850 60  0000 C CNN
	1    7950 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 3850 7950 3750
Connection ~ 7950 3250
Wire Wire Line
	7800 3100 8200 3100
$Comp
L GND #PWR04
U 1 1 59AECB3F
P 8150 3850
F 0 "#PWR04" H 8150 3850 30  0001 C CNN
F 1 "GND" H 8150 3780 30  0001 C CNN
F 2 "" H 8150 3850 60  0000 C CNN
F 3 "" H 8150 3850 60  0000 C CNN
	1    8150 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 3850 8150 2950
Wire Wire Line
	8150 2950 7800 2950
$Comp
L XMC1XXX24 U1
U 2 1 59AECD23
P 3700 3200
F 0 "U1" H 3550 3750 60  0000 C CNN
F 1 "XMC1XXX24" H 3700 2650 60  0000 C CNN
F 2 "kicad-libraries:QFN24-4x4mm-0.5mm" H 3850 3950 60  0001 C CNN
F 3 "" H 3850 3950 60  0000 C CNN
	2    3700 3200
	1    0    0    -1  
$EndComp
$Comp
L XMC1XXX24 U1
U 3 1 59AECE93
P 3700 4500
F 0 "U1" H 3550 4750 60  0000 C CNN
F 1 "XMC1XXX24" H 3700 4250 60  0000 C CNN
F 2 "kicad-libraries:QFN24-4x4mm-0.5mm" H 3850 5250 60  0001 C CNN
F 3 "" H 3850 5250 60  0000 C CNN
	3    3700 4500
	1    0    0    -1  
$EndComp
$Comp
L XMC1XXX24 U1
U 4 1 59AECF96
P 3700 5750
F 0 "U1" H 3550 6200 60  0000 C CNN
F 1 "XMC1XXX24" H 3700 5300 60  0000 C CNN
F 2 "kicad-libraries:QFN24-4x4mm-0.5mm" H 3850 6500 60  0001 C CNN
F 3 "" H 3850 6500 60  0000 C CNN
	4    3700 5750
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 59AED1A7
P 3250 1750
F 0 "C4" V 3100 1700 50  0000 L CNN
F 1 "100nF" V 3400 1650 50  0000 L CNN
F 2 "C0603F" H 3250 1750 60  0001 C CNN
F 3 "" H 3250 1750 60  0000 C CNN
	1    3250 1750
	-1   0    0    1   
$EndComp
Wire Wire Line
	3350 2000 3250 2000
Wire Wire Line
	3250 1950 3250 2200
Wire Wire Line
	3250 2100 3350 2100
Connection ~ 3250 2000
Wire Wire Line
	3350 1500 3250 1500
Wire Wire Line
	3250 1450 3250 1550
$Comp
L VCC #PWR05
U 1 1 59AED469
P 3250 1450
F 0 "#PWR05" H 3250 1300 50  0001 C CNN
F 1 "VCC" H 3250 1600 50  0000 C CNN
F 2 "" H 3250 1450 50  0001 C CNN
F 3 "" H 3250 1450 50  0001 C CNN
	1    3250 1450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR06
U 1 1 59AED592
P 3250 2200
F 0 "#PWR06" H 3250 2200 30  0001 C CNN
F 1 "GND" H 3250 2130 30  0001 C CNN
F 2 "" H 3250 2200 60  0000 C CNN
F 3 "" H 3250 2200 60  0000 C CNN
	1    3250 2200
	1    0    0    -1  
$EndComp
Connection ~ 3250 2100
Connection ~ 3250 1500
$Comp
L CON-SENSOR2 P1
U 1 1 59AED702
P 1100 1900
F 0 "P1" H 950 2300 60  0000 C CNN
F 1 "CON-SENSOR2" V 1250 1900 60  0000 C CNN
F 2 "kicad-libraries:CON-SENSOR2" H 1200 1750 60  0001 C CNN
F 3 "" H 1200 1750 60  0000 C CNN
	1    1100 1900
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 59AED875
P 1100 2450
F 0 "#PWR07" H 1100 2450 30  0001 C CNN
F 1 "GND" H 1100 2380 30  0001 C CNN
F 2 "" H 1100 2450 60  0000 C CNN
F 3 "" H 1100 2450 60  0000 C CNN
	1    1100 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1100 2450 1100 2350
NoConn ~ 1450 1600
$Comp
L C C3
U 1 1 59AED9D3
P 2250 1500
F 0 "C3" V 2100 1450 50  0000 L CNN
F 1 "1uF" V 2400 1400 50  0000 L CNN
F 2 "C0603F" H 2250 1500 60  0001 C CNN
F 3 "" H 2250 1500 60  0000 C CNN
	1    2250 1500
	-1   0    0    1   
$EndComp
$Comp
L C C2
U 1 1 59AEDA24
P 1850 1500
F 0 "C2" V 1700 1450 50  0000 L CNN
F 1 "10uF" V 2000 1400 50  0000 L CNN
F 2 "C0805" H 1850 1500 60  0001 C CNN
F 3 "" H 1850 1500 60  0000 C CNN
	1    1850 1500
	-1   0    0    1   
$EndComp
$Comp
L VCC #PWR08
U 1 1 59AEDBB4
P 2250 1250
F 0 "#PWR08" H 2250 1100 50  0001 C CNN
F 1 "VCC" H 2250 1400 50  0000 C CNN
F 2 "" H 2250 1250 50  0001 C CNN
F 3 "" H 2250 1250 50  0001 C CNN
	1    2250 1250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 59AEDC05
P 2250 1800
F 0 "#PWR09" H 2250 1800 30  0001 C CNN
F 1 "GND" H 2250 1730 30  0001 C CNN
F 2 "" H 2250 1800 60  0000 C CNN
F 3 "" H 2250 1800 60  0000 C CNN
	1    2250 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1800 1600 1800
Wire Wire Line
	1600 1800 1600 1300
Wire Wire Line
	1600 1300 2250 1300
Connection ~ 1850 1300
Wire Wire Line
	2250 1300 2250 1250
Wire Wire Line
	1450 1700 2250 1700
Connection ~ 1850 1700
Wire Wire Line
	2250 1700 2250 1800
Connection ~ 2250 1300
Connection ~ 2250 1700
$Comp
L R_PACK4 RP1
U 1 1 59AEDE30
P 1800 2250
F 0 "RP1" H 1800 2700 50  0000 C CNN
F 1 "82" H 1800 2200 50  0000 C CNN
F 2 "kicad-libraries:4X0402" H 1800 2250 50  0001 C CNN
F 3 "" H 1800 2250 50  0000 C CNN
	1    1800 2250
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 59AEDF37
P 1550 2400
F 0 "C1" V 1400 2350 50  0000 L CNN
F 1 "220pF" V 1700 2300 50  0000 L CNN
F 2 "C0402E" H 1550 2400 60  0001 C CNN
F 3 "" H 1550 2400 60  0000 C CNN
	1    1550 2400
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR010
U 1 1 59AEE05B
P 1550 2650
F 0 "#PWR010" H 1550 2650 30  0001 C CNN
F 1 "GND" H 1550 2580 30  0001 C CNN
F 2 "" H 1550 2650 60  0000 C CNN
F 3 "" H 1550 2650 60  0000 C CNN
	1    1550 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2650 1550 2600
Wire Wire Line
	1450 2200 1600 2200
Wire Wire Line
	1600 2100 1450 2100
Wire Wire Line
	1450 2000 1600 2000
Wire Wire Line
	1450 1900 1600 1900
Connection ~ 1550 2200
Text GLabel 2300 1900 2    60   Output ~ 0
S-CS
Text GLabel 2300 2000 2    60   Output ~ 0
S-CLK
Text GLabel 2300 2100 2    60   Output ~ 0
S-MOSI
Text GLabel 2300 2200 2    60   Input ~ 0
S-MISO
Wire Wire Line
	2000 2200 2300 2200
Wire Wire Line
	2300 2100 2000 2100
Wire Wire Line
	2000 2000 2300 2000
Wire Wire Line
	2300 1900 2000 1900
Text GLabel 3200 3450 0    60   Input ~ 0
S-CS
Text GLabel 3200 3550 0    60   Input ~ 0
S-CLK
Text GLabel 3200 3650 0    60   Input ~ 0
S-MOSI
Text GLabel 3200 5400 0    60   Output ~ 0
S-MISO
Wire Wire Line
	3200 5400 3350 5400
Wire Wire Line
	3200 3650 3350 3650
Wire Wire Line
	3350 3550 3200 3550
Wire Wire Line
	3200 3450 3350 3450
Text GLabel 6500 3100 0    60   Input ~ 0
ENABLE
Wire Wire Line
	6500 3100 7000 3100
Text GLabel 3200 3250 0    60   Output ~ 0
ENABLE
$Comp
L LED D2
U 1 1 59AEF87D
P 8650 4500
F 0 "D2" H 8650 4600 50  0000 C CNN
F 1 "red_inv" H 8650 4400 50  0000 C CNN
F 2 "D1206_INV" H 8650 4500 50  0001 C CNN
F 3 "" H 8650 4500 50  0000 C CNN
	1    8650 4500
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 59AEFAE6
P 8150 4500
F 0 "R3" V 8230 4500 50  0000 C CNN
F 1 "68" V 8150 4500 50  0000 C CNN
F 2 "R0603F" H 8150 4500 60  0001 C CNN
F 3 "" H 8150 4500 60  0000 C CNN
	1    8150 4500
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR011
U 1 1 59AEFD01
P 7850 4500
F 0 "#PWR011" H 7850 4350 50  0001 C CNN
F 1 "VCC" H 7850 4650 50  0000 C CNN
F 2 "" H 7850 4500 50  0001 C CNN
F 3 "" H 7850 4500 50  0001 C CNN
	1    7850 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 4500 7900 4500
Wire Wire Line
	8400 4500 8450 4500
Text Notes 4300 3550 0    39   ~ 0
SPI Slave/CH0\nP0.13 : USIC0_CH0-DX2F : SEL\nP0.14 : USIC0_CH0-DX1A : CLK\nP0.15 : USIC0_CH0-DX0B : MOSI\nP2.0 : USIC0_CH0-DOUT0 : MISO
Text Notes 4250 5300 0    39   ~ 0
I2C Master/CH1\nP0.6 :USIC0_CH1-DOUT0/DX0C : SDA\nP0.8: USIC0_CH1-SCLKOUT/DX1B : SCL
$Comp
L CONN_01X01 J1
U 1 1 59AF01A8
P 2600 5500
F 0 "J1" H 2600 5600 50  0000 C CNN
F 1 "Debug" V 2700 5500 50  0000 C CNN
F 2 "kicad-libraries:DEBUG_PAD" H 2600 5500 50  0001 C CNN
F 3 "" H 2600 5500 50  0001 C CNN
	1    2600 5500
	-1   0    0    1   
$EndComp
Wire Wire Line
	2800 5500 3350 5500
$Comp
L CONN_01X02 P2
U 1 1 59AF0497
P 2950 5750
F 0 "P2" H 2950 5900 50  0000 C CNN
F 1 "Boot" V 3050 5650 50  0000 C CNN
F 2 "kicad-libraries:SolderJumper" H 2950 5650 50  0001 C CNN
F 3 "" H 2950 5650 50  0000 C CNN
	1    2950 5750
	-1   0    0    1   
$EndComp
Wire Wire Line
	3150 5700 3350 5700
$Comp
L GND #PWR012
U 1 1 59AF08BD
P 3150 5900
F 0 "#PWR012" H 3150 5900 30  0001 C CNN
F 1 "GND" H 3150 5830 30  0001 C CNN
F 2 "" H 3150 5900 60  0000 C CNN
F 3 "" H 3150 5900 60  0000 C CNN
	1    3150 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 5900 3150 5800
Text GLabel 9050 4500 2    60   Input ~ 0
LED_RED
Wire Wire Line
	8850 4500 9050 4500
Text GLabel 9050 4800 2    60   Input ~ 0
LED_GREEN
$Comp
L LED D3
U 1 1 59AF0F95
P 8650 4800
F 0 "D3" H 8650 4900 50  0000 C CNN
F 1 "green_inv" H 8650 4700 50  0000 C CNN
F 2 "D1206_INV" H 8650 4800 50  0001 C CNN
F 3 "" H 8650 4800 50  0000 C CNN
	1    8650 4800
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 59AF1037
P 8150 4800
F 0 "R4" V 8230 4800 50  0000 C CNN
F 1 "68" V 8150 4800 50  0000 C CNN
F 2 "R0603F" H 8150 4800 60  0001 C CNN
F 3 "" H 8150 4800 60  0000 C CNN
	1    8150 4800
	0    1    1    0   
$EndComp
$Comp
L LED D4
U 1 1 59AF1098
P 8650 5100
F 0 "D4" H 8650 5200 50  0000 C CNN
F 1 "blue_inv" H 8650 5000 50  0000 C CNN
F 2 "D1206_INV" H 8650 5100 50  0001 C CNN
F 3 "" H 8650 5100 50  0000 C CNN
	1    8650 5100
	1    0    0    -1  
$EndComp
Text GLabel 9050 5100 2    60   Input ~ 0
LED_BLUE
$Comp
L R R5
U 1 1 59AF11A4
P 8150 5100
F 0 "R5" V 8230 5100 50  0000 C CNN
F 1 "22" V 8150 5100 50  0000 C CNN
F 2 "R0603F" H 8150 5100 60  0001 C CNN
F 3 "" H 8150 5100 60  0000 C CNN
	1    8150 5100
	0    1    1    0   
$EndComp
Wire Wire Line
	7850 4500 7850 5100
Wire Wire Line
	7850 4800 7900 4800
Wire Wire Line
	7850 5100 7900 5100
Connection ~ 7850 4800
Wire Wire Line
	8400 5100 8450 5100
Wire Wire Line
	8400 4800 8450 4800
Wire Wire Line
	8850 4800 9050 4800
Wire Wire Line
	9050 5100 8850 5100
Text GLabel 3200 4450 0    60   Output ~ 0
LED_RED
Text GLabel 3200 4550 0    60   Output ~ 0
LED_GREEN
Text GLabel 3200 4650 0    60   Output ~ 0
LED_BLUE
Wire Wire Line
	2700 4350 3350 4350
Wire Wire Line
	3350 4450 3200 4450
Wire Wire Line
	3200 4550 3350 4550
Wire Wire Line
	3200 3250 3350 3250
$Comp
L LED D1
U 1 1 59AEB5F5
P 2050 6000
F 0 "D1" H 2050 6100 50  0000 C CNN
F 1 "blue" H 2050 5900 50  0000 C CNN
F 2 "D0603F" H 2050 6000 50  0001 C CNN
F 3 "" H 2050 6000 50  0000 C CNN
	1    2050 6000
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 59AEB90F
P 2600 6000
F 0 "R1" V 2680 6000 50  0000 C CNN
F 1 "1k" V 2600 6000 50  0000 C CNN
F 2 "R0603F" H 2600 6000 60  0001 C CNN
F 3 "" H 2600 6000 60  0000 C CNN
	1    2600 6000
	0    1    1    0   
$EndComp
$Comp
L VCC #PWR013
U 1 1 59AEBCBE
P 1850 5900
F 0 "#PWR013" H 1850 5750 50  0001 C CNN
F 1 "VCC" H 1850 6050 50  0000 C CNN
F 2 "" H 1850 5900 50  0001 C CNN
F 3 "" H 1850 5900 50  0001 C CNN
	1    1850 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 6000 2850 6000
Wire Wire Line
	2350 6000 2250 6000
Wire Wire Line
	1850 5900 1850 6000
Text Notes 9550 4500 0    39   ~ 0
LTST-C230KRKT
Connection ~ 7850 4500
Text Notes 9650 4850 0    39   ~ 0
LTST-C230KGKT
Text Notes 9600 5150 0    39   ~ 0
LTST-C230TBKT
Text GLabel 3200 3350 0    60   Input ~ 0
VOUT
Wire Wire Line
	3200 3350 3350 3350
$Comp
L DRILL U4
U 1 1 59AEE060
P 10650 6100
F 0 "U4" H 10700 6150 60  0001 C CNN
F 1 "DRILL" H 10650 6100 60  0000 C CNN
F 2 "DRILL_NP" H 10650 6100 60  0001 C CNN
F 3 "" H 10650 6100 60  0000 C CNN
	1    10650 6100
	1    0    0    -1  
$EndComp
$Comp
L DRILL U6
U 1 1 59AEE18C
P 11000 6100
F 0 "U6" H 11050 6150 60  0001 C CNN
F 1 "DRILL" H 11000 6100 60  0000 C CNN
F 2 "DRILL_NP" H 11000 6100 60  0001 C CNN
F 3 "" H 11000 6100 60  0000 C CNN
	1    11000 6100
	1    0    0    -1  
$EndComp
$Comp
L DRILL U7
U 1 1 59AEE1E8
P 11000 6350
F 0 "U7" H 11050 6400 60  0001 C CNN
F 1 "DRILL" H 11000 6350 60  0000 C CNN
F 2 "DRILL_NP" H 11000 6350 60  0001 C CNN
F 3 "" H 11000 6350 60  0000 C CNN
	1    11000 6350
	1    0    0    -1  
$EndComp
$Comp
L DRILL U5
U 1 1 59AEE244
P 10650 6350
F 0 "U5" H 10700 6400 60  0001 C CNN
F 1 "DRILL" H 10650 6350 60  0000 C CNN
F 2 "DRILL_NP" H 10650 6350 60  0001 C CNN
F 3 "" H 10650 6350 60  0000 C CNN
	1    10650 6350
	1    0    0    -1  
$EndComp
Text Notes 700  7600 0    39   ~ 0
Copyright Tinkerforge GmbH 2017.\nThis documentation describes Open Hardware and is licensed under the\nCERN OHL v. 1.1.\nYou may redistribute and modify this documentation under the terms of the\nCERN OHL v.1.1. (http://ohwr.org/cernohl). This documentation is distributed\nWITHOUT ANY EXPRESS OR IMPLIED WARRANTY, INCLUDING OF\nMERCHANTABILITY, SATISFACTORY QUALITY AND FITNESS FOR A\nPARTICULAR PURPOSE. Please see the CERN OHL v.1.1 for applicable\nconditions
Text GLabel 1600 4350 0    60   Output ~ 0
VSENS
$Comp
L R R2
U 1 1 59E87AE6
P 2450 4350
F 0 "R2" V 2530 4350 50  0000 C CNN
F 1 "1k" V 2450 4350 50  0000 C CNN
F 2 "R0603F" H 2450 4350 60  0001 C CNN
F 3 "" H 2450 4350 60  0000 C CNN
	1    2450 4350
	0    1    1    0   
$EndComp
$Comp
L C C6
U 1 1 59E87D65
P 2100 4550
F 0 "C6" V 1950 4500 50  0000 L CNN
F 1 "100nF" V 2250 4450 50  0000 L CNN
F 2 "C0603F" H 2100 4550 60  0001 C CNN
F 3 "" H 2100 4550 60  0000 C CNN
	1    2100 4550
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR014
U 1 1 59E87FAF
P 2100 4800
F 0 "#PWR014" H 2100 4800 30  0001 C CNN
F 1 "GND" H 2100 4730 30  0001 C CNN
F 2 "" H 2100 4800 60  0000 C CNN
F 3 "" H 2100 4800 60  0000 C CNN
	1    2100 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 4350 2200 4350
Connection ~ 2100 4350
Wire Wire Line
	2100 4800 2100 4750
Text Notes 1700 4300 0    39   ~ 0
0-3.3V
NoConn ~ 3350 3150
NoConn ~ 3350 3050
NoConn ~ 3350 2950
NoConn ~ 3350 2850
NoConn ~ 3350 2750
NoConn ~ 3350 5600
NoConn ~ 3350 5800
NoConn ~ 3350 5900
NoConn ~ 3350 6100
Wire Wire Line
	3200 4650 3350 4650
Text Notes 2700 4250 0    39   ~ 0
channels shiftet!
$EndSCHEMATC
