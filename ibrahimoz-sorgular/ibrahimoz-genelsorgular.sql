--RDMBS :Ýliþkisel veritabaný yönetim sistemi
--T-SQL Dili:Transact Structurer Query Language
--master:veritabanlarýnýn ve ayarlarýnýn tutulduðu database'dir.
--model:Veritabaný þemalarýnýn tutulduðu databasedir.
--msdb:Server ile ilgili ayarlarýn tutulduðu database'dir.
--tempdb:Geçici database veya tablolarýn tutulduýðu database'dir.

--VERÝ TÝPLERÝ
--bigint --- c# ta long (en büyük tam sayý)
--bit -->c# ta bool 
--char -->karakter
--image -->resmin kendisini tutar. 
--money -->c# ta decimal (para ile ilgili iþlemler)
--smallint -->c# ta short
--tinyint -->c# ta byte(en küçük tamsayý)
--char,nchar,ntext,text,varchar,nvarchar --> string tutarlar
--char(10) -->10 karakter tutar.içerisine 5 karakterde koysanýz 10 karakterlik yer kaplar.
--nchar(10)-->universal (ð,ü,ö gibi karakterlerde var) yani tüm karakterlerin içerisinde barýnmasýný saðlar. 
--varchar(50)-->içinde bulunan karakter kadar yer kaplar.karakter sayýmý yapar
--nvarchar(50)-->hem karakter sayýmý yapar hemde universal karakterleri destekler.tüm karakterleri destekler.
--varchar(max)-->karakter sayýmý yaparak sýnýrsýz kayýt tutmayý saðlar.(veritabaný dolana kadar.)
--nvarchar(max)-->sýnýrsýz kayýt tutar.em karakter sayýmý yapar hemde universal karakterleri destekler.tüm karakterleri destekler.
--text:direk metin tutmayý saðlar.
--ntext-->universal destekli metin tutmayý saðlar.
--en çok kullanýlan nvarchar(50)'dir.

--iki tane primary key varsa bir tabloda o composit key dir.Yani birleþimleri benzersizdir.Birden fazla kolonun birleþiminin benzersizliðini saðlar.

--foreign key bir tabloda olan verilerin diðer tablodada olmasýný saðlamaktýr.yani farklý bir deðer girilemez o tabloda ne varsa diðer tablodada aynýsý olmasý lazým.Öðrenci tablosundaki Ders kýsmýna Ders tablosunda olmayan bir veri girilemez.bunun kontrolünü yapar.

--bir tabloda sadece bir tane primary key olur.ama birden fazla unique key bulunabilir.unique key o kolonun benzersiz olmasýný saðlar.ayný kolonda ayný veriler olmaz.

--bir tabloya kayýt ekleme anýnda bir kuraldan geçirme iþlemine check constraint denir.
--DogumTarihi<getdate() gibi koþul ekleyebiliriz.DogumTarihi bugünün tarihinden büyük girilemez.

--DML:Data Manipulation Language
---select,insert,update,delete

--DDL:Data definition language
--create ,alter,drop


----------------------------------------------------------------------------------------
--DML:Data Manipulation Language
--1-Select:Veri listeleme komutudur.
--Yazýmý:select kolonIsimleri from TabloAdi

select * from Urunler --Ürünler tablosunu tüm kolonlarý ile listele

select*from Kategoriler

select SirketAdi,MusteriAdi,MusteriUnvani from Tedarikciler

--where:kriter uygulamak için kullanýlan komuttur
select*from Urunler where UrunID=5
--Fiyatý 50den büyük olan ürünlerin listesi
select*from Urunler where Fiyat>50

--kategoriIdsi 6 olan ürünleri listeleyin
select*from Urunler where KategoriID=6

--Stoðu 20'den küçük olan ürünleri listeleyiniz
select*from Urunler where Stok<20

-----------------------------------
--Ürün Adý Chang olan ürünü listeleyin.
select *from Urunler where UrunAdi='Chang' 

