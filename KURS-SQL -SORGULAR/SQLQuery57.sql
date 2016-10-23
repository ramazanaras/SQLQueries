--DML(DATA MANIPULATION LANGUAGE)
--CRUD (CREATE ,READ,UPDATE,DELETE)

--SELECT (vERÝ OKUMA)

SELECT * FROM Employees  --Employees tablosundan tüm verileri getir.

select *from customers 

select *from Products

--Kolonlara göre veri çekme
select CustomerID,CompanyName,ContactName,Phone from Customers

select FirstName,LastName,City,Country From Employees

--Alias(Tablo takma Adlarý/kýsaltmalarý)

select P.ProductName,P.UnitPrice from products P

--kolon isimlendirmeleri

select P.ProductName AS [Ürün Adý],P.UnitPrice AS [Birim Fiyat] from products P

--string birleþtrime (string concatenation)

select E.TitleOfCourtesy+' '+E.FirstName+''+E.LastName As [Ad Soyad] from Employees E

--Genel Sorgular
select 'Ramazan Aras' AS [Ýsmim]
select GETDATE() AS [BUGÜN]

--COUNT
select count(*) AS [Ürün Adedi] from Products

--MAX
SELECT MAX(P.UnitPrice) AS [EN PAHALI ÜRÜN] FROM Products P 

--MÝN
SELECT MIN(P.UnitPrice) AS [EN DÜÞÜK ÜRÜN] FROM Products P

--4 ÝÞLEM 


SELECT 4*5 AS [Toplam],8-4 AS [Fark],8*4 AS [ÇARPIM]
SELECT 4+5 


--GENEL TOPLAM 
SELECT SUM(P.UnitsInStock) FROM Products P

--Stoklarýmda toplam ne kadar tutarda ürün var?
select SUM(P.UnitsInStock*P.UnitPrice) AS [ÜRÜNLER TOPLAMI] FROM Products P

--TOP
SELECT TOP 10 *FROM Products P

--ORDER BY
SELECT P.ProductName FROM Products P ORDER BY P.UnitPrice DESC

--en pahalý ürün
select top 1 *from Products P order by P.UnitPrice desc

--koþullar(filtreleme)
select*from Employees E where E.Country='USA'

select P.ProductName,P.UnitPrice from Products P where P.CategoryID=8 order by P.UnitsInStock desc 


--koþullar(filtreleme)-çoklu koþul
select P.ProductName,P.UnitPrice from Products P where P.CategoryID=8 AND P.UnitsInStock > 0  AND P.UnitsInStock > 10  order by P.UnitsInStock desc 


select P.ProductName,P.UnitPrice from Products P where P.CategoryID=4 OR P.CategoryID=5    order by P.UnitsInStock desc 

--KOÞULLAR eþitsizlik
select P.ProductName,P.UnitPrice from Products P where P.CategoryID<>8    order by P.UnitsInStock desc 

--metinsel iþlemler
select UPPER('ahmet açýkgöz')
select LOWER('AHMET AÇIKGÖZ')

select REVERSE('istanbul')

select LEFT('istanbul',4)
select RIGHT('istanbul',4)

select SUBSTRING('istanbul',2,3)

--tarih fonksiyonlarý

select GETDATE()

select DAY('2012/10/11')
select DAY(GETDATE())--günü döndürür
select MONTH(getdate())--ayý döndürür
select YEAR(GETDATE())--yýlý döndürür

--VAROLAN bir tarihe belirli bir zaman eklemek
select DATEADD(Day,45,GETDATE())
select DATEADD(month,48,'1900/06/11')
select DATEDIFF(day,'1938/07/13',GETDATE())

select datename(WEEKDAY,'1983/07/13')

select datename(dayofyear,GETDATE())

select e.FirstName,e.LastName, DATEDIFF(YEAR,Birthdate,GETDATE()) as Yaþ from Employees e

select e.FirstName+' '+e.LastName as [ÇAlýþan ad soyad],YEAR(Hiredate) from Employees e where YEAR(Hiredate)>1993

select OrderID from Orders where MONTH(OrderDate)=9--eylül ayý 

select O.OrderID,O.CustomerID from Orders O where O.Freight>=25 and O.Freight<=100--freight:kargo ücreti.

