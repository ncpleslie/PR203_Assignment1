USE Vector;

INSERT INTO Employee(Username) VALUES
("Pikachu")
,("Eevee")
,("Celebi")
,("Snorlax")
,("Charizard")
,("Mewtwo");
INSERT INTO TestingDevice(DeviceNo, DeviceType, AppVersionNo) VALUES 
(1, 'iPad Air', '2.2.5')
,(2, "iPad6,12", "2.2.5")
,(3, "iPad Air", "2.2.5")
,(4, "iPad6,12", "2.2.5")
,(5, "iPad7,2", "2.2.5")
,(6, "iPad Air", "2.2.5");
INSERT INTO SignalTester(DeviceSerialNo, BTName, ModemType, FirmwareNo, BatteryLevel, BTSignal, SIMVodafone, SIMTelstra, SIMExternal) VALUES 
('SDS-043C', 'CORSSRAY', 'EWM400', 'GAT-17R3', 3.92, '[-76.0, -72.0, -66.0]', "89314404000248186935", "89610180002249048341", NULL)
,('SDS-196B', "REAPER","EWM400", "GAT-17R3", 3.92, "[-59.0, -52.0]", "89314404000248157530", "89610180002243817774", NULL)
,('SDS-061C', "DIXIE", "EWM400", "GAT-17R3", 3.88, "[-83.0, -74.0, -79.0]", "89314404000266650267", "89610180002249046930", NULL)
,('SDS-008C', "ASSAM", "EWM1000", "GAT-17R3", 3.94, "[-91.0, -87.0, -81.0, -70.0, -86.0, -74.0, -76.0]", NULL, NULL, "89314404000266723023")
,('SDS-049C', "DAIBRAVE", "EWM400", "GAT-17R3", 3.69, "[-76.0, -69.0, -69.0, -76.0, -73.0, -76.0]", "89314404000248233075", "89610180002249047685", NULL)
,('SDS-026C', "CARIVOU", "EWM400", "GAT-17R3", 3.88, "[-76.0, -85.0]", "89314404000281178914", "89610180002249045296", NULL);
INSERT INTO Threshold(RSSIThreshold, RSSIHigherThreshold, RSCPThreshold, RSCPHigherThreshold, RSRPThreshold, RSRPHigherThreshold) VALUES
(6.0, 12.0, 15.0, 30.0, 10.0, 20.0);

-- Work Order --
INSERT INTO WorkOrder(WorkOrderNo, TheDate, Location, GPSAccuracy, ThresholdId, Username, DeviceSerialNo, DeviceNo) VALUES 
('WO-00104116', DATE_FORMAT(STR_TO_DATE("1-5-2018--8-5", "%d-%m-%Y--%H-%i"),'%Y-%m-%d %H:%i'), POINT(152.7524324, -27.60477169), 'kCLLocationAccuracyKilometer', 1, "Pikachu", 'SDS-043C', 1),
('WO-00251301', DATE_FORMAT(STR_TO_DATE("19-2-2019--13-14", "%d-%m-%Y--%H-%i"),'%Y-%m-%d %H:%i'), POINT(NULL, NULL), 'kCLLocationAccuracyKilometer', 1, "Eevee", 'SDS-196B', 2),
('WO-00105349', DATE_FORMAT(STR_TO_DATE("30-4-2018--14-48", "%d-%m-%Y--%H-%i"),'%Y-%m-%d %H:%i'), POINT(139.34259429587, -35.6776790181507), 'kCLLocationAccuracyKilometer', 1, "Celebi", 'SDS-061C', 3),
('WO-00110610', DATE_FORMAT(STR_TO_DATE("17-4-2018--10-41", "%d-%m-%Y--%H-%i"),'%Y-%m-%d %H:%i'), POINT(152.984367638172, -27.4171041995673), 'kCLLocationAccuracyKilometer', 1, "Snorlax", 'SDS-008C', 4),
('WO-00110925', DATE_FORMAT(STR_TO_DATE("26-4-2018--10-31", "%d-%m-%Y--%H-%i"),'%Y-%m-%d %H:%i'), POINT(153.024695282944, -27.1806907654062), 'kCLLocationAccuracyKilometer', 1, "Charizard", 'SDS-049C', 5),
('WO-00248593', DATE_FORMAT(STR_TO_DATE("19-2-2019--8-42", "%d-%m-%Y--%H-%i"),'%Y-%m-%d %H:%i'), POINT(152.971914761231,  -27.0792295037818), 'kCLLocationAccuracyKilometer', 1, "Mewtwo", 'SDS-026C', 6);


