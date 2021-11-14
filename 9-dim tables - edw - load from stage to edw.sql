USE AdventureWorksDWH
GO

/* load data from stage to edw - dim tables */

/** edw.DimCustomer **/
INSERT INTO [edw].[DimCustomer]
           ([CustomerID]
           ,[PersonID]
           ,[PersonType]
           ,[CustomerName]
           ,[StoreID]
           ,[StoreName]
           ,[TerritoryID]
           ,[TerritoryName])
SELECT [CustomerID]
           ,[PersonID]
           ,[PersonType]
           ,[CustomerName]
           ,[StoreID]
           ,[StoreName]
           ,[TerritoryID]
           ,[TerritoryName]
  FROM [stage].[DimCustomer]

GO


/** edw.DimProduct **/
INSERT INTO [edw].[DimProduct]
           ([ProductID]
           ,[ProductName]
           ,[SubCategoryName]
           ,[CategoryName]
           ,[Size]
           ,[Color]
           ,[Style]
           ,[Class])
SELECT [ProductID]
           ,[ProductName]
           ,[SubCategoryName]
           ,[CategoryName]
           ,[Size]
           ,[Color]
           ,[Style]
           ,[Class]
  FROM [stage].[DimProduct]

GO


/** edw.DimSalesPerson **/
INSERT INTO [edw].[DimSalesPerson]
           ([SalesPersonID]
           ,[SalesPersonName]
           ,[TerritoryID]
           ,[TerritoryName]
           ,[CountryCode])
SELECT [SalesPersonID]
      ,[SalesPersonName]
      ,[TerritoryID]
      ,[TerritoryName]
      ,[CountryCode]
  FROM [stage].[DimSalesPerson]

GO

