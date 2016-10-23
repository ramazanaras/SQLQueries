--if exists 

if EXISTS(select*from Categories where CategoryID=1)
BEGIN 
	print '1 idli kategori mevcut'
END
ELSE
BEGIN
	PRINT '1 ÝDLÝ KATEGORÝ YOK'
END

----ÝF NOT EXISTS

declare @kategori nvarchar(50) 

select @kategori='Beverages'

if NOT EXISTS(SELECT*FROM Categories Where CategoryName=@kategori)
begin
	insert into Categories(CategoryName) values(@kategori)
end
else
begin
	print 'Bu isimde bir kategori zaten var' 
end