select O.OrderID,O.CustomerID from Orders O where O.Freight  between  25 and 100

--yaþý 50den büyük ve ingilterede oturmaya çalýþanlarý adlarýnýn ilk üç harfi

select SUBSTRING(FirstName,2,3) as Ad,Country from Employees where Country!='UK' and DATEDIFF(YEAR,Birthdate,GETDATE())>50

--1997 dahil yýlýndan sonra alýnmýþ,kargo ücreti 20den büyük ve fransaya gönderilmemiþ sipariþlerin Idleri,kargo ücretleri,sipariþ tarih,ülke bilgileri gelsin

select OrderID,OrderDate,ShipCountry from Orders where YEAR(OrderDate)>=1997 and Freight>20 and ShipCountry!='France'

--nul ifade kontrolü

select *from Customers where Region is null

select *from Customers where Region is not null

--kimseye rapor vermeyen çalýþanlar
select * from Employees where ReportsTo is null

--category idsi 5 olan ürün fiyatý 20 den büyük ve 300den küçük olan ve stok durumu null olmayan ürünlerin bilgileri gelsin

select * from Products where CategoryID=5 and UnitPrice>20 and UnitPrice<300 and UnitsInStock is not null

--alfký ve dumon idli müþterilerimin satýn aldýðý 1 nolu personelin onayladýðý 3 nolu kargo ifrmasýyla taþýnmýþ ve shipregion kolonu null olan sipariþleri listeleyin

select *from Orders where (CustomerID='ALFKI' or CustomerID='DUMON') and EmployeeID=1 and ShipVia=3 and ShipRegion is null

select *from Orders where CustomerID in('ALFKI','DUMON') and EmployeeID=1 and ShipVia=3 and ShipRegion is null

--ürünlerden stok miktarý 50den büyük olanlarýn ürün adlarýný ,birim fiyatlarýný ve stok miktarlarýný ürün fiyatýna göre azalan þekilde listeleyin.

select ProductName,UnitPrice,UnitsInStock from Products where UnitsInStock>50 order by UnitPrice desc

--belirli kayýtlarý alma
--en ucuz 9 ürün
select top 9 productName ,UnitPrice from Products order by UnitPrice

--with ties
select top 9 with ties productName ,UnitPrice from Products order by UnitPrice
 
 --en son teslim edilecek olan 5 sipariþi gösterin
 select  top 5 with ties OrderID,RequiredDate from Orders order by RequiredDate desc

 --en falza kargo bedeli ödenen sipariþin idsi ve kargo bedeli gelsin
 select top 1 OrderID,Freight from Orders order by Freight desc

 --baþ harfi C olan ,stokta bulunan 10-250 dolar ücreti olan ürünleri fiyatlarýna göre artan sýralayýnýz

 select *from Products P where SUBSTRING(P.ProductName,1,1)='C' and  P.UnitsInStock is not null and P.UnitPrice between 10 and 250 order by P.UnitPrice asc

 --çarþamba günü alýanan kargo ücreti 20-75 arasý olan shippeddate'i null olmayan sipariþlein bilgilerini raporlayýnýz ve orderýdye göre büyükten küçükten doðru sýralayýn

 select *from Orders O where datename(weekday,O.OrderDate)='Wednesday' and Freight between 20 and 75 and o.ShippedDate is not null order by o.OrderID desc 

 --arama iþlemleri 
 --company nameleri A ile baþlayan müþteriler gelsin 
 --a ile baþlayan
 select CompanyName from Customers where CompanyName like 'A%'--a ile baþlayan

 select CompanyName from Customers where CompanyName like '%A'--a ile biten

  select CompanyName from Customers where CompanyName like '%AB%'--içinde ab geçen

  --mon ile biten
  select CustomerID from Customers where CustomerID like '__MON'

  --customer idlerden ilk harfi A yada S olan 
  select CustomerID from Customers where CustomerID like '[AS]%'

  --ÝLK HARFÝ A ile k arasýnda olan		
    select CustomerID from Customers where CustomerID like '[A-K]%'

	  select CustomerID from Customers where CustomerID like '[A-K]%' AND CustomerID like '[^A]%' and CustomerID like '[^K]%'-- ^ ile baþlamayan

