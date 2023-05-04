WITH cte_producer_waste_movements AS (
    SELECT
        p.producerId AS producerId,
        p.producerName AS producerName,
        COUNT(DISTINCT cm.movementId) AS containerMovementCount,
        SUM(wm.quantity) AS totalWasteAmount
    FROM
        producers p
        INNER JOIN producersXmovements pm ON p.producerId = pm.producerId
        INNER JOIN wasteMovements wm ON pm.wasteMovementId = wm.wasteMovementId
        INNER JOIN wastes w ON wm.wasteId = w.wasteId AND w.wasteType = 2
        INNER JOIN containerMovements cm ON wm.containerId = cm.containerId AND cm.postime BETWEEN '2022-01-01' AND '2022-12-31'
        INNER JOIN addresses ad ON wm.addressId = ad.addressId AND ad.countryId = 1
    GROUP BY
        p.producerId, p.producerName
    HAVING
        COUNT(DISTINCT cm.movementId) > 10
)
SELECT *
FROM cte_producer_waste_movements
ORDER BY
    totalWasteAmount DESC
FOR JSON AUTO;
