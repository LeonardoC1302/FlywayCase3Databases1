WITH cte_producer_movements AS (
	SELECT
		pm.producerId,
		COUNT(DISTINCT cm.movementId) AS containerMovementCount,
		SUM(wm.quantity) AS totalWasteAmount
	FROM
		producersXmovements pm
	LEFT JOIN
		wasteMovements wm ON pm.wasteMovementId = wm.wasteMovementId
	LEFT JOIN
		containerMovements cm ON wm.containerId = cm.containerId
	LEFT JOIN 
		addresses ad ON wm.addressId = ad.addressId
	WHERE
		ad.countryId = 1 AND
		cm.postime BETWEEN '2022-01-01' AND '2022-12-31'
	GROUP BY
		pm.producerId
	HAVING
		COUNT(DISTINCT cm.movementId) > 10
)
SELECT
	p.producerName,
	cte.containerMovementCount,
	cte.totalWasteAmount
FROM
	producers p
INNER JOIN
	cte_producer_movements cte ON p.producerId = cte.producerId
ORDER BY
	cte.totalWasteAmount DESC
FOR JSON AUTO;
