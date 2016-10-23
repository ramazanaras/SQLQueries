--CROSS JOÝN:Tablolardaki tüm kayýtlarý birbiri ile kartezyen çarpým yaparak birbiri ile iliþkilendirir

select*from Urunler u cross join Kategoriler --yani Urunler tablosundaki her bir satýrý diðer tablodaki satýrla birleþtir demek.


--hangi personel hangi ürünlerden satýþ yapmamýþtýr?
select p.Adi,u.UrunAdi from Personeller p  cross join Urunler u--tüm personele tüm ürünleri atadýk.daha sonra bu sorgudan her bir personelin satmýþ olduðu ürünleri çýkarýrsak hangi personelin hangi üründen satmadýðýný buluruz.

select p.Adi,u.UrunAdi from Personeller p left join Satislar s on p.PersonelID=s.PersonelID left join SatisDetay sd on s.SatisID=sd.SatisID left join Urunler u on sd.UrunID=u.UrunID group by p.Adi,u.UrunAdi --her bir personelin sattýðý ürünleri gösterir

--
--aþaðýdaki sorgu bize hangi ürünlerden satýþ yapmamýþtýr onu bize verir.
select p.Adi,u.UrunAdi from Personeller p  cross join Urunler u
except--yukarýdaki sorgudan aþaðýdaki sorguyu çýkar demektir.
select p.Adi,u.UrunAdi from Personeller p left join Satislar s on p.PersonelID=s.PersonelID left join SatisDetay sd on s.SatisID=sd.SatisID left join Urunler u on sd.UrunID=u.UrunID group by p.Adi,u.UrunAdi 


--HANGÝ TEDARÝKÇÝDEN HANGÝ ÜRÜN HÝÇ TEDARÝK EDÝLMEMÝÞTÝR?
select SirketAdi,UrunAdi from Urunler cross join Tedarikciler --her bir tedarikçiyi her bir ürünle eþleþtirdik.Daha sonra hangi tedarikçi hangi ürünü tedarik etmiþ onu buluruz.ve bunu çýkartýrsak hangi tedarikçi hangi ürünleri hiç tedarik etmemiþ bunu buluruz. 

select SirketAdi,UrunAdi from Urunler u left  join Tedarikciler t on u.TedarikciID=t.TedarikciID group by SirketAdi,UrunAdi --hangi tedarikçi hangi ürünü tedarik etmiþ onu bulduk .daha sonra yukarýdaki sorgudan çýkartýrsak istenileni bulmuþ oluruz

---
select SirketAdi,UrunAdi from Urunler cross join Tedarikciler 
except--yukarýdaki sorgudan aþaðýdaki sorguyu çýkar demektir.
select SirketAdi,UrunAdi from Urunler u left  join Tedarikciler t on u.TedarikciID=t.TedarikciID group by SirketAdi,UrunAdi


--HANGÝ ÜRÜN HANGÝ MÜÞTERÝYE HÝÇ SATILMAMIÞTIR?
select m.SirketAdi,u.UrunAdi from Urunler u  cross join Musteriler m  --her bir müþteriyle her bir ürünü eþleþtirdik.daha sonra bunu aþaðýdaki sorgudan çýkartýrsak istenileni bulmuþ oluruz.

select m.SirketAdi,u.UrunAdi from Musteriler m left join Satislar s on m.MusteriID=s.MusteriID left join SatisDetay sd on sd.SatisID=s.SatisID left join Urunler u on sd.UrunID=u.UrunID  group by m.SirketAdi,u.UrunAdi--hangi müþteriye hangi ürün satýlmýþ bulduk.

--
select m.SirketAdi,u.UrunAdi from Urunler u cross join Musteriler m
except
select m.SirketAdi,u.UrunAdi from Musteriler m left join Satislar s on m.MusteriID=s.MusteriID left join SatisDetay sd on sd.SatisID=s.SatisID left join Urunler u on sd.UrunID=u.UrunID  group by m.SirketAdi,u.UrunAdi

