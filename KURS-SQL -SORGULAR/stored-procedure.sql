--STORED PROCEDURE(SP)
--SP'LER Sqlde parametreli ve parametresiz kullanýlabilen fonksiyonlardýr

/*
Sorgu çalýþma adýmlarý
1-Parse (yazým hatasý var mý)
2-Compile (kod derlenir)
3-execution plan (çalýþma planý oluþturulur)
4-execute (çalýþýr)
*/
--select*from Products --yukarýdaki adýmlar gerçekleþir bunu çalýþtýrýnca



--TÜM ÜRÜNLERÝ ALAN PROCEDURE
CREATE PROCEDURE SP_GET_ALL_PRODUCTS
AS
BEGIN
	select*from Products
END

/*
SPLER parse edilmiþ,compile edilmiþ,execution planý oluþturulmuþ kod bloklarýdýr
Sadece execute edilir.
*/

--SP ÇALIÞTIRMA
exec  SP_GET_ALL_PRODUCTS
execute SP_GET_ALL_PRODUCTS


--Parametreli SP
declare @CATEGORYID INT --deðiþkeni tanýmladýk
set @CATEGORYID=5 --deðer atadýk
select*from Products p where p.CategoryID=@CATEGORYID


--parametreli sp
--CATEGORY ÝD YE GÖRE ÜRÜNLERÝ GETÝREN PROCEDURE metod gibi birþey
CREATE PROC SP_GET_PRODUCTS_BY_CATEGORYID
@CATEGORYID INT  --burasý parametre kýsmý
AS 
BEGIN
	SELECT*FROM Products p where p.CategoryID=@CATEGORYID
END


exec SP_GET_PRODUCTS_BY_CATEGORYID 1  --kategorisi 1 olanlar getir




--------ÇALIÞAN VE ÜLKEYE GÖRE SÝPARÝÞLERÝ GETÝR
CREATE  PROC SP_GET_ORDERS_BY_EMPLOYEE_AND_COUNTRY
@EMPLOYEEFIRSTNAME VARCHAR(50), --PARAMETRE 1
@COUNTRY VARCHAR(20),  --PARAMETRE 2 
@CUSTOMERID int --parametre 3
AS 
BEGIN
	SELECT  o.OrderID as [Sipariþ No],E.FirstName+' '+E.LastName AS [personel],o.OrderDate as [Sipariþ tarihi] FROM Orders O
	INNER JOIN Employees E ON E.EmployeeID=O.EmployeeID  
	AND E.FirstName=@EMPLOYEEFIRSTNAME
	AND  O.ShipCountry=@COUNTRY
	AND O.CustomerID=@CUSTOMERID

END

exec SP_GET_ORDERS_BY_EMPLOYEE_AND_COUNTRY 'Nancy','USA',''


----
--------ÇALIÞAN, ÜLKE VE MÜÞTERÝYE  GÖRE SÝPARÝÞLERÝ GETÝR
ALTER  PROC SP_GET_ORDERS_BY_EMPLOYEE_AND_COUNTRY
@EMPLOYEEFIRSTNAME VARCHAR(50), --PARAMETRE 1
@COUNTRY VARCHAR(20),  --PARAMETRE 2 
@CUSTOMERID VARCHAR(50) 
AS 
BEGIN
	SELECT  o.OrderID as [Sipariþ No],O.CustomerID AS [MÜÞTERÝ],E.FirstName+' '+E.LastName AS [personel],o.OrderDate as [Sipariþ tarihi] FROM Orders O
	INNER JOIN Employees E ON E.EmployeeID=O.EmployeeID  
	AND E.FirstName=@EMPLOYEEFIRSTNAME
	AND  O.ShipCountry=@COUNTRY
	AND O.CustomerID=@CUSTOMERID

END

exec SP_GET_ORDERS_BY_EMPLOYEE_AND_COUNTRY 'Nancy','USA','RATTC'



-----------
DROP PROC SP_GET_ORDERS_BY_EMPLOYEE_AND_COUNTRY --PROCEDURÜ SÝLER.


-----------------------SORULAR VE CEVAPLARI----------------------

-------1)yaþý 50 den büyük,ingilterede oturmayan çalýþanlarý RAPORLA

CREATE PROC SP_GET_NONEGLISH_EMPLOYEES_OLDER_THAN_50
@YAS int
AS 
BEGIN
	select *from Employees e where e.Country!='UK' AND  DATEDIFF(YEAR,e.BirthDate,GETDATE())>@YAS 
