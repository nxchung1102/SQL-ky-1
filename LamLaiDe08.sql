CREATE DATABASE lamlaide8
CREATE TABLE NhanVien
(
    MaNV VARCHAR(4) PRIMARY KEY,
	HoTenNV NVARCHAR(30),
	NamLamViec INT,
	luong MONEY
)
CREATE TABLE KhachHang
(
    MaKH VARCHAR(4) PRIMARY KEY,
	HoTen NVARCHAR(30),
	NgaySinh DATE,
	QueQuan NVARCHAR(30),
	Gtinh VARCHAR(4)
)
CREATE TABLE DonDatHang
(
    SoHD VARCHAR(4)PRIMARY KEY,
	MaKH VARCHAR(4),
	MaNV VARCHAR(4),
	SanPham NVARCHAR(30),
	FOREIGN KEY (MaKH) REFERENCES dbo.KhachHang(MaKH),
	FOREIGN KEY (MaNV) REFERENCES dbo.NHANVIEN(MANV)
)
INSERT INTO dbo.NhanVien
(
    MaNV,
    HoTenNV,
    NamLamViec,
    luong
)
VALUES
('N1',N'Trần An Nhiên', 2013,60000000 ),
('N2',N'Lê Bình An ', 2018,90000000 ),
('N3',N'Phan Văn Huy', 2020,50000000 )

INSERT INTO dbo.KhachHang
(
    MaKH,
    HoTen,
    NgaySinh,
	QueQuan,
    Gtinh
)
VALUES
('KH1',N'Trần Bình Minh','1979-5-1',N'Hà Nội','Nam'),
('KH2',N'Khổng Tước','2000-3-8',N'Hà Nội','Nam'),
('KH3',N'Đặng Nga','1997-1-5',N'Hà Tĩnh','Nữ')
INSERT INTO dbo.DonDatHang
(
    SoHD,
    MaKH,
    MaNV,
    SanPham
)
VALUES
('H001','KH1','N1',N'Son Môi'),
('H002','KH2','N2',N'Kem Dưỡng'),
('H003','KH3','N2',N'Túi')

SELECT dbo.NhanVien.MaNV,HoTenNV,luong FROM dbo.NhanVien 
JOIN dbo.DonDatHang ON	DonDatHang.MaNV = NhanVien.MaNV
JOIN dbo.KhachHang ON	KhachHang.MaKH = DonDatHang.MaKH
WHERE dbo.KhachHang.HoTen = N'Khổng Tước'

SELECT MaNV,HoTenNV,luong FROM dbo.NhanVien 
WHERE NamLamViec>2012 AND HoTenNV LIKE N'%Nhiên'

SELECT TOP 1 t1.MaNV,t1.HoTenNV,COUNT(t2.MaNV) FROM dbo.NhanVien t1 
JOIN dbo.DonDatHang t2 ON t2.MaNV = t1.MaNV
JOIN dbo.KhachHang t3 ON t3.MaKH = t2.MaKH
GROUP BY t1.MaNV,t1.HoTenNV ORDER BY COUNT(t2.MaNV) DESC

SELECT TOP 2 HoTen,MaKH, YEAR(GETDATE())-YEAR(NgaySinh)as tuoi FROM dbo.KhachHang
WHERE QueQuan=N'hà nội' 
ORDER BY HoTen DESC

INSERT INTO dbo.DonDatHang
(
    SoHD,
    MaKH,
    MaNV,
    SanPham
)
VALUES
(   'H004', -- SoHD - varchar(4)
    'KH3', -- MaKH - varchar(4)
    'N3', -- MaNV - varchar(4)
    N'Kem' -- SanPham - nvarchar(30)
    )

UPDATE dbo.NhanVien
SET luong = luong+luong*0.05

	SELECT * FROM dbo.NhanVien 

	DELETE FROM dbo.NhanVien
	WHERE HoTenNV LIKE N'%Huy'

