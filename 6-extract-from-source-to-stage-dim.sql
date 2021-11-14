use AdventureWorksDWH

/**** from source table, Load/insert into stage.DimCustomer  ******/

truncate table [AdventureWorksDWH].[stage].[DimCustomer]
INSERT INTO [stage].[DimCustomer]
           ([CustomerID]
           ,[PersonID]
           ,[PersonType]
           ,[CustomerFirstName]
           ,[CustomerLastName]
           ,[StoreID]
           ,[StoreName]
           ,[TerritoryID]
           ,[TerritoryName])

SELECT     c.CustomerID
           ,c.PersonID
		   ,p.PersonType
		   ,p.FirstName
		   ,p.LastName
           ,c.StoreID
		   ,store.Name as StoreName
           ,c.TerritoryID
           ,s.Name as TerritoryName
FROM AdventureWorks2019.Sales.Customer c
inner join AdventureWorks2019.Sales.SalesTerritory s
on c.TerritoryID=s.TerritoryID
left join AdventureWorks2019.Person.Person p
on c.PersonID=p.BusinessEntityID
left join AdventureWorks2019.Sales.Store store
on c.StoreID=store.BusinessEntityID
--where ((StoreID is not null and PersonID is null) or (PersonID is not null and StoreID is Null))


/**** from source table, Load/insert into stage.DimProduct  ******/

truncate table [AdventureWorksDWH].[stage].DimProduct
INSERT INTO [stage].[DimProduct]
           ([ProductID]
           ,[ProductName]
           ,[SubCategoryName]
           ,[CategoryName]
           ,[Size]
           ,[Color]
           ,[Style]
           ,[Class])

SELECT      p.ProductID
           ,p.Name as ProductName
           ,sub.Name as SubCategoryName
		   ,cat.Name as CategoryName
           ,p.Size
           ,p.Color
		   ,p.Style
		   ,p.Class

FROM AdventureWorks2019.Production.Product p
left join AdventureWorks2019.Production.ProductSubcategory sub
on p.ProductSubcategoryID=sub.ProductSubcategoryID
left join AdventureWorks2019.Production.ProductCategory cat
on sub.ProductCategoryID=cat.ProductCategoryID




/**** from source table, Load/insert into stage.DimSalesPerson  ******/

truncate table [AdventureWorksDWH].[stage].[DimSalesPerson]
INSERT INTO [stage].[DimSalesPerson]
           ([SalesPersonID]
           ,[FirstName]
           ,[LastName]
           ,[TerritoryID]
           ,[TerritoryName]
           ,[CountryCode]
		   ,[JobTitle])

SELECT sp.BusinessEntityID
           ,p.FirstName
           ,p.LastName
		   ,sp.TerritoryID
           ,st.Name as TerritoryName
		   ,st.CountryRegionCode as CountryCode
		   ,e.JobTitle

FROM AdventureWorks2019.Sales.SalesPerson sp
inner join AdventureWorks2019.Person.Person p
on sp.BusinessEntityID=p.BusinessEntityID
full join AdventureWorks2019.Sales.SalesTerritory st
on sp.TerritoryID=st.TerritoryID
left join AdventureWorks2019.HumanResources.Employee e
on sp.BusinessEntityID=e.BusinessEntityID