select CustomerID from Customers where CustomerID like 'A_[^N]U%'--a ile baþlayan içinde n olmayacak ama u olacak 



--aggregate functions

select count(*) from [Order Details]

select count(ProductID) from Products where UnitsInStock>30

--1996 yýlýndan sonra alýnmýþ toplam kaç adet sipariþim var
select count(O.OrderID) from Orders O where YEAR(O.OrderDate)>1996

--farklý kayýtlarý getir.
select distinct Country from Customers

---Kaç farklý ülkeden müþterim var
select count (distinct Country) from Customers

--sum(toplam alma)
--her bir üründen 1 adet alsam ne kadar öderim
select sum(UnitPrice) as [Toplam  tutar] from Products

--depoda toplam kaç liralýk ürün var
select sum(unitprice*UnitsInStock) from Products

--1997 sipraiþleri toplam kaç lira kargo bedeline sahip?
select sum(o.Freight) from Orders O where YEAR(o.OrderDate)=1997

--ortalama kargo bedeli
select sum(o.Freight)/count(Freight) from Orders O

--avg
select avg(freight) from orders

--ülke baþýna ortalama kaç dolar kargo ücreti odedim?
select sum(o.Freight) /count(distinct ShipCountry) from orders o 

--CACTU ,dumon yada peric CustomerIDlerine sahip müþterilerden alýnmýþ 2 nolu kargo firmasýyla taþýnmamýþ ücreti 20-200 dolar arasý olan sipariþlere toplam ne kadar kargo ücreti ödenmiþtir?
--shipvia:kargo þirketi
--freight:kargo ücreti
select sum(o.Freight) from ORDERS o where o.CustomerID in('CACTU','DUMON','PERIC') and o.ShipVia!=2  and o.Freight between 20 and 200 


--case when yapýsý
select FirstName +' '+LastName as [Ad Soyad],Ulke=
case Country 
when 'USA' then 'Amerika'
when 'UK' then 'Ýngiltere'
when 'TR' then 'Türkiye'
else 'Bilgi Yok'
end
from Employees

--ürünler tablosunda stokadedi 50den az  olanlar için kritik stok adedi,50 ve 100 arasý olanlar için normal stok adedi,100den fazla olanlar iiçin stok fazlasý ibaresini yazdýrýn

select ProductName,UnitPrice,UnitsInStock,[Stok Durumu]=
case 
when UnitsInStock<50 then 'Kritik Durum'
when UnitsInStock between 50 and 100 then 'Normal Durum'
when UnitsInStock>100 then 'Stok fazlasý'
end
from Products
  
--group by 
--gropydan sonra gelen þey select içinede yazýlýr
--ülkelere göre personel sayýsý
select country,count(country) as [Personel Sayýsý]
 from Employees
 group by 
 Country

 --ürünler tablosunda kategoriye göre ürün adedini getirin
 select CategoryID,count(ProductID) as [ürün adedi] from Products 
 group by CategoryID 

 --her kategoride toplam ne kadarlýk ürün var
 select p.CategoryID,sum(p.UnitPrice*UnitsInStock) as [toplam ürün fiyatý] from Products p
 group by p.CategoryID 

 --ülkelere göre en çok sipariþ veren ilk 3 ülkeyi sipariþ sayýlarý ile beraber raporlayýn
 select top 3 o.ShipCountry,count(o.OrderID) as [Toplam sipariþ] from
