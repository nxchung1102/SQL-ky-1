CREATE DATABASE qlhh2
CREATE TABLE NhanVien
(
MaNV VARCHAR(4) PRIMARY KEY,
HoTenNV NVARCHAR(30),
NamLamViec INT,
Luong MONEY, 
)

CREATE TABLE KhachHang
(
    MaKH VARCHAR(4) PRIMARY KEY,
	HoTenKH NVARCHAR(30),
	NgaySinh DATE,
	QueQuan NVARCHAR(30),
	Phai NVARCHAR(4)
)
CREATE TABLE DonDatHang
(
    SoHD VARCHAR(4) PRIMARY KEY,
	MaKH VARCHAR(4) REFERENCES dbo.KhachHang(MaKH),
	MaNV VARCHAR(4) REFERENCES dbo.NhanVien(MaNV),
	SanPham NVARCHAR(30),	
)
INSERT INTO dbo.NhanVien
(
    MaNV,
    HoTenNV,
    NamLamViec,
    Luong
)
VALUES
(   'Nv1', N'Trần An Nhiên', 2013,60000000 ),
(   'Nv2', N'Lê Bình An', 2018,90000000 ),
(   'Nv3', N'Phan Huy Văn', 2020,50000000 );
INSERT INTO dbo.KhachHang
(
    MaKH,
    HoTenKH,
    NgaySinh,
    QueQuan,
    Phai
)
VALUES
(   'Kh01',  N'Trần Thị Hoa','1997-05-04', N'Hà Nội', N'Nữ' ),
(   'Kh02',  N'Nguyễn Phong','1999-03-05', N'Hà Tĩnh', N'Nam' ),
(   'Kh03',  N'Đặng Bảo Nam','1991-01-05', N'Nam Định', N'Nam' )
INSERT INTO dbo.DonDatHang
(
    SoHD,
    MaKH,
    MaNV,
    SanPham
)
VALUES
('H001','Kh01','Nv1', N'Bánh Gạo'),
('H002','Kh02','Nv1', N'Giày'),
('H003','Kh03','Nv2', N'Túi');
--2
SELECT t01.MaKH,t01.HoTenKH, t01.Phai FROM dbo.KhachHang t01 
JOIN	dbo.DonDatHang t02 ON t02.MaKH = t01.MaKH 
WHERE t02.SanPham = N'giày'
GROUP BY t01.MaKH,t01.HoTenKH, t01.Phai
--3
SELECT MaKH,HoTenKH, YEAR(GETDATE())-YEAR(NgaySinh) tuoi FROM dbo.KhachHang 
WHERE YEAR(GETDATE())-YEAR(NgaySinh) >18 AND	QueQuan = N'Hà Nội'
--4
SELECT TOP 1 dbo.Nhanvien.manv,hotennv,COUNT(dbo.DonDatHang.MaNV) AS 'total'FROM dbo.Nhanvien JOIN dbo.DonDatHang ON DonDatHang.MaNV = NhanVien.MaNV 
GROUP BY dbo.Nhanvien.manv,hotennv ORDER BY COUNT(dbo.DonDatHang.MaNV) DESC
--5
SELECT * FROM dbo.NhanVien
WHERE Luong >
( SELECT luongtb= AVG(Luong) FROM dbo.NhanVien  )
--6 
INSERT INTO dbo.KhachHang
(
    MaKH,
    HoTenKH,
    NgaySinh,
    QueQuan,
    Phai
)
VALUES
(   'KH05',        -- MaKH - varchar(4)
    N'Nguyễn xuân chung',       -- HoTenKH - nvarchar(30)
    '2020-07-07', -- NgaySinh - date
    N'Hà nội',       -- QueQuan - nvarchar(30)
    N'nam'        -- Phai - nvarchar(4)
    )
	--7
	UPDATE dbo.NhanVien
	SET NamLamViec = 2010
	WHERE HoTenNV= N'Lê Bình An'
	--8
	--cách 1
	delete from dbo.NhanVien where MaNV=
	(  select dbo.NhanVien.MaNV from dbo.NhanVien 
	EXCEPT
	SELECT dbo.DonDatHang.MaNV from dbo.DonDatHang )
	SELECT * FROM dbo.DonDatHang
--cách 2
	delete from NhanVien 
	where MaNV not in (select MaNV from DonDatHang)
