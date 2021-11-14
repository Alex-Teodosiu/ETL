USE [AdventureWorksDWH]
GO

/**** from source data, Load/insert into stage.FactSale  ******/

truncate table [AdventureWorksDWH].[stage].[FactSale]

INSERT INTO [stage].[FactSale]
           ([SalesOrderID]
           ,[ProductID]
           ,[SalesPersonID]
           ,[CustomerID]
           ,[LineTotal]
           ,[Quantity]
           ,[UnitPriceDiscount]
           ,[OrderDate]
           ,[ShippedDate])

SELECT  soh.SalesOrderID
           ,sod.ProductID
		   ,soh.SalesPersonID
		   ,soh.CustomerID
           ,sod.LineTotal
           ,sod.OrderQty as Quantity
           ,sod.UnitPriceDiscount
           ,soh.OrderDate
           ,soh.ShipDate as ShippedDate
FROM AdventureWorks2019.Sales.SalesOrderHeader soh
left join AdventureWorks2019.Sales.SalesOrderDetail sod
on soh.SalesOrderID=sod.SalesOrderID