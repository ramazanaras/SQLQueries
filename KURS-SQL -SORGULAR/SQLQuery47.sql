--left join
select *from Bolumler b left join Ogrenciler o on o.bolumID=b.BolumID

--right join
select*from Ogrenciler o right join Bolumler b on o.bolumID=b.BolumID
