--Procedure:Procedure'u view 'in parametre alan þekli gibi düþünebiliriz.

create proc Urun
as
begin
select*from Urunler
end

exec Urun

go --alttaki kodu üstteki koddan ayýrýr

--Ürün adýný,fyatýný ve stoðunu parametre olarak alýp ürünler tablosuna ekleyen procedure yazýnýz.
create proc UrunEkle
@urunAdi nvarchar(50),
@fiyat money,
@stok smallint
as
begin
insert into Urunler(UrunAdi,Fiyat,Stok) values(@urunAdi,@fiyat,@stok)
end

exec UrunEkle 'Ayva',4,99

select*from Urunler

go--alttaki kodu üstteki koddan ayýrýr.


alter proc UrunEkle
@urunAdi nvarchar(50),
@fiyat money,
@stok smallint
as
begin
declare @trimli nvarchar(50)=ltrim(rtrim(@urunAdi))--saðdan ve soldan boþluðu al
if(exists(select*from Urunler where UrunAdi=@trimli))--sorgu true ve ya false döndürür.
begin
print 'Bu ürün zaten eklidir'
end

else
begin
insert into Urunler(UrunAdi,Fiyat,Stok) values(@trimli,@fiyat,@stok)
end

end

exec UrunEkle 'Þeftali ',7,120
exec UrunEkle ' Þeftali',7,120


go 


--Ürün adý parametresi alarak o ürünü silen procedure'u yazýnýz
create proc UrunSil
@urunAdi nvarchar(50)
as
begin
delete from Urunler where UrunAdi=ltrim(rtrim(@urunAdi))
end

exec UrunSil 'Ayva '

select*from Urunler


go


--id parametresi alýp o id li ürünün stoðunu 10 artýran procedure'u yazýnýz.
create proc StokArttir
@urunID int
as 
begin
update Urunler set Stok+=10 where UrunID=@urunID

end

exec StokArttir 85

select*from Urunler