END
 
 exec SP_GET_NONEGLISH_EMPLOYEES_OLDER_THAN_50 50


 --2)x yýlýndan sonra alýnmýþ,kargo ücreti Yden büyük ve z ülkesine gönderilmemiþ sipariþlerin idleri,kargo ücretleri,sipariþ tarih,ülke bilgileri gelsin

 ALTER PROC SP_GET_ORDERS_BY_PARAMETERS1
 @YIL int,
 @KARGOUCRETI money ,
 @ULKE VARCHAR(50)
 AS 
 BEGIN 
	select o.OrderID,sum(o.Freight) AS [kargo ücreti],o.OrderDate,o.ShipCountry from Orders o 
	 where YEAR(O.OrderDate)>@YIL and o.Freight>@KARGOUCRETI AND o.ShipCountry!=@ULKE
	group by o.OrderID,o.OrderDate,o.ShipCountry
 END 

 exec SP_GET_ORDERS_BY_PARAMETERS1 1996,60,'UK'


 --3)kimseye rapor vermeyen çalýþan
 CREATE PROC SP_GET_MANAGERS
 AS 
 BEGIN
 select *from Employees e where e.ReportsTo is null 
 END


 exec SP_GET_MANAGERS

 --4)x idli müþterilerimin satýn aldýðý ,y nolu personelin onayladýðý ,z nolu kargo firmasýyla taþýnmýþ ve shipregion kolonu null olan sipariþleri listeleyin
 alter PROC SP_GET_ORDERS_BY_PARAMETERS2
 @CUSTOMERID varchar(50),
 @EMPLOYEEID int,
 @SHIPPERID int
 AS 
 BEGIN
	select c.CustomerID,e.EmployeeID,s.ShipperID from ORDERS O
	inner join Employees e on e.EmployeeID=O.EmployeeID
	inner join Customers c on c.CustomerID=O.CustomerID 
	inner join Shippers s on s.ShipperID=O.ShipVia
	where 
	c.CustomerID=@CUSTOMERID and
	o.EmployeeID=@EMPLOYEEID and
	s.ShipperID=@SHIPPERID   and 
	O.ShipRegion is null
 END

 exec SP_GET_ORDERS_BY_PARAMETERS2 'VINET',5,3

 --

 --5)Baþ harfi x olan ,stokta bulunan y ve z dolar arasý ücreti olan ürünleri fiyatlarýna göre artan ve azalan sýralayýn.

 CREATE PROC SP_GET_PRODUCTS_BY_PARAMETERS1
 @BASHARF VARCHAR(50),
 @STOKBASLANGIC int,
 @STOKBITIS inT,
 @SIRALAMA int 
 AS 
 BEGIN
	if(@SIRALAMA=1)
	begin
	select *from Products p 
	where 
   SUBSTRING(p.ProductName,1,1)=@BASHARF AND p.UnitsInStock>0 AND p.UnitsInStock between @STOKBASLANGIC and @STOKBITIS
   order by p.UnitPrice
	end
	else if(@SIRALAMA=2)
	begin
	select *from Products p 
	where 
   SUBSTRING(p.ProductName,1,1)=@BASHARF AND p.UnitsInStock>0 AND p.UnitsInStock between @STOKBASLANGIC and @STOKBITIS
   order by p.UnitPrice desc
	end
 END
 
 exec SP_GET_PRODUCTS_BY_PARAMETERS1 'C',20,100,2

 --6) x customer idsine sahip müþteriden alýnmýþ, y nolu kargo firmasýyla taþýnmamýþ,ücreti z ve t dolar arasý olan sipariþlere toplam ne kadar kargo ücreti ödenmiþtir

 ALTER PROC  SP_GET_FREIGHT_BY_PARAMETERS
 @CUSTOMERID varchar(50),
 @KARGOFIRMA int,
 @UCRETBASLANGIC int ,
 @UCRETBITIS int 
 AS 
 BEGIN
	select c.CustomerID,s.ShipperID,SUM(o.Freight) AS [toplam kargo bedeli] from Orders o
	inner join Customers c on c.CustomerID=o.CustomerID
	inner join Shippers s on o.ShipVia=s.ShipperID
	where
	c.CustomerID=@CUSTOMERID and s.ShipperID!=@KARGOFIRMA and (o.Freight between  @UCRETBASLANGIC and @UCRETBITIS)
	group by c.CustomerID,s.ShipperID
 END

 exec SP_GET_FREIGHT_BY_PARAMETERS 'VINET',5,20,100
 
 --7)ÜLKERE GÖRE PERSONEL SAYISI
 ALTER PROC SP_GET_EMPLOYEES_BY_COUNTRY
 AS 
 BEGIN
	select e.Country,COUNT(e.EmployeeID) as [personel sayýsý] from Employees e 
	group by e.Country
 END

 exec SP_GET_EMPLOYEES_BY_COUNTRY

 --8) X MÜÞTERÝSÝ hangi üründe  toplam ne kadar tutarýnda sipariþ vermiþ 
 alter PROC SP_GET_ORDERSUM_BY_CUSTOMER
 @MUSTERIID varchar(50)
 AS 
 BEGIN
	select c.CustomerID,p.ProductName,sum(ord.UnitPrice*ord.Quantity) AS [toplam]from  [Order Details] ord 
	inner join Products p on p.ProductID=ord.ProductID
	inner join Orders o on o.OrderID=ord.OrderID
	inner join Customers c on c.CustomerID=o.CustomerID
	where
	c.CustomerID= @MUSTERIID
	group by c.CustomerID,p.ProductName
 END

 exec  SP_GET_ORDERSUM_BY_CUSTOMER 'ALFKI'

 -----------------------------------------------------------

 /*INSERT,UPDATE ÝÇÝN PROCEDURELER*/

 CREATE PROC SP_INSERT_CATEGORY
 @CategoryID nvarchar(50),
 @Description nvarchar(50)
 AS
 BEGIN
	insert into Categories(CategoryName,[Description])
	values(@CategoryID, @Description)
 END


 exec SP_INSERT_CATEGORY 'Ýçeçecekler','Tüm içecek çeþitleri vs..'
 
 
 --Category 
 --Products
 --Employee
 --Shipper 
 --Supplier için yapýn
 
 --------INSERT ÝÇÝN PROCEDURELER

 --products için
  alter PROC SP_INSERT_PRODUCTS
