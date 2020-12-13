--Query 12
MERGE tempdb.dbo.Product p1
USING AdventureWorks2019.Production.Product p2
ON p1.ProductID = p2.ProductID
WHEN MATCHED AND 
         (
		   p1.ModifiedDate != p2.ModifiedDate
		 ) THEN 
UPDATE SET
	p1.ModifiedDate= p2.ModifiedDate,
	p1.ListPrice = p2.ListPrice
WHEN NOT MATCHED THEN
INSERT (Name,
       ProductNumber,
       MakeFlag,
       FinishedGoodsFlag,
       Color,
       SafetyStockLevel,
       ReorderPoint,
       StandardCost,
       ListPrice,
       Size,
       SizeUnitMeasureCode,
       WeightUnitMeasureCode,
       Weight,
       DaysToManufacture,
       ProductLine,
       Class,
       Style,
       ProductSubcategoryID,
       ProductModelID,
       SellStartDate,
       SellEndDate,
       DiscontinuedDate,
       rowguid,
       ModifiedDate)
VALUES  ( p2.Name,
       p2.ProductNumber,
       p2.MakeFlag,
       p2.FinishedGoodsFlag,
       p2.Color,
       p2.SafetyStockLevel,
       p2.ReorderPoint,
       p2.StandardCost,
       p2.ListPrice,
       p2.Size,
       p2.SizeUnitMeasureCode,
       p2.WeightUnitMeasureCode,
       p2.Weight,
       p2.DaysToManufacture,
       p2.ProductLine,
       p2.Class,
       p2.Style,
       p2.ProductSubcategoryID,
       p2.ProductModelID,
       p2.SellStartDate,
       p2.SellEndDate,
       p2.DiscontinuedDate,
       p2.rowguid,
       GETDATE())
WHEN NOT MATCHED BY SOURCE THEN
DELETE
OUTPUT p2.ProductID
;
