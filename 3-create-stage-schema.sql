USE AdventureWorksDWH

EXEC sp_changedbowner 'sa';
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[stage].[DimCustomer]') AND type in (N'U'))
BEGIN
CREATE TABLE stage.DimCustomer (
 CustomerID INT NOT NULL,
 PersonID INT,
 PersonType NCHAR(2),
 CustomerFirstName NVARCHAR(50),
 CustomerLastName NVARCHAR(50),
 CustomerName NVARCHAR(100),
 StoreID INT,
 StoreName NVARCHAR(50),
 TerritoryID INT,
 TerritoryName NVARCHAR(50)
);

--ALTER TABLE stage.DimCustomer ADD CONSTRAINT PK_DimCustomer PRIMARY KEY (CustomerID);
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[stage].[DimProduct]') AND type in (N'U'))
BEGIN
CREATE TABLE stage.DimProduct (
 ProductID INT NOT NULL,
 ProductName NVARCHAR(50),
 SubCategoryName NVARCHAR(50),
 CategoryName NVARCHAR(50),
 Size NVARCHAR(5),
 Color NVARCHAR(15),
 Style NCHAR(2),
 Class NCHAR(2)
);

--ALTER TABLE stage.DimProduct ADD CONSTRAINT PK_DimProduct PRIMARY KEY (ProductID);
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[stage].[DimSalesPerson]') AND type in (N'U'))
BEGIN
CREATE TABLE stage.DimSalesPerson (
 SalesPersonID INT NOT NULL,
 FirstName NVARCHAR(50),
 LastName NVARCHAR(50),
 SalesPersonName NVARCHAR(100),
 TerritoryID INT,
 TerritoryName NVARCHAR(50),
 CountryCode NVARCHAR(3),
 JobTitle NVARCHAR(50)
);

--ALTER TABLE stage.DimSalesPerson ADD CONSTRAINT PK_DimSalesPerson PRIMARY KEY (SalesPersonID);
END
GO


IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[stage].[FactSale]') AND type in (N'U'))
BEGIN
CREATE TABLE stage.FactSale (
 SalesOrderID INT NOT NULL,
 ProductID INT NOT NULL,
 P_ID INT,
 SalesPersonID INT,
 SP_ID INT,
 CustomerID INT,
 C_ID INT,
 LineTotal NUMERIC(38,6),
 Quantity SMALLINT,
 UnitPriceDiscount MONEY,
 OrderDate DATETIME NOT NULL,
 ShippedDate DATETIME
);

--ALTER TABLE stage.FactSale ADD CONSTRAINT PK_FactSale PRIMARY KEY (SalesOrderID,ProductID);
END
GO

