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
        