@ProductName  nvarchar(40),
@SupplierID int, 
@CategoryID int, 
@QuantityPerUnit nvarchar(40), 
@UnitPrice   money, 
@UnitsInStock smallint, 
@UnitsOnOrder smallint,  
@ReorderLevel smallint,  
@Discontinued bit
AS
  BEGIN
  insert into Products(ProductName, SupplierID, CategoryID, QuantityPerUnit, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued)
	values(@ProductName,@SupplierID,@CategoryID,@QuantityPerUnit,@UnitPrice,@UnitsInStock,@UnitsOnOrder,@ReorderLevel,@Discontinued) 
  END

  --parametreler girilecek
   exec SP_INSERT_PRODUCTS 'Süt',1,1,'1',5,30,63,52,5


   --shippers için
CREATE PROC SP_INSERT_SHIPPERS
@CompanyName nvarchar(40), 
@Phone nvarchar(24)
AS
BEGIN
	insert into Shippers(CompanyName,Phone)
	values(@CompanyName, @Phone)
END

--parametreler girilecek
 exec SP_INSERT_SHIPPERS 'Ramazan A.þ','021545'


 --suppliers için
CREATE PROC SP_INSERT_SUPPLIERS
@CompanyName nvarchar(40),
@ContactName nvarchar(30), 
@ContactTitle nvarchar(30), 
@Address nvarchar(60),
@City nvarchar(15), 
@Region nvarchar(15), 
@PostalCode nvarchar(10), 
@Country nvarchar(15), 
@Phone nvarchar(24), 
@Fax nvarchar(24), 
@HomePage ntext
AS 
BEGIN

insert into Suppliers(CompanyName, ContactName, ContactTitle, Address, City, Region, PostalCode, Country, Phone, Fax, HomePage)
	values(@CompanyName, @ContactName, @ContactTitle, @Address, @City, @Region, @PostalCode, @Country, @Phone, @Fax, @HomePage)

END

--parametreler girilecek
 exec SP_INSERT_SUPPLIERS


 CREATE PROC SP_INSERT_EMPLOYEE
@LastName nvarchar(20), 
@FirstName nvarchar(10), 
@Title nvarchar(30),
@TitleOfCourtesy datetime,
@BirthDate datetime, 
@HireDate datetime ,
@Address nvarchar(60),
@City nvarchar(15),
@Region nvarchar(15),
@PostalCode nvarchar(10),
@Country nvarchar(15),
@HomePhone nvarchar(24),
@Extension nvarchar(4),
@Photo image, 
@Notes ntext,
@ReportsTo int, 
@PhotoPath nvarchar(255)
 AS
 BEGIN
  insert into Employees(LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone, Extension, Photo, Notes, ReportsTo, PhotoPath) values(@LastName, @FirstName, @Title, @TitleOfCourtesy, @BirthDate, @HireDate, @Address, @City, @, @PostalCode, @Country, @HomePhone, @Extension, @Photo, @Notes, @ReportsTo, @PhotoPath)

 END

 --parametreler girilecek
  exec SP_INSERT_EMPLOYEE
 -------------------------------------------------

 -----UPDATE  ÝÇÝN PROCEDURELER

 --category için
