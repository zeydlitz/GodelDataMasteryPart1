--Query 6
UPDATE tempdb.dbo.Customers
SET StoreName = '<None>'
OUTPUT deleted.CustomerID,
       deleted.StoreName AS oldregion,
       inserted.StoreName AS newregion
WHERE StoreName IS NULL
;
