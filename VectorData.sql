USE Vector;

INSERT INTO Employee(Username) VALUES
("Pikachu")
,("Eevee")
,("Celebi")
,("Snorlax")
,("Charizard")
,("Mewtwo")
;
INSERT INTO TestingDevice(DeviceSerialNo, DeviceType, BatteryLevel, ModemType, FirmwareNo, AppVersionNo, BTName, BTSignal, SIMVodafone, SIMTelstra, SIMExternal) VALUES 
('SDS-043C', 'iPad Air', 3.92, 'EWM400', 'GAT-17R3', '2.2.5', 'CORSSRAY', '[-76.0, -72.0, -66.0]', "89314404000248186935", "89610180002249048341", NULL)
,("SDS-196B", "iPad6,12", 3.92, "EWM400", "GAT-17R3", "2.2.5", "REAPER", "[-59.0, -52.0]", "89314404000248157530", "89610180002243817774", NULL)
,("SDS-061C", "iPad Air", 3.88, "EWM400", "GAT-17R3", "2.2.5", "DIXIE", "[-83.0, -74.0, -79.0]", "89314404000266650267", "89610180002249046930", NULL)
,("SDS-008C", "iPad6,12", 3.94, "EWM1000", "GAT-17R3", "2.2.5", "ASSAM", "[-91.0, -87.0, -81.0, -70.0, -86.0, -74.0, -76.0]", NULL, NULL, "89314404000266723023")
,("SDS-049C", "iPad7,2", 3.69, "EWM400", "GAT-17R3", "2.2.5", "DAIBRAVE", "[-76.0, -69.0, -69.0, -76.0, -73.0, -76.0]", "89314404000248233075", "89610180002249047685", NULL)
,("SDS-026C", "iPad Air", 3.88, "EWM400", "GAT-17R3", "2.2.5", "CARIVOU", "[-76.0, -85.0]", "89314404000281178914", "89610180002249045296", NULL)
;
INSERT INTO Threshold(RSSIThreshold, RSSIHigherThreshold, RSCPThreshold, RSCPHigherThreshold, RSRPThreshold, RSRPHigherThreshold) VALUES
(6.0, 12.0, 15.0, 30.0, 10.0, 20.0)
;

-- Work Order --
INSERT INTO WorkOrder(WorkOrderNo, TheDate, AntennaTestType, GPSLong, GPSLat, ThresholdId, Username, TestingDeviceId) VALUES 
('WO-00104116', DATE_FORMAT(STR_TO_DATE("1-5-2018--8-5", "%d-%m-%Y--%H-%i"),'%Y-%m-%d %H:%i'), 'Blade/Whip', 152.7524324, -27.60477169, 1, "Pikachu", 'SDS-043C')
,('WO-00251301', DATE_FORMAT(STR_TO_DATE("19-2-2019--13-14", "%d-%m-%Y--%H-%i"),'%Y-%m-%d %H:%i'), 'Blade/Whip', NULL, NULL, 1, "Eevee", 'SDS-196B')
,('WO-00105349', DATE_FORMAT(STR_TO_DATE("30-4-2018--14-48", "%d-%m-%Y--%H-%i"),'%Y-%m-%d %H:%i'), 'Blade/Whip', 139.34259429587, -35.6776790181507, 1, "Celebi", 'SDS-061C')
,('WO-00110610', DATE_FORMAT(STR_TO_DATE("17-4-2018--10-41", "%d-%m-%Y--%H-%i"),'%Y-%m-%d %H:%i'), 'Blade/Whip', 152.984367638172, -27.4171041995673, 1, "Snorlax", 'SDS-008C')
,('WO-00110925', DATE_FORMAT(STR_TO_DATE("26-4-2018--10-31", "%d-%m-%Y--%H-%i"),'%Y-%m-%d %H:%i'), 'Blade/Whip', 153.024695282944, -27.1806907654062, 1, "Charizard", 'SDS-049C')
,('WO-00248593', DATE_FORMAT(STR_TO_DATE("19-2-2019--8-42", "%d-%m-%Y--%H-%i"),'%Y-%m-%d %H:%i'), 'Blade/Whip', 152.971914761231,  -27.0792295037818, 1, "Mewtwo", 'SDS-026C')
;


-- TODO
-- ADD THE TEST DATA

-- BLADE TESTS
INSERT INTO VodafoneBladeTest(WorkOrderNo, RSSI, RSCP, RSRP, Timeout, Network, Rawarray, ModemStatus) VALUES
(
'WO-00104116', 0, 14.625, 23.08333333, False, "vodafone AU", '["39_33-1", "39_33-1", "39_37-1", "99_99-0", "99_99-0", "99_99-0", "99_99-0", "99_99-0", "40_18-4", "40_18-4", "40_18-4", "39_29-4", "39_23-4", "39_23-4", "40_29-4"]', "Registered, Roaming"
);
INSERT INTO TelstraBladeTest(WorkOrderNo, RSSI, RSCP, RSRP, Timeout, Network, Rawarray, ModemStatus) VALUES
(
'WO-00104116', 0, 20.5, 21.76923077, False, "Telstra Mobile", '["41_33-2", "41_33-2", "41_33-2", "99_99-0", "99_99-0", "99_99-0", "28_6-4", "29_6-4", "29_6-4", "28_4-4", "28_7-4", "27_2-4", "28_6-4", "29_11-4", "29_11-4", "28_7-4"]', "Registered, home network"
);
INSERT INTO ExternalBladeTest(WorkOrderNo, RSSI, RSCP, RSRP, Timeout, Network, Rawarray, ModemStatus) VALUES
(
'WO-00104116', 0, 0, 0, False, 'Unknown', '[]', null
);

-- WHIP TESTS --
INSERT INTO VodafoneWhipTest(WorkOrderNo, RSSI, RSCP, RSRP, Timeout, Network, Rawarray, ModemStatus) VALUES
(
'WO-00104116', 0, 0, 0, False, "Unknown", '[]', null
);
INSERT INTO TelstraWhipTest(WorkOrderNo, RSSI, RSCP, RSRP, Timeout, Network, Rawarray, ModemStatus) VALUES
(
'WO-00104116', 0, 0, 0, False, "Unknown", '[]', null
);
INSERT INTO ExternalWhipTest(WorkOrderNo, RSSI, RSCP, RSRP, Timeout, Network, Rawarray, ModemStatus) VALUES
(
'WO-00104116', 0, 0, 0, False, 'Unknown', '[]', null
);

SELECT * FROM workorder;