orders o 
 group by o.ShipCountry order by [Toplam sipariþ] desc


 --order details de hangi ürüne toplam kaç adetlik sipariþ verilmiþ

 select o.ProductID,sum(o.Quantity) as [Toplam sipariþ adeti] from  [Order Details] O group by o.ProductID order by o.ProductID

 --inner join
 select C.CategoryName ,p.ProductName,s.CompanyName from Products P
 inner join Categories C on C.CategoryID=p.CategoryID
 inner join Suppliers s on s.SupplierID=p.SupplierID
 order by 
 c.CategoryName

 --beverages kategosine ait ürünleri listeleyin
 select c.CategoryName,p.ProductName from  Products p 
 inner join Categories c on c.CategoryID=p.CategoryID
 where c.CategoryName='Beverages'

 --federal shipping ile taþýnmýþ nancynin almýþ olduðu sipariþleri listelyein

 select o.OrderID,s.CompanyName,e.FirstName from Orders o 
 inner join Shippers s on s.ShipperID=o.ShipVia
 inner join Employees e on e.EmployeeID=o.EmployeeID
 where e.FirstName='Nancy' and s.CompanyName='Federal Shipping'

 --müþteri hangi üründen toplam ne kadar tutarýnda sipariþ vermiþ

 select c.CompanyName,p.ProductName,sum(o.UnitPrice*o.Quantity) as [toplam sipariþ tutarý] from [Order Details] O
 inner join Products p on p.ProductID=o.ProductID
 inner join Orders ord on ord.OrderID=o.OrderID
 inner join Customers c on c.CustomerID=ord.CustomerID
 group by c.CompanyName,p.ProductName
 order by c.CompanyName 


 --companynameleri arasýnda a geçen müþterilerin nancy,andrew yada janet tarafýnda alýnmýþ speedy express ile taþýnmamýþ sipariþlere toplam ne kadar kargo ücreti ödedim

 select sum(o.Freight) as [ödenen Toplam kargo ücreti] from Orders O
 inner join Shippers s on s.ShipperID=o.ShipVia
 inner join Employees e on e.EmployeeID=o.EmployeeID
 inner join Customers c on c.CustomerID=o.CustomerID
 where c.CompanyName like '%a%' 
 and e.FirstName in ('Nancy','Andrew','Janet')
 and s.CompanyName!='Speedy express'

 --hangi çalýþaným kime rapor veriyor.
 select a.FirstName+' '+a.LastName [Personel],b.FirstName+' '+b.LastName[Sorumlu] from  Employees a
 inner join Employees b on b.EmployeeID=a.ReportsTo

 --çalýþanlar ne kadarlýk satýþ yaptýlar
 select e.LastName,sum(OD.UnitPrice*OD.Quantity) as [toplam satýþi] from Employees e
 inner join Orders o on o.EmployeeID=e.EmployeeID
 inner join [Order Details] OD on OD.OrderID=o.OrderID
 group by e.LastName

 --kategorilere göre satýþ toplamlarý
 select c.CategoryName,sum(o.UnitPrice*o.Quantity) as [satýþ toplamlarý] from [Order Details] o
 inner join Products p on o.ProductID=p.ProductID
 inner join Categories c on c.CategoryID=p.CategoryID
 group by c.CategoryName
 order by [satýþ toplamlarý]

 --hangi kargo þirketine ne kadarlýk toplam ödeme yapýldý
 select s.CompanyName,sum(Freight) as [Toplam ödeme] from Shippers s 
 inner join Orders o on o.ShipVia=s.ShipperID
 group by s.CompanyName
 order by s.CompanyName

 --tedarikçilerden aldýðým ürünlerin satýþ adedi ve satýþ toplamý
 select s.CompanyName,p.ProductName,sum(ord.Quantity) as [adet],sum(ord.Quantity*ord.UnitPrice) as [satýþ toplamý] from Suppliers s 
 inner join Products p on s.SupplierID=p.SupplierID
 inner join [Order Details] ord on ord.ProductID=p.ProductID
 group by s.CompanyName,p.ProductName



 --toplam satýþ tutarý 50000'in üzerinde olan kategoriler ve satýþ tutarlarýný raporlayýn


  select c.CategoryName,p.productname,sum(od.UnitPrice*od.Quantity) as [satýþ miktarý] from Products p
 inner join Categories c on c.CategoryID=p.CategoryID
 inner join [Order Details] od on  od.ProductID=p.ProductID
 group by c.CategoryName,p.ProductName
 having sum(od.UnitPrice*od.Quantity)>50000
 order by [satýþ miktarý]

 --toplam sipariþ miktarý 1200'ün üzerinde olan ürünlerin adlarýný ve sipariþ miktarlarýný gösterin
 select p.ProductName,sum(ord.Quantity) as adet from Products P
 inner join [Order Details] ord on ord.ProductID=p.ProductID
group by p.ProductName
having sum(ord.Quantity)>1200 