--like:

--Ürün adýnýn ilk harfi c ile baþlayan devamýnda herhangi bir þey gelen ürünleri listeleyin.
select*from Urunler where UrunAdi like 'c%'

-- alt çizgi bir karakter demek.
--ilk harfleri herhangi birþeyler olabilir sondan bir önceki karakteri C olacak sonda bir harf olacak
select*from Urunler where UrunAdi like '%C_'

--ürün adýnda herhangi bir yerde c geçen ürünleri listeleyiniz
select*from Urunler where UrunAdi like '%C%'

--ürün adýnýn ilk harfi c veya a veya b ile baþlayan ürünleri listeleyiniz.
select*from Urunler where UrunAdi like '[_c,a,b]%'


--ürün adýnda sos geçen ürünleri listeleyin
select*from Urunler where UrunAdi like '%sos%'

--ürün adý s ile baþlayýp e ile biten ürünleri listeleyiniz.
select*from Urunler where UrunAdi like 's%e'

--Ürün adýnýn ikinci harfi a veya e olan ürünleri listeleyiniz
select*from Urunler where UrunAdi like '_[_a,e]%'

--ürün adýnýn sondan ikinci harfi t veya l olan ve c ile baþlayan ürünleri listeleyiniz
select*from Urunler where UrunAdi like 'c%[_t,l]_'
select*from Urunler where UrunAdi like 'c%[t,l]_'
----------------------------------------------------------------------
--in :birden fazla kriteri ayný anda uygulamamýzý saðlayan komuttur

--Ürün Idsi 5,7,9,11 olan ürünleri listeleyin
select*from Urunler where UrunID in(5,7,9,11)

--Ürün Adý Chai ve Chang olan ürünleri listeleyiniz
select*from Urunler where UrunAdi in('Chai','Chang')

---------------------------------
--between:arasýnda anlamýndadýr.

select*from  Urunler where UrunID between 5 and 11

--fiyatý 25.50 ile 74.50 arasýnda olan ürünleri listeleyiniz
select*from Urunler where Fiyat between 24.50 and 74.50
------------------------------------------
--Top 
--ürünler tablosundan ilk n kaydý listeleyiniz
select Top 10 *from Urunler --ilk 10 kayýt

--Ürün adý c ile baþlayýp sondon ikinci harfi n veya a olan ve fiyatý 25 ile 75 arasýnda olan ürünlerden ilk üçünü getiren sorguyu yazýnýz
select Top 3 *from Urunler where UrunAdi like 'C%[n,a]_' and Fiyat between 15 and 75

--------------------------------------------------------
--order by:kayýtlarda sýralama iþlemini saðlar.
--asc:0-9 veya a-z
--desc:9-0 veyaz z-a

--Ürünleri fiyatlarý çoktan aza doðru olacak þekilde listeleyiniz
select*from Urunler order by Fiyat desc

--Kategori Id 'si 5 olmayan ve ürün adýnýn ikinci harfi i olan ürünleri stoðuna göre tersten sýralayan sorguyu yazýn
select*from Urunler where KategoriID!=5 and UrunAdi like '_i%' order by Stok desc

select*from Satislar

--Personel Id si 4 olan ve Nakliye Ücreti 15 ile 45 arasýnda olan SevkTarihine göre tersten sýralayarak son 3 kaydý getiren satýþlarý getirin.
select top 3* from Satislar where PersonelID=4 and NakliyeUcreti between 15 and 45 order by SevkTarihi desc

--ürün idsi 5,14,17,25,34 olmayan ürünleri listeleyin
select*from Urunler where UrunID not in(5,14,17,25,34)

--Ürün adýnda c geçmeyen ürünleri listeleyiniz.
select*from Urunler where UrunAdi not like '%c%'

