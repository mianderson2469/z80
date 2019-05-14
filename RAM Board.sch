EESchema Schematic File Version 4
LIBS:RAM Board-cache
EELAYER 29 0
EELAYER END
$Descr A1 33110 23386
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J1
U 1 1 5CBB6996
P 1500 2400
F 0 "J1" H 1550 3517 50  0000 C CNN
F 1 "Conn_02x20_Odd_Even" H 1550 3426 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x20_P2.54mm_Vertical" H 1500 2400 50  0001 C CNN
F 3 "~" H 1500 2400 50  0001 C CNN
	1    1500 2400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x20_Odd_Even J2
U 1 1 5CBC5C68
P 1500 4550
F 0 "J2" H 1550 5667 50  0000 C CNN
F 1 "Conn_02x20_Odd_Even" H 1550 5576 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x20_P2.54mm_Vertical" H 1500 4550 50  0001 C CNN
F 3 "~" H 1500 4550 50  0001 C CNN
	1    1500 4550
	1    0    0    -1  
$EndComp
$Comp
L Memory_EPROM:27C256 U2
U 1 1 5CEFC3F3
P 7200 2550
F 0 "U2" H 7200 3831 50  0000 C CNN
F 1 "27C256" H 7200 3740 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 7200 2550 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/doc0014.pdf" H 7200 2550 50  0001 C CNN
	1    7200 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 4250 8950 4250
Wire Wire Line
	8950 4250 8950 1450
Wire Wire Line
	8950 1450 7200 1450
Wire Wire Line
	8950 1450 8950 600 
Wire Wire Line
	8950 600  650  600 
Wire Wire Line
	650  600  650  3200
Wire Wire Line
	650  3200 1300 3200
Connection ~ 8950 1450
$Comp
L KM62256D:KM62256D U3
U 1 1 5CF013FF
P 7200 5350
F 0 "U3" H 7200 6631 50  0000 C CNN
F 1 "KM62256D" H 7200 6540 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W15.24mm" H 7200 5350 50  0001 C CNN
F 3 "" H 7200 5350 50  0001 C CNN
	1    7200 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 3650 8900 3650
Wire Wire Line
	8900 3650 8900 6450
Wire Wire Line
	1800 3200 2900 3200
Wire Wire Line
	2900 3200 2900 650 
Wire Wire Line
	2900 650  8900 650 
Wire Wire Line
	8900 650  8900 3650
Connection ~ 8900 3650
Wire Wire Line
	6800 3050 5650 3050
Wire Wire Line
	5650 4750 6400 4750
Wire Wire Line
	5650 700  700  700 
Wire Wire Line
	700  700  700  2200
Wire Wire Line
	5650 700  5650 3050
Connection ~ 5650 3050
Wire Wire Line
	5650 3050 5650 4750
Wire Wire Line
	1300 2200 700  2200
Wire Wire Line
	6800 2950 5700 2950
Wire Wire Line
	5700 2950 5700 2100
Wire Wire Line
	5700 700  8850 700 
Wire Wire Line
	8850 700  8850 4850
Wire Wire Line
	8850 4850 8000 4850
Wire Wire Line
	1800 2100 5700 2100
Connection ~ 5700 2100
Wire Wire Line
	5700 2100 5700 700 
Wire Wire Line
	6800 2850 5750 2850
Wire Wire Line
	5750 2850 5750 4850
Wire Wire Line
	5750 4850 6400 4850
Wire Wire Line
	1300 2100 750  2100
Wire Wire Line
	750  2100 750  750 
Wire Wire Line
	750  750  5750 750 
Wire Wire Line
	5750 750  5750 2850
Connection ~ 5750 2850
Wire Wire Line
	6800 2750 5800 2750
Wire Wire Line
	5800 2750 5800 4200
Wire Wire Line
	5800 4200 8800 4200
Wire Wire Line
	8800 4200 8800 5150
Wire Wire Line
	8800 5150 8000 5150
Wire Wire Line
	5800 2750 5800 800 
Wire Wire Line
	5800 800  2850 800 
Wire Wire Line
	2850 800  2850 2000
Wire Wire Line
	2850 2000 1800 2000
Connection ~ 5800 2750
Wire Wire Line
	6800 2650 5850 2650
Wire Wire Line
	5850 2650 5850 4300
Wire Wire Line
	5850 4300 8750 4300
Wire Wire Line
	8750 4300 8750 5350
Wire Wire Line
	8750 5350 8000 5350
Wire Wire Line
	5850 2650 5850 850 
Wire Wire Line
	5850 850  800  850 
Wire Wire Line
	800  850  800  2000
Wire Wire Line
	800  2000 1300 2000
Connection ~ 5850 2650
Wire Wire Line
	6800 2550 5900 2550
Wire Wire Line
	5900 2550 5900 4150
Wire Wire Line
	5900 4150 8700 4150
Wire Wire Line
	8700 4150 8700 5050
Wire Wire Line
	8700 5050 8000 5050
Wire Wire Line
	5900 2550 5900 900 
Wire Wire Line
	5900 900  2800 900 
Wire Wire Line
	2800 900  2800 1900