--taÞINAN KARGO adeti 250in üzerinde olan kargo firmalarý ve kargo ücretleri
select s.CompanyName,COUNT(o.OrderID) as [kargo adeti] from Orders o
inner join Shippers s on s.ShipperID=o.ShipVia
group by s.CompanyName
having COUNT(o.OrderID)>250

--aldýðý sipariþler toplamý maliyeti 100000 in üzerinde olan personellerin ad soyadý ve satýþ toplamlarý
select e.FirstName,e.LastName,sum(ord.UnitPrice*ord.Quantity) as [sipariþ toplamý] from Employees e 
inner join Orders o on o.EmployeeID=e.EmployeeID
inner join [Order Details] ord on ord.OrderID=o.OrderID
group by e.FirstName,e.LastName
having sum(ord.UnitPrice*ord.Quantity)>100000

--shipcountry si usa ve germany olan ülkelere yapýlan satýþ toplamý 3000 üzeri olan ürünleri raporlayýn

select p.ProductName ,SUM(ord.UnitPrice*ord.Quantity) from Products p
inner join [Order Details] ord on 
ord.ProductID=p.ProductID 
inner join Orders o on o.OrderID=ord.OrderID
where o.ShipCountry='USA' or o.ShipCountry='Germany'
group by p.ProductName 
having SUM(ord.UnitPrice*ord.Quantity)>30000

--subquery 
--employee leri nancy olan sipariþleri getir.
select o.* from Orders o where o.EmployeeID IN(select e.EmployeeID from Employees e where e.FirstName='Nancy')

--ortalama ücretin üzerinde olan ürünleri gösterin
select ProductName,UnitPrice from Products where UnitPrice>(select AVG(UnitPrice) from Products)

--nancy,andrew yada janetýn almýþ olduðu ve speedy express ile taþýnmamýþ order ýd 
select * from Orders o where o.EmployeeID in(select e.EmployeeID from Employees e where e.FirstName  in('Nancy', 'Andrew','Janet')) and o.ShipVia in (select s.ShipperID from Shippers s where s.CompanyName not like '%Speedy%')

--beverages kategorisine ait ürünleri listeleyin
select *from Products p where p.CategoryID=(select c.CategoryID from Categories c where c.CategoryName='Beverages')

--company nameleri arasýnda a geçen müþterilerin nancy,andrew yada janet tarafýndan alýnmýþ sppedy express ile taþýnmamýþ sipariþlere toplam ne kadar kargo ücreti ödedim
select sum(o.Freight) from Orders o 
where o.CustomerID in(select   c.CustomerID from Customers c where c.CompanyName like '%a%') 
and o.EmployeeID in(select e.EmployeeID  from  Employees e where e.FirstName in('Nancy','Andrew','Janet')) 
 and o.ShipVia in (select s.ShipperID from Shippers s where s.CompanyName not like '%Speedy%')


 --federal shipping ile taþýnmýþ ve nancynin almýþ olduðu sipariþleri listeleyin
 select *from Orders o where o.ShipVia in (select s.ShipperID from Shippers s where s.CompanyName='Federal Shipping') and o.EmployeeID in(select e.EmployeeID from Employees e where e.FirstName='Nancy')

 --müþteri hangi üründen toplam ne kadar tutarýnda sipariþ vermiþ
 select c.CompanyName,p.ProductName,SUM(od.Quantity*od.UnitPrice) from 
 Customers c,
 Products p,
 Orders o,
 [Order Details] od
 where 
 o.OrderID=od.OrderID 
 and o.CustomerID=c.CustomerID
 and p.ProductID=od.ProductID
 group by 
 c.CompanyName,
 p.ProductName
 order by c.CompanyName,p.ProductName


 --hangi çalýþaným kime rapor veriyor
 select b.FirstName,a.FirstName from  Employees a,Employees b 
  where
   a.EmployeeID=b.ReportsTo 


--çalýþanlar ne kadarlýk satýþ yaptýlar
select e.LastName,sum(OD.UnitPrice*OD.Quantity) as [toplam satýþi] from 
Employees e,
Orders o,
[Order Details] OD
where
o.EmployeeID=e.EmployeeID and
OD.OrderID=o.OrderID
group by e.LastName

