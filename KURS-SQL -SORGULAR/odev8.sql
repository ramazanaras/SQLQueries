--1
select e.FirstName,e.LastName from Employees e
--2 
select e.FirstName +''+e.LastName as [Ad Soyad] ,DATEDIFF(YEAR,e.BirthDate,GETDATE()) as Yaþý from Employees e

--3
select p.ProductName,(p.UnitPrice*p.UnitsInStock) as maliyet,(p.UnitPrice)*1.1 as [kdvli fiyat] from Products p

--4
select * from Products p where p.UnitPrice>10

--5 
select*from Employees e where e.City='London'

--6
select * from  Orders o
inner join Customers c on c.CustomerID=o.CustomerID
where c.CustomerID='ALFKI' 

--7
select *from Products P
inner join Categories c on c.CategoryID=P.CategoryID
where c.CategoryID=5

--8 
select * from Employees e  where e.TitleOfCourtesy='Ms.'

--9
select *from Orders o where YEAR(o.OrderDate)=1997

--10
select *from Products P where P.UnitPrice between 30 and 90 

--11
select *from Orders o where YEAR(o.OrderDate)=1997 and MONTH(o.OrderDate)=06 and o.ShipCity='London' 

--12
select ord.ProductID,SUM(ord.UnitPrice*ord.Quantity) as [toplam fiyat] from [Order Details] ord
inner join Orders o on o.OrderID=ord.OrderID 
where o.OrderID='10578'
group by ord.ProductID

--13 
select *from Orders o where YEAR(o.OrderDate)=1997 and MONTH(o.OrderDate)=01 and ShipCity in('London','France')

--14
select*from Orders o where YEAR(o.OrderDate)=1998  and o.ShippedDate is null

--15
select *from Products p
inner join Categories c on c.CategoryID=p.CategoryID
where c.CategoryID=2 and p.UnitsInStock>15

--16
select *from Employees e where e.Country!='US' and e.TitleOfCourtesy!='Dr.'

--17
select *from Orders o 
inner join Shippers s on s.ShipperID=o.ShipVia
where s.ShipperID=2 and o.Freight between 10 and 100

--18
select *from Orders o 
order by o.CustomerID

--19
select *from Suppliers s 
order by s.CompanyName

--20
select *from Products p 
inner join Categories c on c.CategoryID=p.CategoryID
where c.CategoryID=1
order by p.UnitPrice desc

--21
select top 3 o.Freight from Shippers s
inner join Orders o on o.ShipVia=s.ShipperID
where YEAR(o.OrderDate)=1996 and MONTH(o.OrderDate)=12
order by o.Freight desc

--22
select top 5 *  from  Products P
order by p.UnitPrice desc

--23
select top 3 o.Freight from Orders o 
inner join Shippers s on s.ShipperID=o.ShipVia
where YEAR(o.ShippedDate)=1998 and o.EmployeeID=2
order by o.Freight 

--24
select*from Employees e 
where e.Country!='USA' and YEAR(e.BirthDate)<1973

--25
select *from Orders o where o.Freight between 30 and 60

--26
select *from Customers c where c.CustomerID between 'CACTU' and 'DUMON'

--27
select*from Orders o where o.OrderDate between '1997.01.01 00:00:00.000' and '1997.07.30 00:00:00.000'

--28
select*from Employees e where e.Photo is not null and e.EmployeeID between 3 and 8

--29
select*from Customers c where c.CompanyName like '___ON%'

--30
select *from Customers c where c.CompanyName like 'A[^N]%'