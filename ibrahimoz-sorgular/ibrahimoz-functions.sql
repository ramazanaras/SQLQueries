--functions(Fonksiyonlar):
--Fonksiyonlarda 3'e ayrýlýr.
--Bunlar;
--1:Scalar valued Functions 
--2:Table valued functions 
--3:Aggregate valued functions (sum,avg,count fonksiyonlarý)

--1:Scalar valued functions(geriye tek hücre çýktýsý verirler)
create function fncKdvHesapla(@fiyat money)
returns money --geriye döndüreceði tipi belirtiyoruz.
as
begin

declare @kdv money --deðiþken tanýmladýk 
set @kdv=@fiyat*0.18  --deðeri atadýk
return  @kdv   --deðeri geriye dönderdik


end

select UrunAdi,Fiyat,dbo.fncKdvHesapla(Fiyat) as KDV from Urunler 

go--yukarýdaki kodla aþaðýdaki kodu ayýrýr.


--Ürünün kdvli fiyatýný hesaplayan functions'u yazýnýz
create function fncKdvliFiyat(@fiyat money)
returns money
as
begin

declare @kdvli money
set @kdvli=@fiyat+(@fiyat*0.18)
return @kdvli 

end

select UrunAdi,Fiyat,dbo.fncKdvHesapla(Fiyat) as KDV,dbo.fncKdvliFiyat(Fiyat) as KDVLÝFÝYATI from Urunler 

go

--SATILAN ÜRÜNLERÝN ADETLERÝ VE ÝNDÝRÝMLERÝDE BAZ ALINARAK HER ÜRÜNÜN KDVLÝ FÝYATINI HESAPLAYAN FONKSÝYONU YAZINIZ


create function fncGenelKdvliFiyat(@fiyat money,@adet int,@indirim float)
returns money
as 
begin

	declare @kdvli money
	set @kdvli=@fiyat*@adet
	set @kdvli=@kdvli+(@kdvli*0.18)
	set @kdvli=@kdvli*(1-@indirim)
	return @kdvli

end

select UrunID,Adet,Fiyat,Indirim,dbo.fncGenelKdvliFiyat(Fiyat,Adet,Indirim) as KDVLÝFÝYAT from SatisDetay

go 

--2:Table valued Functions:Geriye table tipinde deðer döndüren fonksiyonlardýr.

create function KategoriyeGoreUrunler(@kId int)
returns table
as
return select*from Urunler where KategoriID=@kId



select*from dbo.KategoriyeGoreUrunler(6)


------------
declare @a int=10  --deðiþken tanýmlama


--table tipinde deðiþken tanýmý
declare @deneme table(b int) --içerisinde tek bir kolon olan ve kolonun adý b olan table tanýmladýk.