--Query 10
WITH In_T AS
(
    SELECT TOP(10) *
    FROM AdventureWorks2019.Production.Product
    WHERE Product.FinishedGoodsFlag = 1
    ORDER BY ListPrice
)
INSERT INTO tempdb.dbo.Product (
      Name,
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
SELECT
      Name,
      ProductNumber,
      MakeFlag,
      FinishedGoodsFlag,
      Color,
      SafetyStockLevel,
      ReorderPoint,
      StandardCost,
      ListPrice + 5,
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
      GETDATE()
FROM IN_t;
;
