--select --> seçme sorgusu
--veri sorgulamak ve görüntülemek için kullanýlýr

select 5 as sayi

select 'Muhammed' as isim

select 12+24 as toplam

select 'Sql'+'Dersleri' as [Görsel Dersler]

select 'Fatih' as Ad,'Terim' as Soyad,45 as Yaþ

--selectin tablo sorgulama formülü

--select [kolon adlarý] from [tablo adý] 

/*
Employees:çalýþanlar
Products:ürünler
Customers:müþteriler
Orders:sipariþler
suppliers:tedarikçi,firma,satýcý
unitprice:birim fiyat
region:bölge
shipvia:kargo
shipper:nakliyatçý
freight:yük taþýma ücreti
UnitsInStock:stok
ReportsTo:çalýþan kime rapor veriyor 
ship:göndermek
ShipVia:kargo firmasý

*/
-- * girdiðimiz tablodaki tüm bilgileri gösterir

--where yapýsý

--2 nolu çalýþaný getir
select * from Employees where EmployeeID=2 

--2 nolu çalýþanýn almýþ olduðu sipariþleri getir
select *from Orders where EmployeeID=2

--birim fiyatý 50 dolardan az olan ürünlerin fiyatýný görüntüle
select *from Products where UnitPrice<50

--ALFKI müþteri idli müþterinin sipariþlerini gösterin
select*from Orders where CustomerID='ALFKI'

--stokta 10 taneden az olan ürünleri gösteriniz
select*from Products where UnitsInStock<10

--Kategori idsi 2 olan ve 3 nolu tedarikçiden gelen ürünlerin adýný gösteriniz
select*from Products where CategoryID=2 and SupplierID=3

--Londonda yaþýyan çalýþanlar(5 numaraya rapor veren)
select*from Employees where City='London' and ReportsTo=5

--1997 yýlýnýn sipariþlerini gösteriniz
select*from Orders where YEAR(OrderDate)=1997

--Nancy isimli çalýþanýn adresi nedir
select Address from Employees where FirstName='Nancy'

--null için is null ,null olmayan için is not null
select*from Customers where Region is null
select *from Customers where Fax is not null

--gönderilmemiþ sipariþlerin listesi
select*from Orders where ShippedDate is null

--arasýnda ifadesi nedir?
--stokta 10 ile 30 arasýnda bulunan ürünlerin listesi
select*from Products where UnitsInStock between 10 and 30 

--müþteri ismi k ile o arasýndakileri listeleyin
select*from Customers where CompanyName between 'k' and 'o'

--veya ifadesi

--kategori idsi 3,5,8 olan ürünleri gösterin
select*from Products where  CategoryID=3 or CategoryID=5 or CategoryID=8   
--in kullanarak kýsaltabiliriz
select*from Products where  CategoryID in(3,5,8)

--2,3,4 nolu çalýþanlarýn 1997 yýlýnda almýþ olduklarý sipariþler
select*from Orders where EmployeeID in(2,3,4) and Year(OrderDate)=1997

--like :belirli bir þablona göre verilerin filtrelenmesi için kullanýlýr
--like 'ýn özel karakteri % karakteridir
--like where kriter yapýsý ile beraber kullanýlýr
--like her zaman where in saðýnda olur
select*from Customers


--sadece ismi k harfi ile baþlayanlarý göster
select*from Customers where CompanyName  like 'k%'
--%, sonrasý beni baðlamaz

--ismi k harfi ile bitenler
select*from Customers where CompanyName like '%k'

--isminde k harfi olanlarý göster
select*from Customers where CompanyName like '%k%'

--belirsiz demek alt tire demektir _
--ilk harfi belirsiz ikinci harfi e olanlarý göster
select*from Customers where CompanyName like '_e%'

--ilk harfi belirsiz olan,ikinci harfi e olan,son harfi s olan 
select*from Customers where CompanyName like '_e%s'

--[^s] s olmayan
--ilk harfi belirsiz ikinci harfi e olan son harfide s olmayan
select*from Customers where CompanyName like '_e%[^s]'

--ilk harfi l ve r olan þirketleri göster
select*from Customers where CompanyName like '[lr]%'

--ilk harfi l ve r arasýnda olanlarý göster
select*from Customers where CompanyName like '[l-r]%'



--AGGREGATE  fonksiyonlar

--Sorgu sonucuna bakarak iþlem yapabilen fonksiyonlardýr
--select ten hemen sonra yazýlýrlar

-- => Count-sum-avg -min-max

--count :satýrlarý sayar
--eðer sütun ismi verirsek null deðer olanlarý saymaz

--kaç çeþit ürünüm vardýr
select count(*) from Products

