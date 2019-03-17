DROP DATABASE IF EXISTS Vector;

CREATE DATABASE Vector;
USE Vector;

DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS TestingDevice;
DROP TABLE IF EXISTS Threshold;
DROP TABLE IF EXISTS ExternalTest;
DROP TABLE IF EXISTS TelstraTest;
DROP TABLE IF EXISTS VodafoneTest;
DROP TABLE IF EXISTS WorkOrder;

CREATE TABLE IF NOT EXISTS Employee(
Username VARCHAR(25) NOT NULL PRIMARY KEY
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS TestingDevice(
DeviceSerialNo VARCHAR(25) NOT NULL PRIMARY KEY,
DeviceType VARCHAR(25),
BatteryLevel FLOAT,
ModemType VARCHAR(6),
FirmwareNo VARCHAR(8),
AppVersionNo VARCHAR(5),
BTSignal VARCHAR(100),
BluetoothName VARCHAR(50)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS Threshold(
ThresholdId INT NOT NULL auto_increment PRIMARY KEY,
RSSIThreshold FLOAT,
RSSIHigherThreshold FLOAT,
RSCPThreshold FLOAT,
RSCPHigherThreshold FLOAT,
RSRPThreshold FLOAT,
RSRPHigherThreshold FLOAT
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS WorkOrder(
WorkOrderNo VARCHAR(11) NOT NULL PRIMARY KEY,
TheDate VARCHAR(25),
AntennaTestType VARCHAR(10),
GPSLong FLOAT,
GPSLat FLOAT,
-- FOREIGN KEYS --
Username VARCHAR(25),
TestingDeviceId VARCHAR(25),
ThresholdId INT,
FOREIGN KEY (Username) REFERENCES Employee(Username),
FOREIGN KEY (TestingDeviceId) REFERENCES TestingDevice(DeviceSerialNo),
FOREIGN KEY (ThresholdId) REFERENCES Threshold(ThresholdId)

/*VodafoneTestId INT,
TelstraTestId INT,
ExternalTestId INT,
FOREIGN KEY (VodafoneTestId) REFERENCES VodafoneTest(VodafoneTestId),
FOREIGN KEY (TelstraTestId) REFERENCES TelstraTest(TelstraTestId),
FOREIGN KEY (ExternalTestId) REFERENCES ExternalTest(ExternalTestId),
 */
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS ExternalBladeTest(
ExternalBladeTestId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
RSSI FLOAT,
RSCP FLOAT,
RSRP FLOAT,
Timeout BOOLEAN,
Network VARCHAR(25),
Rawarray VARCHAR(255),
ModemStatus VARCHAR(50),
-- FOREIGN KEY --
WorkOrderNo VARCHAR(11) NOT NULL,
FOREIGN KEY (WorkOrderNo) REFERENCES WorkOrder(WorkOrderNo)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS ExternalWhipTest(
ExternalWhipTestId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
RSSI FLOAT,
RSCP FLOAT,
RSRP FLOAT,
Timeout BOOLEAN,
Network VARCHAR(25),
Rawarray VARCHAR(255),
ModemStatus VARCHAR(50),
-- FOREIGN KEY --
WorkOrderNo VARCHAR(11) NOT NULL,
FOREIGN KEY (WorkOrderNo) REFERENCES WorkOrder(WorkOrderNo)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS TelstraBladeTest(
TelstraBladeTestId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
RSSI FLOAT,
RSCP FLOAT,
RSRP FLOAT,
Timeout BOOLEAN,
Network VARCHAR(25),
Rawarray VARCHAR(255),
ModemStatus VARCHAR(50),
-- FOREIGN KEY --
WorkOrderNo VARCHAR(11) NOT NULL,
FOREIGN KEY (WorkOrderNo) REFERENCES WorkOrder(WorkOrderNo)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS TelstraWhipTest(
TelstraWhipTestId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
RSSI FLOAT,
RSCP FLOAT,
RSRP FLOAT,
Timeout BOOLEAN,
Network VARCHAR(25),
Rawarray VARCHAR(255),
ModemStatus VARCHAR(50),
-- FOREIGN KEY --
WorkOrderNo VARCHAR(11) NOT NULL,
FOREIGN KEY (WorkOrderNo) REFERENCES WorkOrder(WorkOrderNo)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS VodafoneBladeTest(
VodafoneBladeTestId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
RSSI FLOAT,
RSCP FLOAT,
RSRP FLOAT,
Timeout BOOLEAN,
Network VARCHAR(25),
Rawarray VARCHAR(255),
ModemStatus VARCHAR(50),
-- FOREIGN KEY --
WorkOrderNo VARCHAR(11) NOT NULL,
FOREIGN KEY (WorkOrderNo) REFERENCES WorkOrder(WorkOrderNo)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS VodafoneWhipTest(
VodafoneWhipTestId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
RSSI FLOAT,
RSCP FLOAT,
RSRP FLOAT,
Timeout BOOLEAN,
Network VARCHAR(25),
Rawarray VARCHAR(255),
ModemStatus VARCHAR(50),
-- FOREIGN KEY --
WorkOrderNo VARCHAR(11) NOT NULL,
FOREIGN KEY (WorkOrderNo) REFERENCES WorkOrder(WorkOrderNo)
) engine = InnoDB;

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