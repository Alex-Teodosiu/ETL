USE [AdventureWorksDWH]


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[edw].[DimCustomer]') AND type IN (N'U'))
BEGIN
CREATE TABLE edw.DimCustomer (
 C_ID INT IDENTITY(1,1) NOT NULL,
 CustomerID INT NOT NULL,
 PersonID INT,
 PersonType NCHAR(2),
 CustomerName NVARCHAR(100),
 StoreID INT,
 StoreName NVARCHAR(50),
 TerritoryID INT,
 TerritoryName NVARCHAR(50)
);

ALTER TABLE edw.DimCustomer ADD CONSTRAINT PK_DimCustomer PRIMARY KEY (C_ID);
END
GO



IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[edw].[DimProduct]') AND type IN (N'U'))
BEGIN
CREATE TABLE edw.DimProduct (
 PO_ID INT IDENTITY(1,1) NOT NULL,
 ProductID INT NOT NULL,
 ProductName NVARCHAR(50),
 SubCategoryName NVARCHAR(50),
 CategoryName NVARCHAR(50),
 Size NVARCHAR(5),
 Color NVARCHAR(15),
 Style NCHAR(2),
 Class NCHAR(2)
);

ALTER TABLE edw.DimProduct ADD CONSTRAINT PK_DimProduct PRIMARY KEY (PO_ID);
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[edw].[DimSalesPerson]') AND type IN (N'U'))
BEGIN
CREATE TABLE edw.DimSalesPerson (
 SP_ID INT IDENTITY(1,1) NOT NULL,
 SalesPersonID INT,
 SalesPersonName NVARCHAR(100),
 TerritoryID INT,
 TerritoryName NVARCHAR(50),
 CountryCode NVARCHAR(3)
);

ALTER TABLE edw.DimSalesPerson ADD CONSTRAINT PK_DimSalesPerson PRIMARY KEY (SP_ID);
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[edw].[FactSale]') AND type IN (N'U'))
BEGIN
CREATE TABLE edw.FactSale (
 SalesOrderID INT NOT NULL,
 PO_ID INT NOT NULL,
 SP_ID INT NOT NULL,
 C_ID INT NOT NULL,
 OrderDateID INT NOT NULL,
 ShippedDateID INT NOT NULL,
 LineTotal NUMERIC(38,6),
 Quantity SMALLINT,
 UnitPriceDiscount MONEY
);

ALTER TABLE edw.FactSale ADD CONSTRAINT PK_FactSale PRIMARY KEY (SalesOrderID,PO_ID,SP_ID,C_ID,OrderDateID,ShippedDateID);


ALTER TABLE edw.FactSale ADD CONSTRAINT FK_FactSale_0 FOREIGN KEY (PO_ID) REFERENCES edw.DimProduct (PO_ID);
ALTER TABLE edw.FactSale ADD CONSTRAINT FK_FactSale_1 FOREIGN KEY (SP_ID) REFERENCES edw.DimSalesPerson (SP_ID);
ALTER TABLE edw.FactSale ADD CONSTRAINT FK_FactSale_2 FOREIGN KEY (C_ID) REFERENCES edw.DimCustomer (C_ID);
ALTER TABLE edw.FactSale ADD CONSTRAINT FK_FactSale_3 FOREIGN KEY (OrderDateID) REFERENCES edw.DimDate (DateID);
ALTER TABLE edw.FactSale ADD CONSTRAINT FK_FactSale_4 FOREIGN KEY (ShippedDateID) REFERENCES edw.DimDate (DateID);
END
GO