-- BLADE TESTS
INSERT INTO TestResult(WorkOrderNo, TestNetworkType, AntennaType, RSSI, RSCP, RSRP, Timeout, Network, Rawarray, ModemStatus) VALUES
('WO-00104116', "Vodafone", "Blade", 0.0, 14.625, 23.08333333, False, "vodafone AU", '["39_33-1", "39_33-1", "39_37-1", "99_99-0", "99_99-0", "99_99-0", "99_99-0", "99_99-0", "40_18-4", "40_18-4", "40_18-4", "39_29-4", "39_23-4", "39_23-4", "40_29-4"]', "Registered, Roaming"),
('WO-00251301', "Vodafone", "Blade", 0.0, 0.0, 0.0, True, "Unknown", '[]', "Registeration Denied"),
('WO-00105349', "Vodafone", "Blade", 0.0, 0.0, 0.0, True, "Unknown", '[]', "Not Registered, searching for network"),
('WO-00110610', "Vodafone", "Blade", 0.0, 0.0, 0.0, False, "Unknown", '[]', NULL),
('WO-00110925', "Vodafone", "Blade", 0.0, 12.0, 26.9230769230769, False, "vodafone AU", '["42_43-1", "42_43-1", "99_99-0", "99_99-0", "99_99-0", "99_99-0", "99_99-0", "41_17-4", "41_17-4", "43_22-4", "45_24-4", "45_26-4", "45_23-4", "45_24-4", "45_24-4"]', "Registered, Roaming"),
('WO-00248593', "Vodafone", "Blade", 0.0, 0.0, 0.0, True, "Unknown", '[]', "Registeration Denied");

INSERT INTO TestResult(WorkOrderNo, TestNetworkType, AntennaType,  RSSI, RSCP, RSRP, Timeout, Network, Rawarray, ModemStatus) VALUES
('WO-00104116', "Telstra", "Blade", 0.0, 20.5, 21.76923077, False, "Telstra Mobile", '["41_33-2", "41_33-2", "41_33-2", "99_99-0", "99_99-0", "99_99-0", "28_6-4", "29_6-4", "29_6-4", "28_4-4", "28_7-4", "27_2-4", "28_6-4", "29_11-4", "29_11-4", "28_7-4"]', "Registered, home network"),
('WO-00251301', "Telstra", "Blade", 0.0, 0.0, 61.1333333333333, False, "Telstra Mobile", '["58_12-6", "61_19-6", "61_30-6", "61_30-6", "62_30-6", "62_32-6", "62_32-6", "61_26-6", "61_26-6", "61_30-6", "61_29-6", "61_21-6", "62_27-6", "62_27-6", "61_31-6"]', "Registered, home network"),
('WO-00105349', "Telstra", "Blade", 0.0, 27.2, 0.0, False, "Telstra Mobile", '["28_31-2", "26_27-2", "26_27-2", "26_25-2", "26_25-2", "26_25-2", "25_27-2", "25_27-2", "28_31-2", "28_31-2", "28_31-2", "30_29-2", "30_29-2", "25_25-2", "25_25-2", "25_25-2", "26_29-2", "26_29-2", "26_29-2", "28_29-2", "28_29-2", "28_29-2", "28_29-2", "28_29-2", "29_31-2", "29_31-2", "28_31-2", "28_31-2", "28_31-2", "29_31-2"]', "Registered, home network"),
('WO-00110610', "Telstra", "Blade", 0.0, 0.0, 0.0, False, "Unknown", '[]', NULL),
('WO-00110925', "Telstra", "Blade", 0.0, 16.4, 30.7857142857143, False, "Telstra Mobile", ' ["41_37-2", "41_39-2", "99_99-0", "99_99-0", "99_99-0", "37_22-4", "40_21-4", "43_26-4", "39_23-4", "38_9-4", "38_9-4", "38_7-4", "42_26-4", "37_26-4", "40_26-4", "39_26-4"]', "Registered, home network"),
('WO-00248593', "Telstra", "Blade", 0.0, 0.0, 46.0666666666667, False, "Telstra Mobile", ' ["43_19-6", "43_19-6", "47_23-6", "47_23-6", "47_18-6", "47_18-6", "46_19-6", "46_19-6", "46_19-6", "44_12-6", "47_26-6", "47_23-6", "47_25-6", "47_28-6", "47_28-6"]', "Registered, home network");

