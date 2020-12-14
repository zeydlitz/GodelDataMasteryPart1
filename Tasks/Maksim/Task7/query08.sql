--Query 8
IF OBJECT_ID('tempdb.dbo.Product', 'U') IS NOT NULL
DROP TABLE tempdb.dbo.Product
SELECT * INTO tempdb.dbo.Product FROM AdventureWorks2019.Production.Product;
ALTER TABLE tempdb.dbo.Product
ADD RowNum int;
DECLARE @id INT
SET @id = 0
UPDATE tempdb.dbo.Product
SET @id = Product.RowNum = @id + 1
GO
;
