USE vector;

-- This is the query file

/* 1. How many blade and whip antennas have been passed in the signal test for each
network provider? (If both blade and whip passed the test for the same Work Order
Number only consider that as blade) */

SELECT
    -- COUNT(testResult.network),
    testResult.network,
    testResult.antennaType,
    (CASE WHEN (testResult.antennaType = "Blade" AND testResult.antennaType = "Whip") THEN 
    (CASE WHEN (testResult.antennaType = "Blade") THEN COUNT(testResult.antennaType) END)
	END)
FROM
    threshold,
    workorder,
    testResult
WHERE
    testResult.TestNetworkType NOT LIKE 'External Modem' -- Excluding External Modem since out of scope of question(Neither Blade or whip)
    AND testResult.workOrderNo = workOrder.workOrderNo AND
   (testResult.RSSI > threshold.RSSIThreshold
        OR testResult.RSCP > threshold.RSCPThreshold
        OR testResult.RSRP > threshold.RSRPThreshold) 
GROUP BY testResult.network;       

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
    workOrder.DeviceSerialNo = SignalTester.DeviceSerialNo
GROUP BY workOrder.workOrderNo;

-- 7. count the number of log files without GPS coordinates and sort them by iPad models

SELECT 
    COUNT(workOrder.workOrderNo),
    workOrder.location,
    testingDevice.deviceType
FROM
    workOrder,
    testingDevice
WHERE
    testingDevice.DeviceNo = workOrder.DeviceNo
        AND ST_X(location) IS NULL
        AND ST_Y(location) IS NULL
GROUP BY workorder.workorderNo
ORDER BY testingDevice.deviceType;

-- 8. count the number of whip antenna tested vs blade antenna tested

-- 9. Count the number of different modem types used during the test
SELECT COUNT(DISTINCT modemType) as "No. of modem types" FROM SignalTester;

-- 10. Count the number of number of different installers
SELECT COUNT(DISTINCT username) as "No. of installers" FROM employee;