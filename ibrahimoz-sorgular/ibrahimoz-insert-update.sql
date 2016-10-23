--Ýnsert,Update,Delete 
--Ýnsert:Bir tabloya kayýt eklemeyi saðlayan komuttur
--Yazýmý Insert [into] TabloAdi(kolon,kolon,kolon) values(deger,deger,deger)

--Ürünler tablosuna ürün ekleyen sorguyu yazýnýz
insert  into Urunler(UrunAdi,Fiyat,Stok) values('Elma',2,120)
select*from Urunler

--Personeller tablosuna kendinizi personel olarak ekleyiniz
insert into Personeller(Adi,Soyadi) values('Ramazan','Aras')
select*from Personeller

insert into Bolge values(5,'Akdeniz Bölgesi') --Bolge tablosunda her kolona veri gireceksek kolonlarýn adýný yazmamýza gerek yoktur.
select*from Bolge

insert into Kategoriler values('Meyvelerr','Elma,armut, vs',null)
select*from Kategoriler
--------------------------------------------
--update:belli kayýt(larý) güncellemeyi saðlayan komuttur.
--Yazýmý:update TabloAdi set Kolon=deger,Kolon=deger,Kolon=deger (varsa where yazýlýr)

begin tran
update Urunler set Fiyat=15 --bunu yazarsak tüm ürünlerin fiyatýný 15 yapar.
rollback tran

select*from Urunler

update Urunler set Fiyat=15 where UrunID=80

begin tran
update Urunler set Stok=15 where KategoriID=1  --Kategori Idsi 1 olan ürünlerin hepsinin stokðunu 15 yap
rollback tran --iþlemleri geri alýr.


--Kategori Id'si 2 olan ürünlerin stoðunu 5 artýran komutu yazýnýz
update Urunler set Stok=Stok+5 where KategoriID=2
select*from Urunler
---------------------------------------------------
--Delete:Belirli kayýt(larý) tablodan silme iþlemini saðlayan komuttur
--Yazýmý:Delete [from] TabloAdý (varsa where)  --from yazmak zorunda deðiliz 
begin tran 
delete from Kategoriler where KategoriID=12 --where kriteri uygulamazsak tüm kayýtlarý siler.
rollback tran --iþlemleri geri alýr.

select*from Kategoriler


--Ürünler tablosuna yeni bir ürün ekleyip sonrasýnda o ürünün fiyatýnýn ve stoðunu güncelleyip en son da o ürünü silen sorgularý yazýnýz.
insert into Urunler(UrunAdi) values('Muzz')
declare @id int=Scope_Identity()--en son eklenen  kaydýn identity deðerini verir
--select @id idyi ekrana yazabiliriz bu þekilde
--set @id=Scope_Identity() --yukarýda deðiþkeni tanýmlayýp daha sonrada deðer atayabiliriz.
update Urunler set Fiyat=10,Stok=5 where UrunID=@id
delete from Urunler where UrunID=@id

select*from Urunler



 --INSERT
 INSERT INTO Categories(CategoryName, Description, Picture)
 output inserted.* -- veriyi ekledikten sonra kayýt edilen veriyi gösterir,
 VALUES('Unlu Mamüller','Pasta,börek,çörek vs...',null)