--Having Deyimi:Sadece group by kullanýlan sorgularda kullanýlabilir.Aggregate function kullanýlarak where yazmayý saðlar.
--Hesaplanarak üretilen bir sütuna koþul koymak istediðimizde kullanmamýz gereken komuttur.


--Satýþ fiyatý 1000 dolardan fazla olan hangi ürünleri hangi personel satmýþtýr?
select  p.Adi,u.UrunAdi,sum(sd.Fiyat*sd.Adet*(1-Indirim)) as [Toplam tutar]  from Personeller p left join Satislar s on p.PersonelID=s.PersonelID left join SatisDetay sd on s.SatisID=sd.SatisID left join Urunler u on sd.UrunID=u.UrunID group by p.Adi,u.UrunAdi having sum(sd.Fiyat*sd.Adet*(1-Indirim))>1000 