--kaç tane sipariþ almýþým 
select count(*) from Orders   --eðer select count(OrderID) from Orders  dersek null olanlarý saymaz

select count(ShippedDate)  from Orders --sipariþ gidenler

--kaç sipariþ gitmemiþ
select count(*)-count(ShippedDate) from Orders  --21 tane sipariþ gitmemiþ(null olanlar)


--SUM :TOPLAMI gösterir
select * from Products  
--stoktaki ürünlerin toplamý kaçtýr
select sum(UnitsInStock) from Products  

--ürünlerin birim fiyatý toplamý
select sum(UnitPrice) from Products

--avg:ortalama alýr

--ürünlerimizin fiyatlarýnýn ortalamasý
select avg(UnitPrice) from Products

--max ve min

--en pahalý ürün
select max(UnitPrice) from Products

--category idsi 3 olan kaç çeþit ürünümüz vardýr
select count(*) from Products where CategoryID=3

--2 nolu çalýþanýmýn almýþ olduðu sipariþ sayýsý nedir?
select count(*) from Orders where EmployeeID=2

select*from Orders

--CASE VE ORDER BY 
--case :okunan kolondaki bilgiye göre farklý deðerler çýkarmayý saðlayan yapýdýr

select*from Employees

--ekranda  ünvanlarý türkçe olarak deðiþssin
select TitleOfCourtesy,Unvan=case TitleOfCourtesy
when 'Ms.' then 'Bay'
when 'Dr.' then 'Doktor'
when 'Mr.' then 'Bayan'
else 'Sayýn'
end
 from Employees 


 --Order by => Sýralamak 
 --küçükten büyüðe sýralamak için asc
 --büyükten küçüðe sýralamak için desc

 --ürün fiyatlarýný sýrala 
 select*from Products order by UnitPrice     --order by dan sonra birþey yazmazsak default asc dir. 



 --Group by :sorgularýmýzý gruplamaya yardýmcý olur
 --group by,where den sonra yazýlýr.

 --1 nolu çalýþanýn almýþ olduðu sipariþ sayýsý?
 select count(*) from Orders where EmployeeID=1

 select*from Orders

 --her çalýþanýn toplamda almýþ olduðu sipariþ sayýlarý kaçtýr
 select EmployeeID,count(*) as [Sipariþ Sayýsý]from Orders group by EmployeeID 


 --kargo firmalarý kaç tane sipariþ almýþtýr
 select ShipVia,count(*) from Orders group by ShipVia

 select*from Products

 --hangi kategoride kaç ürün olduðunu gösteriniz.
 select CategoryID,count(*) as [ürün adedi] from Products group by CategoryID

  select*from Orders

 --hangi ülkeye kaç  satýþ(sipariþ) yapýlmýþ
 select ShipCountry,count(*) from Orders group by ShipCountry 

 --nakliye þirketlerine(shipvia) toplam ne kadar ödenmiþ ( freight:taþýma üceti)
 select ShipVia,sum(Freight) from Orders group by ShipVia order by sum(Freight) desc

 --müþterilere 1997 yýlýnda kaç sipariþ verilmiþtir 
 select CustomerID,count(*) from Orders where Year(OrderDate)=1997 group by CustomerID

  select*from Products

 --kategorilerdeki stok miktarlarý 
 select CategoryID,sum(UnitsInStock)from Products group by CategoryID

  select *from [Order Details]

 --sipariþlerden ne kadar kazanýlmýþtýr
 select OrderID,sum(UnitPrice*Quantity) as [toplam kazaç] from [Order Details] group by OrderID order by [toplam kazaç] desc

 select*from Employees

 --çalýþanlarýn kaçý bay kaçý bayan kaçý doktor
 select TitleOfCourtesy,count(*) as sayýsý from Employees group by TitleOfCourtesy


 -----------JOINLER
--bazen iki  yada daha fazla tablodan veri çekmemiz gerekebilir.
--yani joinler tablolarý birleþtirmeye yarýyor

select *from Orders
select * from [Order Details]

--sipariþler ve sipariþ detaylarýný birleþtir
select *from Orders inner join [Order Details] on Orders.OrderID=[Order Details].OrderID

--ürünler ile kategorileri birleþtir
select*from Categories inner join Products on Categories.CategoryID=Products.CategoryID

--kategorilerdeki ürünlerin sayýsýný gösterin
select * from Categories inner join Products on Categories.CategoryID=Products.CategoryID --birleþtirdik ve aþaðýdada isteneni yaptýk.

select CategoryName,count(*) as [ürün sayýsý] from Categories inner join Products on Categories.CategoryID=Products.CategoryID group by CategoryName

