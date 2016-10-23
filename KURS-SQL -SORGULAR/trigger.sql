--TRIGGERS

--Her trigger bir tabloya aittir.
--2 çeþit trigger vardýr:

--1)After  INSERT/UPDATE/DELETE
--2)Instead of INSERT/UPDATE/DELETE


/*
Order Details tablosunda yapýlacak her insert iþlemi 
için çalýþacak trigger
*/
create trigger TG_StokTakip
on [Order Details]
after insert 
as 
begin
	Declare @PID int,@Adet int
	select @PID=ProductID,@Adet=Quantity from 
	inserted --en son eklenen satýrý verir.(yani en son eklenen satýrdan ProductID ve Quantity deðerlerini bizim belirttiðimiz deðiþkenlere at dedik.)
	update Products
	set UnitsInStock -=@Adet  --orderdetails(sipariþ olduðunda ürünler tablosundan adeti azaltmamýz lazým.)
	where ProductID=@PID
end

select*from [Order Details]
select*from Products where ProductID=1

insert into [Order Details] values(10248,1,12,9,0) --1 numaralý üründen sipariþ ediyoruz o yüzden urunler tablosuna gidip stoðunu azaltmamýz lazým.

go --birbirinden ayýr



--ýnstead of kulanýmý
create trigger tg_Silinmez
on Products 
instead of Delete --silme iþlemi yerine 
as 
begin
Declare @PID int 
select @PID=ProductID from deleted --deleted edilen son kayýttan ProductID bilgisini al @PID deðerine ata dedik.
update Products
set UnitsInStock=0  --ürünü silmedik sadece stoðunu sýfýrlamýþ olduk.
where ProductID=@PID
end


delete from Products where ProductID=2



--------------
create trigger TG_EMPLOYEE
on Employees
after insert 
as 
begin
	Declare @EID int,@UserName nvarchar(50)

	select @EID=EmployeeID,@UserName=LOWER(FirstName)+'.'+LOWER(LastName) from 
	inserted --en son eklenen satýrýn bilgileri verir(bu bilgileride deðiþkenlere atarýz.)
	insert into  Users(EmployeeID,Username,[Password],CreatedDate) values(@EID,@UserName,NEWID(),GETDATE()) --newid rastgele sayý üretir,getdate þuanýn zamanýný alýr.

end

insert into Employees(FirstName,LastName) values('Ali','korkmaz')


select*from Employees
select*from Users
---------------------------
update Employees set RecordStatus=1 --tüm çalýþanlarý RecordStatusunu 1 yapar.

--personle iþten çýkýnca record status 2 olacak ve employenin userý silenecek

create trigger tg_Silinmez2
on Employees 
instead of Delete --silme iþlemi yerine 
as 
begin
Declare @EID int 
select @EID=EmployeeID from deleted --silinen kayýttan bilgileri al deðiþkenlere ata.
update Employees
set RecordStatus=2
where EmployeeID=@EID

delete from Users where EmployeeID=@EID

end


delete from Employees where EmployeeID=12


select*from Employees
select*from Users
------------------------------
create trigger tg_Guncelleme
on Customers 
after update --for update de yazýlabilir
as
begin
	if UPDATE(CompanyName)--compnay name update olmuþsa
	begin
		Declare @CID varchar,
		@EskiAd nvarchar(50),
		@YeniAd nvarchar(50),
		@KayitAciklama nvarchar(500)
		--Not:update iþlemi önce silme daha sonra ekleme iþlemidir .aþaðýdada deleted ,inserted olaylarýný bunun için yaptýk.
		select @EskiAd=CompanyName,@CID=CustomerID from deleted --updated olmadýðý için deleted yaptýk

		select @YeniAd=CompanyName from inserted

		select @KayitAciklama=@CID +'ID''li '+'"'+@EskiAd+'"'+' isimli müþterinin adý '+'"'+@YeniAd+'"'+' olarak deðiþtirildi.'

		insert into Logs values(@KayitAciklama,GETDATE())
   end
end

update Customers set CompanyName='Biliþim Eðitim' where CustomerID='VINET'

select *from Logs


select*from Customers