--Tanimi null olmayan kategorileri getir.
select*from Kategoriler where Tanimi is not null   
select*from Kategoriler where Tanimi not like ''
--Tanimi null olmayan ve Resimide null olmayan olan kayýtlarý getir.
select*from Kategoriler where Tanimi is not null and Resim is not null

----------------------------------------------------
--aggregate functions:5 tane fonksiyon türü vardýr.
--max,min,count,avg,sum
--Aggregate fonksyionlar select ile from arasýna yazýlýr
--Aggregate fonksiyon kullanýlýrken yanýna herhangi bir kolon getirilemez.(Þuan için)
--1)count():Satýr adedini veren fonksiyondur.

select *from Urunler
select count(*) from Urunler

select * from Kategoriler 
select count(Tanimi) from Kategoriler --içine sutun ismi verirsek null olanlarý saymaz

--2)sum:toplama  iþlemi yapmayý saðlayan fonksiyondur.
--stokta kaç adet ürün bulunmaktadýr.
select*from Urunler
select sum(Stok) from Urunler

--stokta bulunan ürünlerin toplam fiyatýný bulunuz
select sum(Fiyat*Stok) from Urunler 

--3)Avg:Ortalama alan fonksiyondur.

--Stoðumuzda ortalama kaç adet ürün vardýr.
select avg(Stok) from Urunler 

--stoðumuzda ortalama ne kadarlýk ürün vardýr.
select avg(Fiyat*Stok) from Urunler 

--4)Max-->Belirtilen kolon içinden deðeri max olan veriyi getirir.

--Stoðu en yüksek olan ürünü getiriniz.
select max(Stok) from Urunler 
select top 1* from Urunler  order by Stok desc

--5)Min:belirtilen kolon içerisinden deðeri en düþük olan veriyi getirir

--Fiyatý en az olan ürünün fiyatýný bulunuz
select MIN(fiyat) as [En Düþük fiyat] from Urunler 

select UrunAdi as [Ürün Adý] from Urunler --ismi olan kolonun ismini deðiþtirebiliriz.

--Toplam fiyat olarak ne kadarlýk satýþ yapýlmýþtýr.
select *from SatisDetay
select sum(Fiyat*Adet*(1-Indirim)) as [Toplam Tutar] from SatisDetay

---------------------------------------------------------------------
--Group by:Tablo içerisindeki veerileri gruplamayý saðlar.
--Anahtar sözcük :Hangi .Bu kelime geçiyorsa group by kullan
--Not:group by'dan sonra yazýlan kolon select ile from arasýnada yazýlmalýdýr.

--Hangi kategoriden kaç tane ürün vardýr.
select*from Urunler
select KategoriID,count(*) from Urunler group by KategoriID

--Stokta hangi kategoriden kaç dolarlýk ürün vardýr
select KategoriID,sum(Fiyat*Stok) as [Toplam Tutar] from Urunler group by KategoriID

--Hangi kategoriden stokta kaç adet ürün vardýr.
select KategoriID,sum(Stok) from Urunler group by KategoriID

--Hangi tedarikçiden kaç adet ürün tedarik edilmiþtir.
select TedarikciID,count(*) from Urunler group by TedarikciID

--hangi tedarikçiden stokta toplamda kaç dolarlýk ürün vardýr.
select*from Urunler
select TedarikciID,sum(Fiyat*Stok) from Urunler group by TedarikciID

select*from Satislar

--Hangi personel hangi müþteriye kaç adet  satýþ yapmýþtýr(Satýþlar tablosu)
select PersonelID,MusteriID,count(*) as [Satýþ miktarý ] from Satislar group by PersonelID,MusteriID
--not:group by dan sonra yazdýklarýmýzý select ile from arasýna da yazmalýyýz.

--hangi müþteri hangi nakliyeciden kaç adet sipariþde bulunmuþtur.(Nakliyeci kolonu ShipVia)
select MusteriID,ShipVia,count(*) from Satislar group by MusteriID,ShipVia 


