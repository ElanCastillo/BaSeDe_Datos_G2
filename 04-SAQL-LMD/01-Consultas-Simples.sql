--SQL-LMD(insert,delete,update,,select)

USE NORTHWND;
GO

SELECT * 
FROM Categories;

SELECT *
FROM Products;

SELECT *
FROM Suppliers;

SELECT *
FROM Customers;

SELECT *
FROM Employees;

SELECT *
FROM Shippers;

SELECT *
FROM ORDERS;

SELECT *
FROM [Order Details];

--Proyeccion
SELECT CustomerID,CompanyName,City
FROM Customers;

--Alias de columna
SELECT CustomerID AS 'Numero Empleado',
CompanyName Empresa,
City AS Ciudad,
ContactName AS [Nombre del Contacto]
FROM Customers;

--Alias de Tabla
SELECT Customers.CustomerID AS [Numero Clientes],
	Customers.CompanyName AS [Empresa],
	Customers.ContactName AS [Nombre del Contacto]
FROM Customers;

SELECT c.CustomerID AS [Numero Clientes],
	c.CompanyName AS [Empresa],
	c.ContactName AS [Nombre del Contacto]
FROM Customers AS c;

SELECT c.CustomerID AS [Numero Clientes],
	c.CompanyName AS [Empresa],
	c.ContactName AS [Nombre del Contacto]
FROM Customers c;

--Campo Calculado
SELECT *,(UnitPrice*Quantity) AS [Total]
FROM [Order Details];

SELECT od.OrderID AS [Numero de Orden],
od.ProductId AS [Numero Producto],
od.UnitPrice AS [Precio],
od.Quantity AS [Cantidad],
(UnitPrice*Quantity) AS [Total]
FROM [Order Details] AS od;

--Seleccionar todos loa productos que
--pertenezcan a la categoria 1 y su valor total de los productos
SELECT * 
FROM
Products
WHERE CategoryID=1;

--Total productos
Select p.ProductID AS [Numero],
p.ProductName AS [Nombre],
p.CategoryID AS [Categoria],
p.UnitPrice AS [Precio],
p.UnitsInStock AS [Cantidad],
(p.UnitPrice * p.UnitsInStock) as [Costo]
FROM 
Products AS p
Where CategoryID = 1;

--Seleccionar todos los productos de la 
--categoria Condiments
Select p.ProductID AS [Numero],
p.ProductName AS [Nombre],
p.CategoryID AS [Categoria],
p.UnitPrice AS [Precio],
p.UnitsInStock AS [Cantidad],
(p.UnitPrice * p.UnitsInStock) as [Costo]
FROM 
Products AS p
Where CategoryID = 2;

--Seleccionar todos los productos
--que su precio sea mayor a 40.3
SELECT *
FROM Products;

Select p.ProductID AS [Numero],
p.ProductName AS [Nombre Producto],
p.UnitPrice AS [Precio]
FROM 
Products AS p
Where p.UnitPrice>40.3;


--Seleccionar todos los productos
--que su precio sea mayor o igual a 40
Select p.ProductID AS [Numero],
p.ProductName AS [Nombre Producto],
p.UnitPrice AS [Precio]
FROM 
Products AS p
Where p.UnitPrice>=40

Select p.ProductID AS [Numero],
p.ProductName AS [Nombre Producto],
p.CategoryID AS [Categoria],
p.UnitPrice AS [Precio]

FROM 
Products AS p
Where p.CategoryID !=3;

--Seleccionar todas las ordenes
--Que sean de brazil Rio De Janeiro 
--Mostrando solo el numero de orden 
--Fecha de Orden,Pais de envio,
--Y la ciudad y su tranpostista

SELECT *
FROM Customers;

SELECT o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha de Orden],
o.ShipCity AS [Ciudad],
o.ShipCountry AS [Pais],
o.ShipVia AS [Transportista]
FROM Orders AS o
WHERE ShipCity='Rio de Janeiro';

SELECT o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha de Orden],
o.ShipCity AS [Ciudad],
o.ShipCountry AS [Pais],
o.ShipVia AS [Transportista]
FROM Orders AS o
WHERE ShipRegion is null;

--Seleccionar todas las ordendes ,
SELECT o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha de Orden],
o.ShipCity AS [Ciudad],
o.ShipCountry AS [Pais],
o.ShipVia AS [Transportista],
o.ShipRegion AS [Region]
FROM Orders AS o
WHERE ShipRegion is not null;

--Seleccionar todas las ordenes enviadas
--brazil,alemania y mexico;
Select *
FROM Orders;

SELECT o.OrderID AS [Numero de Orden],
o.OrderDate AS [Fecha de Orden],
o.ShipCity AS [Ciudad],
o.ShipCountry AS [Pais],
o.ShipVia AS [Transportista]
o.ShipRegion AS [Region]
FROM Orders AS o
WHERE(o.ShipCountry='Mexico'
or o.ShipCountry ='Germany'
or o.ShipCountry='Brazil')
and o,ShipRegion is  null,
ORDER BY o.ShipCountry ASC, o.ShipCity DESC;

--Seleccionar todas las ordenedes 
--Francia ,Alemania  Argentina (clasue -in)
SELECT *
FROM Orders
WHERE ShipCountry in ('Germany','France','Argentina');

--sELECCIONAR Todos los prodcutos
--Descontinuados o con precio mayor a 50
--Y Ordenados por el precio	
SELECT *
FROM Products;

SELECT p.ProductID,p.ProductName,
p.Discontinued,p.UnitPrice
FROM Products as p
WHERE p.Discontinued =1 or
p.UnitPrice>50
ORDER BY p.UnitPrice DESC;