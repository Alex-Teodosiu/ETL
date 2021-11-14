USE AdventureWorksDWH
GO


/** LOOKUP SURROGATE KEYS **/

/** Customer ID **/
UPDATE AdventureWorksDWH.stage.FactSale
SET C_ID = edw.C_ID
FROM AdventureWorksDWH.edw.DimCustomer edw
WHERE stage.FactSale.CustomerId=edw.CustomerId
GO


/** Product ID **/
UPDATE AdventureWorksDWH.stage.FactSale
SET P_ID = edw.PO_ID
FROM AdventureWorksDWH.edw.DimProduct edw
WHERE stage.FactSale.ProductId=edw.ProductId
GO

/** SalesPerson ID **/
UPDATE AdventureWorksDWH.stage.FactSale
SET SP_ID = edw.SP_ID
FROM AdventureWorksDWH.edw.DimSalesPerson edw
WHERE stage.FactSale.SalesPersonID=edw.SalesPersonID
GO