--hangi üründen toplamda kaç dolarlýk satýþ yapýlmýþtýr ve toplam satýþ miktarýný büyükten küçüðe doðru sýralayýnýz..(SatisDetay)
select*from SatisDetay
select UrunID,sum(Fiyat*Adet*(1-Indirim)) as [Toplam Tutar] from SatisDetay group by UrunID order by [Toplam Tutar] desc
----------------------------------------------------------------------------------------
--ALT SORGULAR(iç içe sorgular)
--1)Kullaným þekli:select ile from arasýna bi sorgu yazýlýr.Bu sorguda önemli nokta sorgunun tek kolonu olmasý gerekir.(select KategoriAdi  from Kategoriler where KategoriID=Urunler.KategoriID 'sorgusunda sadece KategoriAdi kolonunu yazdýk baþka yazýlmaz.)
select *,(select KategoriAdi  from Kategoriler where KategoriID=Urunler.KategoriID ) as [Kategori Adý] from Urunler 
--alttaki gibide yazýlabilir.
select *,(select KategoriAdi  from Kategoriler as k where k.KategoriID=u.KategoriID ) as [Kategori Adý] from Urunler  as u

--Ürünler tablosunu tedarikçi adý ile birlikte listeleyiniz.
select *,(select SirketAdi from Tedarikciler t where t.TedarikciID=u.TedarikciID) as [Þirket Adý] from Urunler u

--Ürünler tablosunu tedarikçi adý ve kategori adý,Ürün adý,Fiyat ve stok bilgileri ile birlikte listeleyiniz.
select UrunAdi,Fiyat,Stok,(select KategoriAdi from Kategoriler k where k.KategoriID=u.KategoriID) as [Kategorisi],(select SirketAdi from Tedarikciler t where t.TedarikciID=u.TedarikciID ) as [Tedarikçisi] from Urunler u  

--satýþlar tablosunu müþteri adý ünvaný ,personel adý soyadý ile birlikte listeleyiniz.
select*from Satislar
select*from Musteriler
select*from Personeller

select *,(select MusteriAdi+' '+MusteriUnvani from Musteriler m where m.MusteriID=s.MusteriID),(select Adi+SoyAdi from Personeller p where p.PersonelID=s.PersonelID) from Satislar s 


--ürünlerle birlikte ürünün toplam satýþ adedi bilginide gösteren sorguyu yazýnýz
select*from Urunler 
select*from SatisDetay

select *,(select sum(Adet) from SatisDetay s where s.UrunID=u.UrunID)from Urunler u

--Yapýlan satýþlarý maximum satýþ fiyatý bilgisiyle listeleyiniz.(Satislar)
select *from Satislar
select *from SatisDetay

select *,(select max(Fiyat) from SatisDetay d where d.SatisID=s.SatisID) from Satislar s

--Ürünleri ürüne uygulanan maximum indirim yüzdesi ile birlikte listeleyen sorguyu yazýnýz.
select *from Urunler 
select *from SatisDetay

select *,(select max(Indirim) from SatisDetay d where d.UrunID=u.UrunID) as [Maximum Indirim yüzdesi] from Urunler u 

--Yapýlan satýþlarý toplam satýþ tutarlarý ile birlikte listeleyen sorguyu yazýnýz.
select *from Satislar
select *from SatisDetay

select *,(select sum(adet*fiyat*(1-Indirim))  from SatisDetay sd where sd.SatisID=s.SatisID)from Satislar s 
----------------------------------------------
--Alt SorgularDA 2.KISIM
--Alt sorguyu kullanarak kriter üretmek
--Bu alt sorgular where kýsmýnda kullanýlýr.
--Burdada select ile from arasýna bir kolon yazýlýr(select PersonelID from Personeller where Adi='Nancy'  tekbir kolon var PersonelID)

select*from Personeller
select*from Satislar

--Adý Nancy  olan personelin yaptýðý satýþlarý listeleyiniz.
select *from Satislar where PersonelID=(select PersonelID from Personeller where Adi='Nancy')

--Adý Nancy olan ve Janet olan personellerin yaptýðý satýþlarý listeleyiniz.
select *from Satislar where PersonelID in(select PersonelID from Personeller where Adi='Nancy' or Adi='Janet')
--aþaðýdaki gibide yapabiliriz ayný þey ama idleri bilmemiz gerekir.
select *from Satislar where PersonelID in(1,3)
--adýnýda göstermek istersek aþaðýdaki gibi yaparýz
select *,(select Adi from Personeller p where p.PersonelID=s.PersonelID)from Satislar s where PersonelID in(select PersonelID from Personeller where Adi='Nancy' or Adi='Janet')


--Personel adý nancy veya Janet  olan ve nakliyecisi Speedy Express olan satýþlarý listeleyiniz
select*from Personeller
select*from Satislar
select*from Nakliyeciler

select*from Satislar where PersonelID in(select PersonelID from Personeller where Adi='Nancy' or Adi='Janet') and ShipVia=(select NakliyeciID from Nakliyeciler where SirketAdi='Speedy Express')

--Ürün adý chai olan ürünün toplam satýþ tutarýný gösteren sorguyu yazýnýz.
select*from SatisDetay
select*from Urunler

select sum(Adet*Fiyat*(1-Indirim)) from SatisDetay where UrunID=(select UrunID from Urunler where UrunAdi='chai')

--Ýdsi 5 olan kategorideki ürünleri toplam satýþ tutarýný bulan sorguyu bulun.
select*from SatisDetay
select*from Urunler
select*from Kategoriler

select sum(Fiyat*Adet*(1-Indirim)) from SatisDetay where UrunID in(select UrunID from Urunler where KategoriID=5)

--1997 yýlýnda yapýlan satýþlarda ne kadar ciro(toplam tutar) elde edildiðini bulan sorguyu yazýnýz.
select*from Satislar
select*from SatisDetay

select sum(Fiyat*Adet*(1-Indirim))  from SatisDetay where SatisID in(select SatisID from Satislar where Year(SatisTarihi)=1997)

--yada aþaðýdaki gibi yapýlabilir
select sum(sd.Fiyat*sd.Adet*(1-sd.Indirim)) as [Toplam SAtýþ]  from SatisDetay  sd where sd.SatisID in(select s.SatisID from Satislar s where s.SatisTarihi between '1997.01.01' and '1997.12.31')

--Idsi Alfký müþterisinin yaptýðý toplam satýþ tutarýný bulan sorguyu yazýnýz.
select*from Musteriler
select*from SatisDetay
select*from Satislar

select sum(Adet*Fiyat*(1-Indirim)) as [Toplam satýþ] from SatisDetay where SatisID in(select SatisID from Satislar where MusteriID='ALFKI')

--Speedy Express isimli nakliyeci bugüne kadar kaç adet ürün taþýmýþtýr
select*from Satislar
select*from SatisDetay
select*from Nakliyeciler

select sum(Adet) from SatisDetay where SatisID in(select  SatisID from Satislar where ShipVia=(select NakliyeciID from Nakliyeciler  where SirketAdi='Speedy Express'))

--Alfký isimli müþteri hangi kategorilerde ürün satýn almýþtýr.(hangi dediðimiz için group by yapýcaz)
select*from SatisDetay
select*from Kategoriler
select*from Urunler

--burda kategorinin idlerini getirdik.
select KategoriID from Urunler where UrunID in(select UrunID from SatisDetay where SatisID in(select SatisID from Satislar where MusteriID='ALFKI')) group by KategoriID


--aþaðýdaki gibide yapýlabilir.isminide getirdim ben 
select KategoriAdi from Kategoriler where KategoriID in(select KategoriID from Urunler where UrunID in(select UrunID from SatisDetay where SatisID in(select SatisID from Satislar where MusteriID='ALFKI') ))