-- WHIP TESTS --
INSERT INTO TestResult(WorkOrderNo, TestNetworkType, AntennaType,  RSSI, RSCP, RSRP, Timeout, Network, Rawarray, ModemStatus) VALUES
('WO-00104116', "Vodafone", "Whip", 0.0, 0.0, 0.0, False, 'Unknown', '[]', NULL),
('WO-00251301', "Vodafone", "Whip", 0.0, 0.0, 0.0, False, 'Unknown', '[]', NULL),
('WO-00105349', "Vodafone", "Whip", 0.0, 0.0, 0.0, False, 'Unknown', '[]', NULL),
('WO-00110610', "Vodafone", "Whip", 0.0, 0.0, 0.0, False, 'Unknown', '[]', NULL),
('WO-00110925', "Vodafone", "Whip", 0.0, 0.0, 0.0, False, 'Unknown', '[]', NULL),
('WO-00248593', "Vodafone", "Whip", 0.0, 0.0, 0.0, False, 'Unknown', '[]', NULL);

INSERT INTO TestResult(WorkOrderNo, TestNetworkType, AntennaType,  RSSI, RSCP, RSRP, Timeout, Network, Rawarray, ModemStatus) VALUES
('WO-00104116', "Telstra", "Whip", 0.0, 0.0, 0.0, False, 'Unknown', '[]', NULL),
('WO-00251301', "Telstra", "Whip", 0.0, 0.0, 0.0, False, 'Unknown', '[]', NULL),
('WO-00105349', "Telstra", "Whip", 0.0, 0.0, 0.0, False, 'Unknown', '[]', NULL),
('WO-00110610', "Telstra", "Whip", 0.0, 0.0, 0.0, False, 'Unknown', '[]', NULL),
('WO-00110925', "Telstra", "Whip", 0.0, 0.0, 0.0, False, 'Unknown', '[]', NULL),
('WO-00248593', "Telstra", "Whip", 0.0, 0.0, 0.0, False, 'Unknown', '[]', NULL);

-- EXTERNAL TEXTS --
INSERT INTO TestResult(WorkOrderNo, TestNetworkType, AntennaType, RSSI, RSCP, RSRP, Timeout, Network, Rawarray, ModemStatus) VALUES
('WO-00104116', "External Modem", NULL, 0.0, 0.0, 0.0, False, 'Unknown', '[]', NULL),
('WO-00251301', "External Modem", NULL, 0.0, 0.0, 0.0, False, 'Unknown', '[]', NULL),
('WO-00105349', "External Modem", NULL, 0.0, 0.0, 0.0, False, 'Unknown', '[]', NULL),
('WO-00110610', "External Modem", NULL, 9.0, 0.0, 0.0, False, 'vodafone AU', '["9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I", "9_99-I"]', "Registered, Roaming"),
('WO-00110925', "External Modem", NULL, 0.0, 0.0, 0.0, False, 'Unknown', '[]', NULL),
('WO-00248593', "External Modem", NULL, 0.0, 0.0, 0.0, False, 'Unknown', '[]', NULL);