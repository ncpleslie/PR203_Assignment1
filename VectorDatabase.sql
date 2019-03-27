DROP DATABASE IF EXISTS Vector;

CREATE DATABASE Vector;
USE Vector;

DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS TestingDevice;
DROP TABLE IF EXISTS Threshold;
DROP TABLE IF EXISTS ExternalTest;
DROP TABLE IF EXISTS TestResults;

CREATE TABLE IF NOT EXISTS Employee(
Username VARCHAR(9) NOT NULL PRIMARY KEY
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS TestingDevice(
DeviceNo INT NOT NULL PRIMARY KEY,
DeviceType ENUM("iPad Air", "iPad6,12", "iPad7,2"),
BatteryLevel FLOAT(3,2),
AppVersionNo VARCHAR(5)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS SignalTester(
DeviceSerialNo VARCHAR(8) NOT NULL PRIMARY KEY,
BTName VARCHAR(8),
BTSignal LONGTEXT,
ModemType ENUM("EWM400", "EWM1000"),
FirmwareNo VARCHAR(8),
SIMVodafone VARCHAR(20),
SIMTelstra VARCHAR(20),
SIMExternal VARCHAR(20)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS Threshold(
ThresholdId INT NOT NULL auto_increment PRIMARY KEY,
RSSIThreshold FLOAT(3,1),
RSSIHigherThreshold FLOAT(3,1),
RSCPThreshold FLOAT(3,1),
RSCPHigherThreshold FLOAT(3,1),
RSRPThreshold FLOAT(3,1),
RSRPHigherThreshold FLOAT(3,1)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS WorkOrder(
WorkOrderNo VARCHAR(11) NOT NULL PRIMARY KEY,
TheDate DATETIME,
Location POINT,
GPSAccuracy ENUM("kCLLocationAccuracyKilometer"),
-- FOREIGN KEYS --
Username VARCHAR(9),
DeviceNo INT,
ThresholdId INT,
DeviceSerialNo VARCHAR(8),
FOREIGN KEY (Username) REFERENCES Employee(Username),
FOREIGN KEY (DeviceNo) REFERENCES TestingDevice(DeviceNo),
FOREIGN KEY (ThresholdId) REFERENCES Threshold(ThresholdId),
FOREIGN KEY (DeviceSerialNo) REFERENCES SignalTester(DeviceSerialNo)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS TestResult(
ExternalBladeTestId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
TestNetworkType ENUM("Telstra", "Vodafone", "External Modem"),
AntennaType ENUM("Whip", "Blade"),
RSSI FLOAT(11, 8),
RSCP FLOAT(11, 8),
RSRP FLOAT(11, 8),
Timeout BOOLEAN,
Network ENUM("vodafone AU", "Unknown", "Telstra Mobile"),
RawArray LONGTEXT,
ModemStatus ENUM("Registered, Roaming", "Registered, home network", "Not Registered, searching for network", "Registeration Denied"),
-- FOREIGN KEY --
WorkOrderNo VARCHAR(11) NOT NULL,
FOREIGN KEY (WorkOrderNo) REFERENCES WorkOrder(WorkOrderNo)
) engine = InnoDB;