--kategorilere göre satýþ toplamlarý
select c.CategoryName,sum(o.UnitPrice*o.Quantity) as [satýþ toplamlarý] from 
[Order Details] o,
Products p,
Categories c
where 
o.ProductID=p.ProductID and 
c.CategoryID=p.CategoryID
group by c.CategoryName
order by [satýþ toplamlarý]



--hangi kargo þirketine ne kadarlýk toplam ödeme yapýldý
select s.CompanyName,sum(Freight) as [Toplam ödeme] from 
Shippers s,
Orders o
where 
o.ShipVia=s.ShipperID
group by s.CompanyName
order by s.CompanyName

--tedarikçilerden aldýðým ürünlerin satýþ adedi ve satýþ toplamý
select s.CompanyName,p.ProductName,sum(ord.Quantity) as [adet],sum(ord.Quantity*ord.UnitPrice) as [satýþ toplamý] from
Suppliers s ,
Products p,
[Order Details] ord
where
s.SupplierID=p.SupplierID and 
ord.ProductID=p.ProductID
group by s.CompanyName,p.ProductName
 

 --union(birden fazla result seti birleþtirir..Sorgu sonucuna ayný satýr verileri uniq olarak ekler.union union all'a göre daha yavaþ sonuç verir.)

 select o.OrderDate,o.Freight,o.ShipCountry from Orders o
 where YEAR(o.OrderDate)=1996

 union 

  select o.OrderDate,o.Freight,o.ShipCountry from Orders o
 where YEAR(o.OrderDate)=1997

 union 

   select o.OrderDate,o.Freight,o.ShipCountry from Orders o
 where YEAR(o.OrderDate)=1998

 --union all(birden fazla result seti birleþtirir)
  select o.OrderDate,o.Freight,o.ShipCountry from Orders o
 where YEAR(o.OrderDate)=1996

 union all

  select o.OrderDate,o.Freight,o.ShipCountry from Orders o
 where YEAR(o.OrderDate)=1997

 union all

   select o.OrderDate,o.Freight,o.ShipCountry from Orders o
 where YEAR(o.OrderDate)=1998


 --intersect(kesiþim kümesini verir)

 select p.ProductName from [Order Details] od 
 inner join Products p on p.ProductID=od.ProductID
 where od.Quantity=10

 intersect

 select p.ProductName from [Order Details] od 
  inner join Products p on p.ProductID=od.ProductID
 where od.Quantity=12

 --
 select o.EmployeeID from Orders o 
 where o.ShipCountry='USA'

 intersect

  select o.EmployeeID  from Orders o 
 where o.ShipCountry='Germany'

  intersect

  select o.EmployeeID  from Orders o 
 where o.ShipCountry='France'


 --
  select o.EmployeeID from Orders o 
 where o.Freight=50

 intersect

  select o.EmployeeID  from Orders o 
 where o.Freight=100

  intersect

  select o.EmployeeID  from Orders o 
 where o.Freight=150


 -----EXCEPT(bir setin diðerinden farký)
 select*from Orders o 

 except 

 select *from Orders o where o.EmployeeID in(1,2,3)   --1,2,3 olanlarý çýkar

  except 

 select *from Orders o where o.EmployeeID in(4,5) --4 ve 5ide çýkar
 ----------------------------------------------------

 --INSERT
 INSERT INTO Categories(CategoryName, Description, Picture)
 output inserted.* -- veriyi ekledikten sonra kayýt edilen veriyi gösterir,(en son silinen kaydý tutar.)
 VALUES('Unlu Mamüller','Pasta,börek,çörek vs...',null)

 select*from Categories

--UPDATE
--(update iþlemi önce kaydý siler sonra insert eder.)
UPDATE Categories SET [Description]='Pasta,börek,çörek,poðaça vs...' where CategoryID=10


--DELETE
DELETE FROM Categories WHERE CategoryID=9

-----------------

--hangi ürünler hangi kategoriye ait
select c.CategoryName,p.ProductName from Products p 
inner join Categories c on c.CategoryID=p.CategoryID

--toplu insert tabloya veri aktardýk
INSERT INTO ProductCategories
select c.CategoryName,p.ProductName from Products p 
inner join Categories c on c.CategoryID=p.CategoryID

