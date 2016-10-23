--Trigger(Tetikleyici):Bir iþlemden sonra baþka bir iþlem yapabilmeyi veya bir iþlemin yerine baþka bir iþlem yapabilmeyi saðlayan yapýdýr.
--Kullanýcý elle trigger'ý tetikleyemeyiz.
--Trigger'ýn diðer yapýlardan farký çalýþacaðý zamaný kendisi belirler.

--2 tane trigger vardýr 
--Bunlar;
--After(Sonra) trigger ve instead of(Yerine) Trigger
--Trigger iþlemlerinde kullanýlan 2 tane sanal tablo vardýr
--Bunlar;inserted ve deleted tablolarý
--Eklenmeye çalýþýlan kayýt inserted tablosunda tutulur
--Silinmeye çalýþýlan kayýtta deleted tablosunda tutulur.

--Ürünler tablosuna delete komutu gönderildiðinde delete komutu yerine update komutu çalýþtýran triggerý yazýyoruz.
create trigger tg_UrunSil 
on Urunler --Hangi tabloda çalýþacaðýný belirtiyoruz
instead of --Hangi trigger tipini kullanacaðýmýzý belirtiyoruz
Delete   --hangi iþlem için bu triggerýn çalýþacaðýný belirttik
as
begin
declare @id int 
select @id=UrunID from deleted  --1.Atama Yöntemi
--set @id=(select UrunID from deleted)  --2.Atama yöntemi

update Urunler set Sonlandi=1 where UrunID=@id
end

delete from Urunler where UrunID=1  --ürün idsi 1 olan ürünün sonlandi alaný 1 oluyor

--instead of trigger:belirli bir tablo üzerinde belirli bir iþlemin yerine baþka bir iþlem çalýþtýrmayý saðlayan trigger iþlemidir.

select*from Urunler

go
--------------------------

--After Trigger:Belirli bir tablo üzerinde belirli bir iþlemden sonra baþka bir iþlem daha yapabilmeyi saðlayan trigger çeþididir.

--Satýþ detay tablosuna kayýt girildiðinde satýlan urun adedi kadar o ürünün stoðundan düþen trigger'ý yazýnýz.

create trigger trg_StokDus
on SatisDetay
after 
insert 
as
begin

	declare @id int,@adet smallint
	select @id=UrunID,@adet=Adet from inserted 
	
	update Urunler set Stok-=@adet where UrunID=@id 

end

insert into SatisDetay(SatisID,UrunID,Fiyat,Adet,Indirim) values(10248,1,12,9,0)--1 numaralý üründen sipariþ ediyoruz o yüzden urunler tablosuna gidip stoðunu azaltmamýz lazým.

select*from SatisDetay
select*from Urunler


go--yukarýdaki  kodla aþaðýdaki kodu birbirinden ayýrýr

--Satýþ detay tablosundan kayýt silindiðinde o ürünün stoðunu satýþ adedi kadar artýran triggerý yazýnýz.

create trigger trg_SatisSil
on SatisDetay
after 
delete 
as 
begin

declare @id int,@adet smallint 
select @id=UrunID,@adet=Adet from deleted 
update Urunler set Stok+=@adet where UrunID=@id


end

delete from SatisDetay where SatisID=10248 and UrunID=1 and Fiyat=12 and Adet=9 and Indirim=0


select*from SatisDetay
select*from Urunler