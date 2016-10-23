--Kümeleme fonksiyonlarý:Birleþtirme,kesiþim ve fark olmak üzere 3'e ayrýlýr
--Farklý iki sorgu üzerinde yukarýda belirtilen iþlemleri yapar.
--Önemli bir kural vardýr.Yukarýda tüm iþlemlerde iki sorgudaki kolon sayýsý ve kolon tipleri ayný olmak zorundadýr.
--Birleþtirme-->Union 
--Fark -->Except 
--Kesiþim -->intersect


--Union:
--Tüm carilerimizi listeleyen sorguyu yazýnýz.(hem müþterilerimizi hem tedarikçilerimizi  listeleyen sorguyu yazýnýz. )

select SirketAdi,'Tedarikci' from Tedarikciler
union --iki sorguyu birleþtirdi.
select SirketAdi,'Musteri' from Musteriler

--intersect:
select SirketAdi from Tedarikciler 
intersect--iki sorgudaki kesiþimi alýr.iki sorgudaki ayný olan þirketi getir.
select SirketAdi from Musteriler 

--except:iki sorgu arasýndaki farký alýr
select SirketAdi from Tedarikciler
except --yukarýdaki sorgudan aþaðýdaki sorguyu çýkar.(ortak olan 1 kayýt vardý.o 1 kayýdý çýkarýr.)
select SirketAdi from musteriler