--çalýþanlarýn aldýðý sipariþlerin sayýsýný gösterin
select*from Employees inner join Orders on Employees.EmployeeID=Orders.EmployeeID

select Employees.FirstName,count(*) from Employees inner join Orders on Employees.EmployeeID=Orders.EmployeeID group by Employees.FirstName

--nakliye þirketlerine ne kadar ödeneceðini listeleyiniz
select * from Shippers inner join Orders on Orders.ShipVia=ShipperID --birleþtirdik.

select Shippers.CompanyName,sum(Freight) from Shippers inner join Orders on Orders.ShipVia=ShipperID group by Shippers.CompanyName


--kategorilerden yapýlan satýþ(sipariþ) sayýsýný bulun..(categories->products-->order details--orders yolunu izledik diagramdan da bakabiliriz)
select  * from Categories inner join Products on Categories.CategoryID=Products.ProductID
inner join [Order Details] on Products.ProductID=[Order Details].ProductID inner join Orders on [Order Details].OrderID=Orders.OrderID --birleþtirdik aþaðýdada bizden istenileni yaptýk.

select  Categories.CategoryID,count(*) as [sipariþ sayýsý] from Categories inner join Products on Categories.CategoryID=Products.ProductID
inner join [Order Details] on Products.ProductID=[Order Details].ProductID inner join Orders on [Order Details].OrderID=Orders.OrderID group by Categories.CategoryID


--müþterilerim hangi ürünleri almýþ(customers-->orders-->order details-->products yolunu izledik yine diagramdan baktýk ve sýrayla birbirini baðladýk.)
--distinct benzer komutlarý yok ediyor
select*from Customers inner join Orders on Customers.CustomerID=Orders.CustomerID inner join [Order Details] on 
Orders.OrderID=[Order Details].OrderID inner join Products on [Order Details].ProductID=Products.ProductID--birleþtirdik aþaðýdada bizden istenileni yaptýk.

select distinct Customers.CompanyName,Products.ProductName from Customers inner join Orders on Customers.CustomerID=Orders.CustomerID inner join [Order Details] on 
Orders.OrderID=[Order Details].OrderID inner join Products on [Order Details].ProductID=Products.ProductID

--ürünlerimden ne kadar para kazanmýþ(her bir ürünümün satýþýndan ne kadar kazanç saðlamýþým)
select * from Products inner join [Order Details] on Products.ProductID=[Order Details].ProductID 

select Products.ProductName,sum([Order Details].UnitPrice*[Order Details].Quantity) as kazanç from Products inner join [Order Details] on Products.ProductID=[Order Details].ProductID group by Products.ProductName order by kazanç desc


--en deðerli 3 müþterime tebrik kartý gönderelim(bana en çok para kazandýran müþteridir)customers-->orders-->order details yolunu izleyeceðiz
--top 3 demek en üstteki 3 satýrý getir.
select * from Customers inner join Orders on Customers.CustomerID=Orders.CustomerID inner join [Order Details] on Orders.OrderID=[Order Details].OrderID

select top 3 Customers.CompanyName,sum([Order Details].UnitPrice*[Order Details].Quantity) as kazanç from Customers inner join Orders on Customers.CustomerID=Orders.CustomerID inner join [Order Details] on Orders.OrderID=[Order Details].OrderID group by Customers.CompanyName order by kazanç desc

--çalýþanlarýma prim ödeyeceðim.
--prim ödemem gereken ilk 5 çalýþan (employees-->orders-->order details yolunu izleyeceðiz)
select*from Employees inner join Orders on Employees.EmployeeID=Orders.EmployeeID inner join [Order Details] on Orders.OrderID=[Order Details].OrderID --birleþimi yaptýk aþaðýdada bizden istenileni yaptýk.

select top 5 Employees.FirstName,sum([Order Details].UnitPrice*[Order Details].Quantity) as kazanç from Employees inner join Orders on Employees.EmployeeID=Orders.EmployeeID inner join [Order Details] on Orders.OrderID=[Order Details].OrderID group by Employees.FirstName order by kazanç desc

--hangi çalýþan hangi çalýþana baðlýdýr
select e.EmployeeID,e.FirstName,em.FirstName from Employees e left join Employees em on e.EmployeeID=em.ReportsTo

--left join birleþmenin solundaki null deðeri dikkate alarak iþlem yapar
--right join:sað 
--full outer join 2 taraftan null u ekler


--müþterilerimin aldýðý sipariþlerin sayýsý
select*from Customers c inner join Orders o on c.CustomerID=o.CustomerID  

select c.CompanyName,count(o.OrderID) as [sipariþ sayýsý] from Customers c inner join Orders o on c.CustomerID=o.CustomerID  group by c.CompanyName order by [sipariþ sayýsý] desc




