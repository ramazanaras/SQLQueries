--VARIABLES

--DECLARE @degisken1 nvarchar(50)
--DECLARE @degisken2 int 
--DECLARE @degisken3 datetime 

--declare @a int,@b tinyint,@c datetime 

--set @degisken1='abc'--değer atıyoruz

--select  @degisken1 --değeri okuyoruz



--declare @sayi1 int ,@sayi2 int ,@toplam int --değişkenleri tanımladık(değerde atayabiliriz içine)

--select @sayi1=10,@sayi2=20 --değer atadık

--select @toplam=@sayi1+@sayi2 

--select @toplam as [Toplam] --okuttuk



--conversion /casting
declare @tarih varchar(50)='1987-12-27'
select datediff(year,@tarih,getdate())



declare @sayi1 varchar(5)='10',@karesi int 
select @karesi=CONVERT(int,@sayi1)*CONVERT(int,@sayi1)
--select @karesi=cast(@sayi1 as int)*cast(@sayi1 as int) --yukarıdakiyle aynı 
select @karesi



--if statement
declare @deger1 int=5 

if(@deger1=5)
begin
print 'deger 5 e eşit'
end
else if(@deger1=6)
begin
print 'deger 6 ya eşit'
end
else
begin
print 'değer 5 e eşit değil'
end



---------
declare @dogumTarihi varchar(50)='1987-12-27',@gunsayisi int 
select @gunsayisi=datediff(DAY,@dogumTarihi,getdate())--bugünün tarihinden tarih1'i çıkart gün sayısı olarak ver.

if(@gunsayisi>7000 and @gunsayisi<8000)
begin
print cast(@gunsayisi as varchar)+' yaşın çok az'
end
else if(@gunsayisi>8000 and @gunsayisi<9000)
begin
print  cast(@gunsayisi as varchar)+' yaşın orta'
end
else
begin
print cast(@gunsayisi as varchar)+' yaşın büyük'
end 



-----------

declare @kategoriAdi nvarchar(20),@description nvarchar(100)

select @kategoriAdi='Deniz Mamulleri',@description='Balık,kalamar,ahtapot,yengeç'

insert into Categories(CategoryName,[Description])
output inserted.* --eklerken veriyide göster hangisi eklenmiş
 values(@kategoriAdi,@description)


 ------------
 declare @kategoriAdi1 nvarchar(20),@description1 nvarchar(100)
select @kategoriAdi1='Deniz Mamulleri',@description1='Balık,kalamar,ahtapot,yengeçççç'
 update Categories set CategoryName=@kategoriAdi1,Description=@description1 where CategoryID=15


---------------------

--while döngüsü

declare @sayac int=0

while(@sayac<10)
begin
	print 'Sayac değeri: '+cast(@sayac as varchar)
	select @sayac+=1
end
-----------------

--tabloya while ile veriler ekleme 
declare @id int=1,@isim nvarchar(50)='isim'
while(@id<20)
begin
	select @isim=@isim+cast(@id as nvarchar)
	insert into deneme values(@id,@isim)
	select @id+=1
end

-------------
select*from deneme