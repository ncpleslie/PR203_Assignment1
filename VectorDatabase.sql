CREATE DATABASE Vector;
USE Vector;

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

CREATE TABLE IF NOT EXISTS Subscriber(
SubscriberNo INT NOT NULL auto_increment PRIMARY KEY,
SubscriberName VARCHAR(25),
Address VARCHAR(100)
) engine = InnoDB;