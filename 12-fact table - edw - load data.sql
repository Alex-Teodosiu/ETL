USE AdventureWorksDWH
GO

/** edw.FactSale :: load data from stage area **/

INSERT INTO [edw].[FactSale]
           ([SalesOrderID]
           ,[PO_ID]
           ,[SP_ID]
           ,[C_ID]
           ,[OrderDateID]
           ,[ShippedDateID]
           ,[LineTotal]
           ,[Quantity]
           ,[UnitPriceDiscount])
SELECT [SalesOrderID]
      ,[P_ID]
      ,[SP_ID]
      ,[C_ID]
	  ,dd.DateID as OrderDate
	  ,dd.DateID as ShippedDate
      ,[LineTotal]
      ,[Quantity]
      ,[UnitPriceDiscount]
  FROM [stage].[FactSale] fs
  inner join edw.DimDate dd
  on fs.OrderDate=dd.CalenderDate

GO
