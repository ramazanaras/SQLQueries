--transactions

--iþlemlerin bütünlüðünün saðlanmasýna transaction denir.
--bir ve ya birden fazla iþlemin bütün içinde çalýþmasý
--iþlemlerin herhangi bir hata durumunda geri alýnmasýna rollback(geri alma) denir.
--transaction bloðu try/catch bloklarý içerisinde kullanýlmalýdýr.


alter PROC HAVALEYAP
@GONDEREN INT,
@ALICI INT,
@TUTAR money 
as
begin
	declare @BAKIYE MONEY
	select @BAKIYE=Bakiye from Musteriler where MusteriID=@GONDEREN  --deðeri atadýk.

	IF(@BAKIYE>@TUTAR)
	begin
		begin try 
			begin tran 
				update Musteriler SET Bakiye-=@TUTAR
				WHERE MusteriID=@GONDEREN
				SELECT 1/0 --HATA KISMI 
				UPDATE Musteriler set Bakiye+=@TUTAR
				where MusteriID=@ALICI

			commit
		end try
		begin catch
		    SELECT 'ÝÞLEM GERÝ ALINDI ' +ERROR_MESSAGE()
			ROLLBACK  TRANSACTION        --TRAN 'da diyebiliriz
		end catch
	end
	else
	begin
	print 'yetersiz bakiye!'
	end

end

select*from Musteriler

exec HAVALEYAP 1,2,2000


go--yukarýdaki kodla aþaðýdaki kodu birbirinden ayýrýr.
----------------------------------------
--Employee tablosuna veri eklenirken user tablosunada veriyi ekliyoruz.bir hata durumunda transaction kullanarak user iþlemleri geri alýyoruz
alter PROC TRANSAC_EMPLOYEE
@EMPLOYEENAME varchar(50),
@EMPLOYEELASTNAME varchar(50)
AS
begin
	begin try 
	
			begin tran 
			INSERT INTO Employees(FirstName,LastName)
	values(@EMPLOYEENAME,@EMPLOYEELASTNAME)
	   select 1/0 --hata kýsmý
		declare @EmployeID int

	select @EmployeID=SCOPE_IDENTITY()--eklenen kaydýn idsi

	insert into Users values(@EmployeID,LOWER(@EMPLOYEENAME+'.'+@EMPLOYEELASTNAME),NEWID(),GETDATE())
			commit
		end try
		begin catch
		SELECT 'ÝÞLEM GERÝ ALINDI ' +ERROR_MESSAGE()
			ROLLBACK  TRANSACTION        --TRAN 'da diyebiliriz
		end catch
end

exec TRANSAC_EMPLOYEE 'nedim','sad'

-------------------

