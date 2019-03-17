INSERT INTO Employee(Username) VALUES
(
"Pikachu"
);
INSERT INTO TestingDevice(DeviceType, BatteryLevel, ModemType, FirmwareNo, AppVersionNo, BTSignal, BluetoothName, DeviceSerialNo) VALUES 
(
'iPad Air',  3.92, 'EWM400', 'GAT-17R3', '2.2.5', ' [-76.0, -72.0, -66.0]', ' CORSSRAY',  'SDS-043C'
);
INSERT INTO Threshold(RSSIThreshold, RSSIHigherThreshold, RSCPThreshold, RSCPHigherThreshold, RSRPThreshold, RSRPHigherThreshold) VALUES
(
6.0, 12.0, 15.0, 30.0, 10.0, 20.0
);

-- Work Order --
INSERT INTO WorkOrder(WorkOrderNo, TheDate, AntennaTestType, GPSLong, GPSLat, ThresholdId, Username, TestingDeviceId) VALUES 
(
'WO-00104116', '1-5-2018--8-5', 'Blade/Whip', 152.7524324, -27.60477169, 1, "Pikachu", 'SDS-043C'
);

-- BLADE TESTS --
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