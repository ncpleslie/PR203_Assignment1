USE vector;

-- This is the query file

/* 1. How many blade and whip antennas have been passed in the signal test for each
network provider? (If both blade and whip passed the test for the same Work Order
Number only consider that as blade) */


-- Vodafone Blade
SELECT 
    COUNT(WorkOrder.WorkOrderNo) as BladeCount,
    VodafoneBladeTest.Network AS VodafoneBlade
FROM
    Threshold,
    VodafoneBladeTest,
    WorkOrder
WHERE
    (VodafoneBladeTest.RSSI > Threshold.RSSIThreshold
        OR VodafoneBladeTest.RSCP > Threshold.RSCPThreshold
        OR VodafoneBladeTest.RSRP > Threshold.RSRPThreshold)
        AND VodafoneBladeTest.WorkOrderNo = WorkOrder.WorkOrderNo
GROUP BY VodafoneBladeTest.Network

UNION

-- Vodafone Whip
SELECT 
    COUNT(WorkOrder.WorkOrderNo) as WhipCount,
    VodafoneWhipTest.Network AS VodafoneWhip
FROM
    Threshold,
    VodafoneWhipTest,
    WorkOrder
WHERE
    (VodafoneWhipTest.RSSI > Threshold.RSSIThreshold
        OR VodafoneWhipTest.RSCP > Threshold.RSCPThreshold
        OR VodafoneWhipTest.RSRP > Threshold.RSRPThreshold)
        AND VodafoneWhipTest.WorkOrderNo = WorkOrder.WorkOrderNo
GROUP BY VodafoneWhipTest.Network

UNION

-- Telstra Blade
SELECT 
    COUNT(WorkOrder.WorkOrderNo) as BladeCount,
    TelstraBladeTest.Network AS TelstraBlade
FROM
    Threshold,
    TelstraBladeTest,
    WorkOrder
WHERE
    (TelstraBladeTest.RSSI > Threshold.RSSIThreshold
        OR TelstraBladeTest.RSCP > Threshold.RSCPThreshold
        OR TelstraBladeTest.RSRP > Threshold.RSRPThreshold)
        AND TelstraBladeTest.WorkOrderNo = WorkOrder.WorkOrderNo
GROUP BY TelstraBladeTest.Network

UNION

-- Telstra Whip
SELECT 
    COUNT(WorkOrder.WorkOrderNo) as WhipCount,
    TelstraWhipTest.Network AS TelstraWhip
FROM
    Threshold,
    TelstraWhipTest,
    WorkOrder
WHERE
    (TelstraWhipTest.RSSI > Threshold.RSSIThreshold
        OR TelstraWhipTest.RSCP > Threshold.RSCPThreshold
        OR TelstraWhipTest.RSRP > Threshold.RSRPThreshold)
        AND TelstraWhipTest.WorkOrderNo = WorkOrder.WorkOrderNo
GROUP BY TelstraWhipTest.Network;
        

-- 6. Count the number of signal log files per Bluetooth Names and print out each of the locations.
-- Assumptions:
/* Signal Log Files refers to the text documents received from Vector */

SELECT 
    signalTester.BTName,
    COUNT(workOrder.workOrderNo) AS 'Log File relating to Bluetooth Name',
    ST_X(workOrder.location) AS 'X Location',
    ST_Y(workOrder.location) AS 'Y Location'
FROM
    signalTester,
    workOrder
WHERE
    workOrder.btName = SignalTester.btName
GROUP BY signalTester.btName;

-- 7. count the number of log files without GPS coordinates and sort them by iPad models

SELECT 
    COUNT(workOrder.workOrderNo),
    workOrder.location,
    testingDevice.deviceType
FROM
    workOrder,
    testingDevice
WHERE
    testingDevice.DeviceSerialNo = workOrder.DeviceSerialNo
        AND ST_X(location) IS NULL
        AND ST_Y(location) IS NULL
ORDER BY testingDevice.deviceType;

-- 8. count the number of whip antenna tested vs blade antenna tested

-- 9. Count the number of different modem types used during the test
SELECT COUNT(DISTINCT modemType) as "No. of modem types" FROM SignalTester;

-- 10. Count the number of number of different installers
SELECT COUNT(DISTINCT username) as "No. of installers" FROM employee;