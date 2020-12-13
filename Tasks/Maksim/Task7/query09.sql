--Query 9
WITH Del_T AS
(
	SELECT TOP(10) *
	FROM tempdb.dbo.Product
	WHERE Product.FinishedGoodsFlag = 1
	ORDER BY ListPrice
)
DELETE FROM Del_T
;
