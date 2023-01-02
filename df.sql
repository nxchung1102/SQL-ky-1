create table demodf
(
masv int IDENTITY(1,2) , -- tự động thêm id mà k cần insert
tuoi int default 0,)-- mặc định nếu không nhập vào sẽ có giá trị như default

insert into demodf values ('')
SELECT DATEDIFF(year, '2017/08/25', '2011/08/25') AS DateDiff;

SELECT *,IIF(diem<5,'trungbình','gioi')a FROM dbo.KetQua

SELECT* FROM dbo.SinhVien
WHERE HocBong > all (SELECT HocBong FROM dbo.SinhVien WHERE PHAI=N'nữ')

SELECT* FROM dbo.SinhVien
WHERE HocBong > ANY (SELECT HocBong FROM dbo.SinhVien WHERE PHAI=N'nữ')

SELECT * FROM	dbo.SinhVien
WHERE EXISTS (SELECT diem FROM dbo.KetQua WHERE Diem>9)

SELECT * FROM dbo.SinhVien,dbo.KetQua

SELECT * FROM	 dbo.SinhVien,dbo.KetQua
WHERE dbo.SinhVien.MASV<>dbo.KetQua.MASV