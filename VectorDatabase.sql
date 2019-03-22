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
Username VARCHAR(9) NOT NULL PRIMARY KEY
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS TestingDevice(
DeviceSerialNo VARCHAR(8) NOT NULL PRIMARY KEY,
DeviceType ENUM("iPad Air", "iPad6,12", "iPad7,2"),
BatteryLevel FLOAT,
ModemType ENUM("EWM400", "EWM1000"),
FirmwareNo ENUM("GAT-17R3"),
AppVersionNo VARCHAR(5),
BTName VARCHAR(8),
BTSignal LONGTEXT,
SIMVodafone VARCHAR(20),
SIMTelstra VARCHAR(20),
SIMExternal VARCHAR(20)
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
TheDate DATETIME,
AntennaTestType ENUM("Blade and/or Whip"),
Location POINT,
GPSAccuracy ENUM("kCLLocationAccuracyKilometer"),
-- FOREIGN KEYS --
Username VARCHAR(9),
TestingDeviceId VARCHAR(8),
ThresholdId INT,
FOREIGN KEY (Username) REFERENCES Employee(Username),
FOREIGN KEY (TestingDeviceId) REFERENCES TestingDevice(DeviceSerialNo),
FOREIGN KEY (ThresholdId) REFERENCES Threshold(ThresholdId)
) engine = InnoDB;

CREATE TABLE IF NOT EXISTS ExternalModemTest(
ExternalBladeTestId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
RSSI FLOAT,
RSCP FLOAT,
RSRP FLOAT,
Timeout BOOLEAN,
Network ENUM("vodafone AU", "Unknown", "Telstra Mobile"),
RawArray LONGTEXT,
ModemStatus ENUM("Registered, Roaming", "Registered, home network", "Not Registered, searching for network", "Registeration Denied"),
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
Network ENUM("vodafone AU", "Unknown", "Telstra Mobile"),
RawArray LONGTEXT,
ModemStatus ENUM("Registered, Roaming", "Registered, home network", "Not Registered, searching for network", "Registeration Denied"),
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
Network ENUM("vodafone AU", "Unknown", "Telstra Mobile"),
RawArray LONGTEXT,
ModemStatus ENUM("Registered, Roaming", "Registered, home network", "Not Registered, searching for network", "Registeration Denied"),
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
Network ENUM("vodafone AU", "Unknown", "Telstra Mobile"),
RawArray LONGTEXT,
ModemStatus ENUM("Registered, Roaming", "Registered, home network", "Not Registered, searching for network", "Registeration Denied"),
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
Network ENUM("vodafone AU", "Unknown", "Telstra Mobile"),
RawArray LONGTEXT,
ModemStatus ENUM("Registered, Roaming", "Registered, home network", "Not Registered, searching for network", "Registeration Denied"),
-- FOREIGN KEY --
WorkOrderNo VARCHAR(11) NOT NULL,
FOREIGN KEY (WorkOrderNo) REFERENCES WorkOrder(WorkOrderNo)
) engine = InnoDB;