Wire Wire Line
	2800 1900 1800 1900
Connection ~ 5900 2550
Wire Wire Line
	850  1900 850  950 
Wire Wire Line
	850  950  5950 950 
Wire Wire Line
	5950 950  5950 2450
Wire Wire Line
	5950 2450 6800 2450
Wire Wire Line
	850  1900 1300 1900
Wire Wire Line
	5950 2450 5950 4100
Wire Wire Line
	5950 4100 8650 4100
Wire Wire Line
	8650 4100 8650 4950
Wire Wire Line
	8650 4950 8000 4950
Connection ~ 5950 2450
Wire Wire Line
	6000 4950 6000 2350
Wire Wire Line
	6000 2350 6800 2350
Wire Wire Line
	6000 4950 6400 4950
Wire Wire Line
	1800 1800 2750 1800
Wire Wire Line
	2750 1800 2750 1000
Wire Wire Line
	2750 1000 6000 1000
Wire Wire Line
	6000 1000 6000 2350
Connection ~ 6000 2350
Wire Wire Line
	6800 2250 6050 2250
Wire Wire Line
	6050 2250 6050 5050
Wire Wire Line
	6050 5050 6400 5050
Wire Wire Line
	6050 2250 6050 1050
Wire Wire Line
	6050 1050 900  1050
Wire Wire Line
	900  1050 900  1800
Wire Wire Line
	900  1800 1300 1800
Connection ~ 6050 2250
Wire Wire Line
	6400 5150 6100 5150
Wire Wire Line
	6100 5150 6100 2150
Wire Wire Line
	6100 2150 6800 2150
Wire Wire Line
	6100 2150 6100 1100
Wire Wire Line
	6100 1100 2700 1100
Wire Wire Line
	2700 1100 2700 1700
Wire Wire Line
	2700 1700 1800 1700
Connection ~ 6100 2150
Wire Wire Line
	6800 2050 6150 2050
Wire Wire Line
	6150 2050 6150 5250
Wire Wire Line
	6150 5250 6400 5250
Wire Wire Line
	6150 2050 6150 1150
Wire Wire Line
	6150 1150 950  1150
Wire Wire Line
	950  1150 950  1700
Wire Wire Line
	950  1700 1300 1700
Connection ~ 6150 2050
Wire Wire Line
	6400 5350 6200 5350
Wire Wire Line
	6200 5350 6200 1950
Wire Wire Line
	6200 1950 6800 1950
Wire Wire Line
	6200 1950 6200 1200
Wire Wire Line
	6200 1200 2650 1200
Wire Wire Line
	2650 1200 2650 1600
Wire Wire Line
	2650 1600 1800 1600
Connection ~ 6200 1950
Wire Wire Line
	6400 5450 6250 5450
Wire Wire Line
	6250 5450 6250 1850
Wire Wire Line
	6250 1850 6800 1850
Wire Wire Line
	6250 1850 6250 1250
Wire Wire Line
	6250 1250 1000 1250
Wire Wire Line
	1000 1250 1000 1600
Wire Wire Line
	1000 1600 1300 1600
Connection ~ 6250 1850
Wire Wire Line
	6400 5550 6300 5550
Wire Wire Line
	6300 5550 6300 1750
Wire Wire Line
	6300 1750 6800 1750
Wire Wire Line
	6300 1750 6300 1300
Wire Wire Line
	6300 1300 2600 1300
Wire Wire Line
	2600 1300 2600 1500
Wire Wire Line
	2600 1500 1800 1500
Connection ~ 6300 1750
Wire Wire Line
	1300 1500 1050 1500
Wire Wire Line
	1050 1500 1050 1350
Wire Wire Line
	1050 1350 6350 1350
Wire Wire Line
	6350 1350 6350 1650
Wire Wire Line
	6350 1650 6800 1650
Wire Wire Line
	6350 1650 6350 5650
Wire Wire Line
	6350 5650 6400 5650
Connection ~ 6350 1650
Wire Wire Line
	8000 4750 8600 4750
Wire Wire Line
	8600 4750 8600 1400
Wire Wire Line
	1100 1400 1100 2700
Wire Wire Line
	1100 2700 1300 2700
Wire Wire Line
	1100 1400 8600 1400
Wire Wire Line
	1800 2700 5600 2700
Wire Wire Line
	5600 2700 5600 3450
Wire Wire Line
	5600 3450 6800 3450
Wire Wire Line
	5600 3450 5600 6400
Wire Wire Line
	5600 6400 8850 6400
Wire Wire Line
	8850 6400 8850 5250
Wire Wire Line
	8850 5250 8000 5250
Connection ~ 5600 3450
Wire Wire Line
	6400 5750 5550 5750
Wire Wire Line
	5550 5750 5550 550 
Wire Wire Line
	5550 550  600  550 
Wire Wire Line
	600  550  600  2800
Wire Wire Line
	600  2800 1300 2800
Wire Wire Line
	1800 2800 5500 2800
Wire Wire Line
	5500 2800 5500 5850
Wire Wire Line
	5500 5850 6400 5850
Wire Wire Line
	6400 5950 5450 5950
