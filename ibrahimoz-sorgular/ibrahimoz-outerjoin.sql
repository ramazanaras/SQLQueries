--Outer join:iliþkili tablolardaki null olan kayýtlarda dahil tüm kayýtlarý getirir.
--3 çeþit outer join vardýr
--Bunlar;left outer join,right outer join,full outer join
--1)Left outer join: left tablo ilk yazýlan yani soldaki tablodur.Sol tablodaki tüm kayýtlar getirilir.null olsa bile ve sað tablodan sol tablonun iliþkili kayýtlarý getirilir.Yani kýsacasý soldaki tabloda bulunup saðdaki tabloda karþýlýðý olmayan kayýtlarýda getirir.

select*from Urunler u left outer  join  Kategoriler k on u.KategoriID=k.KategoriID

--2)Right outer join:Saðdaki tablodaki null kayýtlar dahil tüm kayýtlar getirilir.Soldaki tablodan iliþkili kayýtlar getirilir.

select*from Urunler u right outer join Kategoriler k on u.KategoriID=k.KategoriID

--3)Full outer join:Hem saðdaki tablodan hem soldaki tablodan null kayýtlarda dahil tüm kayýtlarý getirir.

select*from Urunler u full outer join  Kategoriler k on u.KategoriID=k.KategoriID --hem kategori bilgisi olmayan ürünler ve ürün bilgisi olmayan kategorilerde listelenmiþ odlu.

--ürünler tablosýndaki kategoriid 'si null olan kaydý getir.Yani ürün bilgisi olan ama kategori bilgisi olmayan verileri getir.
select*from Urunler u left outer join Kategoriler k on u.KategoriID=k.KategoriID where u.KategoriID is null

--kategorisi bilgisi olan ama ürün bilgisi olmayan kayýtlarý getir.
select*from Urunler u right outer join Kategoriler k on u.KategoriID=k.KategoriID where u.KategoriID is null

select*from Urunler u full outer join Kategoriler k on u.KategoriID=k.KategoriID where u.KategoriID is null or k.KategoriID is null --hem ürün bilgisi olup kategori bilgisi olmayan kayýtlar hemde kategori bilgisi olup ürün bilgisi olmayan kayýtlar gelir.

--hangi tedarikçiden toplamda kaç dolarlýk ürün tedarik edilmiþtir.(Tüm tedarikçiler gelmelidir.)
select t.TedarikciID,SUM(u.Fiyat*u.Stok) from Tedarikciler t right outer join Urunler u on u.TedarikciID=t.TedarikciID group by t.TedarikciID

--hiç satýþ yapmayan müþterilerimizi listeleyen sorguyu yazýnýz
select*from Musteriler m left outer join Satislar s on s.MusteriID=m.MusteriID  where s.SatisID is null


--nakliye edilemeyen sipariþleri listeleyiniz.
select*from Satislar s  left outer join Nakliyeciler n  on n.NakliyeciID=s.ShipVia
 where s.ShipVia is null
 
 
 --hiç nakliye yapmayan nakliyecilerimizi listeleyen sorguyu yazýnýz
 select*from Satislar s right join Nakliyeciler n on s.ShipVia=n.NakliyeciID where s.ShipVia is null 

 --hangi personel hangi üründen hiç satýþ yapmamýþtýr.
 select u.UrunAdi,p.Adi from Personeller p left join Satislar s on p.PersonelID=s.PersonelID left join SatisDetay sd on s.SatisID=sd.SatisID left join Urunler u on sd.UrunID=u.UrunID group by u.UrunAdi,p.Adi
 except 
 select UrunAdi,p.Adi from Urunler u left join SatisDetay sd on u.UrunID=sd.UrunID left join Satislar s on sd.SatisID=s.SatisID left join Personeller p on s.PersonelID=p.PersonelID