CREATE PROC SP_UPDATE_CATEGORY
@CategoryID int, 
@CategoryName nvarchar(15),
@Description ntext, 
@Picture image
AS
BEGIN
	UPDATE Categories 
	SET 
	CategoryName=@CategoryName,
	[Description]=@Description
	where 
	CategoryID=@CategoryID
END

--parametreler gelicek
exec SP_UPDATE_CATEGORY 1


--product için
CREATE PROC SP_UPDATE_PRODUCTS
@ProductID int, 
@ProductName nvarchar(40),
@SupplierID int,
@CategoryID int,
@QuantityPerUnit nvarchar(20),
@UnitPrice money,
@UnitsInStock smallint,
@UnitsOnOrder smallint,
@ReorderLevel smallint,
@Discontinued bit
AS
BEGIN
UPDATE Products 
	SET 
	ProductName=@ProductName, 
	SupplierID=@SupplierID, 
	CategoryID=@CategoryID, 
	QuantityPerUnit=@QuantityPerUnit, 
	UnitPrice=@UnitPrice, 
	UnitsInStock=@UnitsInStock, 
	UnitsOnOrder=@UnitsOnOrder, 
	ReorderLevel=@ReorderLevel, 
	Discontinued=@Discontinued 
	where 
	ProductID=@ProductID

END

--parametreler gelicek
exec  SP_UPDATE_PRODUCTS  78,'Süttttt',2,7,'9',9,9,9,9,9



--employee için update 
CREATE PROC SP_UPDATE_EMPLOYEES
@EmployeeID int ,
@LastName nvarchar(20),
@FirstName nvarchar(10),
@Title nvarchar(30),
@TitleOfCourtesy nvarchar(30),
@BirthDate datetime, 
@HireDate datetime, 
@Address nvarchar(60),
@City nvarchar(15),
@Region nvarchar(15),
@PostalCode nvarchar(10),
@Country nvarchar(15), 
@HomePhone nvarchar(24),
@Extension nvarchar(4), 
@Photo image,
@Notes ntext,
@ReportsTo int, 
@PhotoPath  nvarchar(255)
AS 
BEGIN
update Employees set EmployeeID=@EmployeeID, LastName=@LastName, FirstName=@FirstName, Title=@Title, TitleOfCourtesy=@TitleOfCourtesy, BirthDate=@BirthDate, HireDate=@HireDate, Address=@Address, City=@City, Region=@Region, PostalCode=@PostalCode, Country=@Country, HomePhone=@HomePhone, Extension=@Extension, Photo=@Photo, Notes=@Notes, ReportsTo=@ReportsTo, PhotoPath=@PhotoPath 
where 
	EmployeeID=@EmployeeID
END

--parametreler gelicek
exec SP_UPDATE_EMPLOYEES 

--shipper için update
CREATE PROC SP_UPDATE_SHIPPER
@ShipperID,
@CompanyName,
@Phone
AS
BEGIN
 UPDATE Shippers set ShipperID=@ShipperID,CompanyName=@CompanyName,Phone=@Phone
 where ShipperID=@ShipperID
END

--parametreler gelicek
exec SP_UPDATE_SHIPPER



--SP OUTPUT PARAMETER
create PROC SP_INSERT_ORDER
@CUSTOMERID VARCHAR(10),
@EMPLOYEEID INT,
@ORDERDATE DATETIME,
@SHIPPERID INT,
@ORDERID INT OUTPUT
AS
BEGIN
	INSERT INTO Orders(CustomerID,EmployeeID,OrderDate,ShipVia)
	values(@CUSTOMERID ,@EMPLOYEEID,@ORDERDATE,@SHIPPERID)

	select @ORDERID=SCOPE_IDENTITY() --bulunduðu kod bloðunda yapýlan insert iþlemine ait kaydýn identity deðerini döndürür
	--print @ORDERID
	--select @ORDERID
END

 go 

create PROC SP_INSERT_ORDER_DETAILS
@ORDERID INT,
@PRODUCTID INT,
@UNITPRICE MONEY,
@QUANTITY INT,
@DISCOUNT REAL
AS 
BEGIN
	INSERT INTO [Order Details] 
	VALUES(@ORDERID,@PRODUCTID,@UNITPRICE,@QUANTITY,@DISCOUNT)
END



DECLARE @ORDERID INT 
exec SP_INSERT_ORDER 'VINET',1,'2016-09-09',1,@ORDERID OUTPUT

select @ORDERID

exec SP_INSERT_ORDER_DETAILS @ORDERID,1,10,5,0



select*from orders o  where O.OrderID=11094 
select *from [Order Details] od where od.OrderID=11094


select*from Orders
select*from [Order Details]