Wire Wire Line
	5450 5950 5450 500 
Wire Wire Line
	5450 500  550  500 
Wire Wire Line
	550  500  550  2900
Wire Wire Line
	550  2900 1300 2900
Wire Wire Line
	1800 2900 5400 2900
Wire Wire Line
	7200 6450 8900 6450
Wire Wire Line
	8000 5950 8800 5950
Wire Wire Line
	8800 5950 8800 6500
Wire Wire Line
	8800 6500 5400 6500
Wire Wire Line
	5400 2900 5400 6500
Wire Wire Line
	8000 5850 8750 5850
Wire Wire Line
	8750 5850 8750 6550
Wire Wire Line
	8750 6550 5350 6550
Wire Wire Line
	5350 6550 5350 450 
Wire Wire Line
	5350 450  500  450 
Wire Wire Line
	500  450  500  3000
Wire Wire Line
	1300 3000 500  3000
Wire Wire Line
	1800 3000 5300 3000
Wire Wire Line
	5300 3000 5300 6600
Wire Wire Line
	5300 6600 8950 6600
Wire Wire Line
	8950 6600 8950 5750
Wire Wire Line
	8950 5750 8000 5750
Wire Wire Line
	1300 3100 450  3100
Wire Wire Line
	450  3100 450  400 
Wire Wire Line
	450  400  5250 400 
Wire Wire Line
	5250 400  5250 6650
Wire Wire Line
	5250 6650 9000 6650
Wire Wire Line
	9000 6650 9000 5650
Wire Wire Line
	9000 5650 8000 5650
Wire Wire Line
	8000 5550 9050 5550
Wire Wire Line
	9050 5550 9050 6700
Wire Wire Line
	9050 6700 5200 6700
Wire Wire Line
	5200 6700 5200 3100
Wire Wire Line
	5200 3100 1800 3100
Wire Wire Line
	6800 3250 6400 3250
Wire Wire Line
	6400 3250 6400 4250
Wire Wire Line
	6400 4250 7200 4250
Connection ~ 7200 4250
Connection ~ 9050 5550
Wire Wire Line
	7600 2350 9050 2350
Wire Wire Line
	9050 2350 9050 5550
Wire Wire Line
	7600 2250 9100 2250
Wire Wire Line
	9100 2250 9100 5650
Wire Wire Line
	9100 5650 9000 5650
Connection ~ 9000 5650
Wire Wire Line
	8950 5750 9150 5750
Wire Wire Line
	9150 5750 9150 2150
Wire Wire Line
	9150 2150 7600 2150
Connection ~ 8950 5750
Wire Wire Line
	7600 2050 9200 2050
Wire Wire Line
	9200 2050 9200 5850
Wire Wire Line
	9200 5850 8750 5850
Connection ~ 8750 5850
Wire Wire Line
	8800 5950 9250 5950
Wire Wire Line
	9250 5950 9250 1950
Wire Wire Line
	9250 1950 7600 1950
Connection ~ 8800 5950
Wire Wire Line
	7600 1850 9300 1850
Wire Wire Line
	9300 1850 9300 6750
Wire Wire Line
	9300 6750 5450 6750
Wire Wire Line
	5450 6750 5450 5950
Connection ~ 5450 5950
Wire Wire Line
	5500 5850 5500 6800
Wire Wire Line
	5500 6800 9350 6800
Wire Wire Line
	9350 6800 9350 1750
Wire Wire Line
	9350 1750 7600 1750
Connection ~ 5500 5850
Wire Wire Line
	7600 1650 9400 1650
Wire Wire Line
	9400 1650 9400 6850
Wire Wire Line
	9400 6850 5550 6850
Wire Wire Line
	5550 6850 5550 5750
Connection ~ 5550 5750
$Comp
L 2019-04-17_19-29-37:SN74LS04N U1
U 1 1 5D08B10C
P 2800 4650
F 0 "U1" H 3900 5037 60  0000 C CNN
F 1 "SN74LS04N" H 3900 4931 60  0000 C CNN
F 2 "Package_DIP:DIP-14_W10.16mm" H 3900 4890 60  0001 C CNN
F 3 "" H 2800 4650 60  0000 C CNN
	1    2800 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 6450 2800 6450
Connection ~ 7200 6450
Wire Wire Line
	2800 5250 2800 6450
Wire Wire Line
	6400 4250 5000 4250
Wire Wire Line
	5000 4250 5000 4650
Connection ~ 6400 4250
Wire Wire Line
	5000 4850 5650 4850
Wire Wire Line
	5650 4850 5650 6350
Wire Wire Line
	5650 6350 8700 6350
Wire Wire Line
	8700 6350 8700 5450
Wire Wire Line
	8700 5450 8000 5450
Wire Wire Line
	5000 4750 5150 4750
Wire Wire Line
	5150 4750 5150 3350
Wire Wire Line
	5150 3350 6800 3350
Wire Wire Line
	5150 3350 2950 3350
Wire Wire Line
	2950 3350 2950 2200
Wire Wire Line
	2950 2200 1800 2200
Connection ~ 5150 3350
$EndSCHEMATC
