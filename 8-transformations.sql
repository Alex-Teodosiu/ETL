USE AdventureWorksDWH
go


/******** stage.DimSalesPerson *********/

/** Merge FirstName and LastName into SalesPersonName **/
UPDATE [AdventureWorksDWH].[stage].DimSalesPerson
SET SalesPersonName=CONCAT(FirstName, ' ', LastName)
FROM [AdventureWorksDWH].[stage].DimSalesPerson
go

/** clean nulls for TerritoryID, CountryCode **/
UPDATE [AdventureWorksDWH].[stage].DimSalesPerson
SET TerritoryID=0, CountryCode='n/a'
FROM AdventureWorksDWH.stage.DimSalesPerson
WHERE TerritoryID IS NULL or CountryCode IS NULL
go

/** insert jobtitle as TerritoryName for managers **/
UPDATE AdventureWorksDWH.stage.DimSalesPerson
SET TerritoryName=JobTitle
FROM AdventureWorksDWH.stage.DimSalesPerson
WHERE TerritoryName IS NULL



/******** stage.DimCustomer *********/

/*** Merge FirstName and LastName into CustomerName ***/
UPDATE [AdventureWorksDWH].[stage].[DimCustomer]
SET CustomerName=CONCAT(CustomerFirstName, ' ', CustomerLastName)
FROM [AdventureWorksDWH].[stage].[DimCustomer]
go


UPDATE [AdventureWorksDWH].[stage].[DimCustomer]
SET StoreID=-1
WHERE StoreID is null

UPDATE [AdventureWorksDWH].[stage].[DimCustomer]
SET StoreName='n/a'
WHERE StoreName is null

UPDATE [AdventureWorksDWH].[stage].[DimCustomer]
SET PersonID=-1
WHERE PersonID is null

UPDATE [AdventureWorksDWH].[stage].[DimCustomer]
SET PersonType='S'
WHERE PersonType is null

UPDATE [AdventureWorksDWH].[stage].[DimCustomer]
SET CustomerFirstName='n/a'
WHERE CustomerFirstName is null

UPDATE [AdventureWorksDWH].[stage].[DimCustomer]
SET CustomerLastName='n/a'
WHERE CustomerLastName is null






UPDATE [AdventureWorksDWH].[stage].DimProduct
SET SubCategoryName='n/a'
WHERE SubCategoryName is null

UPDATE [AdventureWorksDWH].[stage].DimProduct
SET CategoryName='n/a'
WHERE CategoryName is null

UPDATE [AdventureWorksDWH].[stage].DimProduct
SET Size='n/a'
WHERE Size is null

UPDATE [AdventureWorksDWH].[stage].DimProduct
SET Color='n/a'
WHERE Color is null

UPDATE [AdventureWorksDWH].[stage].DimProduct
SET Style='NA'
WHERE Style is null

UPDATE [AdventureWorksDWH].[stage].DimProduct
SET Class='NA'
WHERE Class is null


UPDATE [AdventureWorksDWH].[stage].FactSale
SET SalesPersonID=-1
WHERE SalesPersonID is null

