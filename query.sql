SELECT
	p.producerName AS producerName,
	COUNT(DISTINCT cm.movementId) AS containerMoventCount,
	SUM(wm.quantity) AS totalWasteAmount
FROM
	producers p
LEFT JOIN
	producersXmovements pm ON p.producerId = pm.producerId
LEFT JOIN
	wasteMovements wm ON pm.wasteMovementId = wm.wasteMovementId
LEFT JOIN
	wastes w ON wm.wasteId = w.wasteId
LEFT JOIN
	containerMovements cm ON wm.containerId = cm.containerId
LEFT JOIN 
	addresses ad ON wm.addressId = ad.addressId
WHERE
	ad.countryId = 1 AND
	
	cm.postime BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY
	p.producerName
HAVING
	COUNT(DISTINCT cm.movementId) > 10
ORDER BY
	totalWasteAmount DESC
FOR JSON AUTO;