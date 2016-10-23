--DDL(Data Definition language):içerisinde create ,alter drop komutlarý bulunur 
--Bu komutlar sayesinde 
--yeni veritabani
--yeni tablo,view procedure,trigger,functions gibi elemanlar tanýmlanabilir,deðiþtirilebilir ve kaldýrýlabilir.


--Create:

Create table Kisiler(
KisiID int primary key identity(1,1),
KisiAdi nvarchar(50) not null, --boþ geçilemez
KisiSoyadi nvarchar(50) not null,
Sehir nvarchar(50),

)

alter table Kisiler --deðiþiklik yapmak için.
drop column KisiAdi

go--seperator(ayýrýcý) yukarýdaki komut ile aþaðýdaki komutun birbirinden ayrý olmasýný saðlar

--drop:var olan bir nesneyi kaldýrmayý saðlar.
drop table Kisiler 

------------------------------------------------------
--View:Sanal tablo demektir.
---Sorgu kayýt esnasýnda bir kez derlenir. bu sayede performans artýþý saðlanýr.
--View her çaðrýldýðýnda içindeki sorgu yeniden çalýþtýrýlýr.

create view UrunRaporu
as
select u.*,k.KategoriAdi,t.SirketAdi from Urunler u left join Tedarikciler t on u.TedarikciID=t.TedarikciID left join Kategoriler k on u.KategoriID=k.KategoriID

select*from UrunRaporu

--Hangi personelin hangi üründen toplamda kaç dolarlýk satýþ yaptýðýný listeleyen view ý yazýnýz
create view PersonelSatisRaporu
as
select p.Adi,u.UrunAdi,sum(sd.Fiyat*sd.Adet*(1-sd.Indirim)) as ToplamTutar from Satislar s left join Personeller p on p.PersonelID=s.PersonelID left join SatisDetay sd on sd.SatisID=s.SatisID left join Urunler u on u.UrunID=sd.UrunID group by p.Adi,u.UrunAdi

--Not:view veya function oluþtururken kolonlarýn ismi olmak zorundadýr.yoksa hata verir

select*from PersonelSatisRaporu



create view MusteriSatisRaporu 
with encryption --bu viewi deðiþikliðe kapat demek
as 
select m.SirketAdi,u.UrunAdi,sum(sd.Fiyat*sd.Adet*(1-sd.Indirim)) as Total from Satislar s left join Musteriler m on s.MusteriID=m.MusteriID left join SatisDetay sd on sd.SatisID=s.SatisID left join Urunler u on sd.UrunID=u.UrunID group by m.SirketAdi,u.UrunAdi

select*from MusteriSatisRaporu