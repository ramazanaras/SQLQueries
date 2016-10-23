--PAGING
declare @pagenumber int=30 
declare @pagesize int=10

select *from [Northwind].[dbo].[Products] a 
order by a.ProductID
offset @pagenumber rows fetch next @pagesize rows only 

--procedür hali
CREATE PROC SP_PAGING
@pagenumber int,
@pagesize int
AS
BEGIN
	select *from [Northwind].[dbo].[Products] a 
order by a.ProductID
offset @pagenumber rows fetch next @pagesize rows only 
END

exec SP_PAGING 40,10

--TABLE DETAILS 
select*from INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='Employees'
select*from INFORMATION_SCHEMA.TABLES where TABLE_NAME='Products'

--all db names 
select*from master.dbo.sysdatabases

--delay(gecikme)
WAITFOR DELAY '00:00:3' --3 SANÝYELÝK gecikme yaratýr.

select*from Products

waitfor TIME '15:08:00' --verilen saat kadar gecikme yaratýr

