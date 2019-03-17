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
EmployeeId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
Username VARCHAR(25)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS TestingDevice(
TestingDeviceId INT NOT NULL auto_increment PRIMARY KEY,
DeviceType VARCHAR(25),
BatteryLevel FLOAT,
ModemType VARCHAR(6),
FirmwareNo VARCHAR(8),
AppVersionNo VARCHAR(5),
BTSignal VARCHAR(100),
BluetoothName VARCHAR(50),
DeviceSerialNo VARCHAR(25)
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

CREATE TABLE IF NOT EXISTS ExternalTest(
ExternalTestId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
RSSI FLOAT,
RSCP FLOAT,
RSRP FLOAT,
Timeout BOOLEAN,
Network VARCHAR(25),
Rawarray VARCHAR(255),
ModemStatus VARCHAR(50)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS TelstraTest(
TelstraTestId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
RSSI FLOAT,
RSCP FLOAT,
RSRP FLOAT,
Timeout BOOLEAN,
Network VARCHAR(25),
Rawarray VARCHAR(255),
ModemStatus VARCHAR(50)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS VodafoneTest(
VodafoneTestId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
RSSI FLOAT,
RSCP FLOAT,
RSRP FLOAT,
Timeout BOOLEAN,
Network VARCHAR(25),
Rawarray VARCHAR(255),
ModemStatus VARCHAR(50)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS WorkOrder(
WorkOrderNo INT NOT NULL PRIMARY KEY,
TheDate VARCHAR(25),
AntennaTestType VARCHAR(10),
GPSLong FLOAT,
GPSLat FLOAT,
-- FOREIGN KEYS --
EmployeeId INT,
TestingDeviceId INT,
VodafoneTestId INT,
TelstraTestId INT,
ExternalTestId INT,
ThresholdId INT,
FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId),
FOREIGN KEY (TestingDeviceId) REFERENCES TestingDevice(TestingDeviceId),
FOREIGN KEY (VodafoneTestId) REFERENCES VodafoneTest(VodafoneTestId),
FOREIGN KEY (TelstraTestId) REFERENCES TelstraTest(TelstraTestId),
FOREIGN KEY (ExternalTestId) REFERENCES ExternalTest(ExternalTestId),
FOREIGN KEY (ThresholdId) REFERENCES Threshold(ThresholdId)
) engine = InnoDB;
