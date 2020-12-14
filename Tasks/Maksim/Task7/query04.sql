--Query 4
DELETE FROM tempdb.dbo.Orders
OUTPUT deleted.orderid,
	   deleted.orderdate
WHERE orderdate < '20110801'
;
