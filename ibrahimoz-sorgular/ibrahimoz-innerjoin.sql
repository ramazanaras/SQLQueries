--Join:Aralarýnda iliþki bulunan tablolarýn birbiri ile baðlantýsýný kurarak tek sorguda tek tablo çýktýsý vermeyi saðlayan yapýdýr.
--3 çeþit join vardýr.
--Bunlar; inner join,outer join,cross join
--1:inner join:iliþkili tablolarda ki null olmayan kayýtlarý listeler

--kategoriler ile ürünleri birleþtir.
select *from Urunler u inner join Kategoriler k on u.KategoriID=k.KategoriID

select UrunAdi,Fiyat,Stok,KategoriAdi from Urunler u inner join Kategoriler k on u.KategoriID=k.KategoriID

--Ürünleri tedarikçi firma isimleri ile birlikte listeleyiniz.
select*from Urunler u inner join Tedarikciler t on u.TedarikciID=t.TedarikciID --birleþim yaptýk.aþaðýdada bizden istenileni yaptýk.

select u.UrunAdi,t.SirketAdi from Urunler u inner join Tedarikciler t on u.TedarikciID=t.TedarikciID

select u.*,t.SirketAdi from Urunler u inner join Tedarikciler t on u.TedarikciID=t.TedarikciID--u.* demek urunler tablosunun tüm kolonlarýný getir ve yanýna Sirket Adini getir.


--Yapýlan satýþlarý müþteri adý soyadý ve personel adý soyadý ile birlikte listeleyiniz.
select*from Musteriler m inner join Satislar s on s.MusteriID=m.MusteriID inner join Personeller p on p.PersonelID=s.PersonelID --birleþimi yaptýk ve aþaðýdada bizden istenileni yaptýk.

select m.MusteriAdi,p.Adi+' '+p.SoyAdi as [Personel Adý Soyadý],s.* from Musteriler m inner join Satislar s on s.MusteriID=m.MusteriID inner join Personeller p on p.PersonelID=s.PersonelID --s.* demek Satislar tablosundaki bütün kolonlarý getir demek.


--hangi personel hangi üründen toplamda kaç dolarlýk satýþ yapmýþtýr.(hangi dediði için group by kullanacaz.)(Personel,Urunler,SatisDetay,Satis tablolarý)
select*from Personeller p inner join Satislar s on p.PersonelID=s.PersonelID inner join SatisDetay sd on s.SatisID=sd.SatisID inner join Urunler u on sd.UrunID=u.UrunID--birleþimi yaptýk.bizden istenilenide aþaðýda yaptýk.

select p.Adi,u.UrunAdi,sum(sd.Fiyat*sd.Adet*(1-sd.Indirim)) as [Toplam SAtýþ Tutarý] from Personeller p inner join Satislar s on p.PersonelID=s.PersonelID inner join SatisDetay sd on s.SatisID=sd.SatisID inner join Urunler u on sd.UrunID=u.UrunID group by p.Adi,u.UrunAdi order by p.Adi  --burada ikili gruplama var(ikisinin ayný anda olduðu grup )


--hangi personel hangi kategoriden toplamda kaç adet ürün satýþý yapmýþtýr.(Personel,Satiþ,SatýþDetay,Urunler,Kategori)
select*from Personeller p inner join Satislar s on p.PersonelID=s.PersonelID inner join SatisDetay sd on s.SatisID=sd.SatisID inner join Urunler u on sd.UrunID=u.UrunID inner join Kategoriler k on u.KategoriID=k.KategoriID --birleþimi yaptýk aþaðýdada bizden istenileni yaptýk

select p.Adi+' '+p.SoyAdi  as [Personel Adý Soyadý],k.KategoriAdi,sum(Adet) as [Adet] from Personeller p inner join Satislar s on p.PersonelID=s.PersonelID inner join SatisDetay sd on s.SatisID=sd.SatisID inner join Urunler u on sd.UrunID=u.UrunID inner join Kategoriler k on u.KategoriID=k.KategoriID group by p.Adi+' '+p.SoyAdi,k.KategoriAdi order by [Personel Adý Soyadý]

--Nakliyeci þirket adý 'Speedy Express' olan nakliyeci satýþ fiyatý 15 dolardan yüksek kaç adet ürün taþýmýþtýr.
select*from Nakliyeciler n inner join Satislar s on n.NakliyeciID=s.ShipVia inner join SatisDetay sd on sd.SatisID=s.SatisID 

select n.SirketAdi,sum(sd.Adet) from Nakliyeciler n inner join Satislar s on n.NakliyeciID=s.ShipVia inner join SatisDetay sd on sd.SatisID=s.SatisID  where n.SirketAdi='Speedy Express' and sd.Fiyat>15 group by n.SirketAdi  --Not:group by where 'den sonra yazýlýr.