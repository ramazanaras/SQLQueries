--Transaction :En küçük iþlem parçacýðýdýr.
--Birden fazla iþlem parçacýðýný  tek bir iþlem parçacýðý haline getirip bu iþlem parçacýðýnýn herhangi bir yerinde hata olduðu zaman tüm iþlemi iptal etmeyi geri almayý saðlayan yapýdýr.

select*from Kategoriler

begin tran
delete from Kategoriler  where KategoriID=11

rollback tran --yukarýdaki iþlemi geri alýr(veri geri gelir)

--------------------------------
--HAVALE ÝÞLEMÝ
alter proc prc_HavaleYap
@aliciId int,
@gonderenId int,
@tutar money
as
begin

	begin try 

	begin tran havale--transaction baþlayýyoruz
	update Hesaplar set Bakiye-=@tutar where Id=@gonderenId
	declare @a int=8/0--hata verdirdik(0'a bölünebilme hatasý)
	update Hesaplar set Bakiye+=@tutar where Id=@aliciId
	commit tran havale --açýlan transactionlarý onaylýyoruz.

	end try

	begin catch
	rollback tran havale--açýlan transaction'ý geri alýyoruz.
	print 'Hata oluþtu'

	end catch



end

exec prc_HavaleYap 1,2,5000


select*from Hesaplar


--@TranCount:Açýk olan transaction sayýsýný verir.
select @@TRANCOUNT