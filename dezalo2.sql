CREATE DATABASE qlhh3
CREATE TABLE NhanVien
(
    MaNV VARCHAR(4)PRIMARY KEY,
	HoTenNV NVARCHAR(30),
	NamLamViec INT,
	Luong MONEY
)
CREATE TABLE KhachHang
(
    MaKH VARCHAR(4)PRIMARY KEY,
	HoTenKH NVARCHAR(30),
	NgaySinh DATE,
	QueQuan NVARCHAR(30),
	GTinh NVARCHAR(4),
)
CREATE TABLE DonDatHang
(
    SoHD VARCHAR(4)PRIMARY KEY,
	MaKH VARCHAR(4),
	MaNV VARCHAR(4),
	SanPham NVARCHAR(30),
	FOREIGN KEY(MaKH) REFERENCES dbo.KhachHang(MaKH),
	FOREIGN KEY(MaNV) REFERENCES dbo.NhanVien(MaNV)
)
INSERT INTO dbo.NhanVien
(
    MaNV,
    HoTenNV,
    NamLamViec,
    Luong
)
VALUES
('N1',N'Trần An Nhiên',2013,60000000 ),
('N2',N'Lê Bình An',2018,90000000 ),
('N3',N'Phan Huy Văn',2020,50000000 )

INSERT INTO dbo.KhachHang
(
    MaKH,
    HoTenKH,
    NgaySinh,
    QueQuan,
    GTinh
)
VALUES
('KH1',N'Trần Hoàng Hôn','1979-05-01',N'Hà Nội',N'Nam' ),
('KH2',N'Khổng Long','2000-03-08',N'Hà Tĩnh',N'Nam' ),
('KH3',N'Đặng Mỹ','1997-01-05',N'Hà Nội',N'Nữ' )

INSERT INTO dbo.DonDatHang
(
    SoHD,
    MaKH,
    MaNV,
    SanPham
)
VALUES
('H001','KH1','N1',N'Son Môi' ),
('H002','KH2','N2',N'Kem Dưỡng' ),
('H003','KH3','N2',N'Túi' )

SELECT t0.MaNV,t0.HoTenNV,t0.Luong, YEAR(GETDATE())-YEAR(t2.NgaySinh) AS tuoi FROM dbo.NhanVien t0 
JOIn dbo.DonDatHang t1 ON  t1.MaNV = t0.MaNV
JOIN dbo.KhachHang t2 ON t2.MaKH = t1.MaKH
WHERE YEAR(GETDATE())-YEAR(t2.NgaySinh)>30

SELECT* FROM dbo.NhanVien 
WHERE NamLamViec >2012 AND HoTenNV LIKE N'% ___ %'

SELECT TOP 1  t1.HoTenNV,t1.MaNV, COUNT(t2.MaNV) AS slsp FROM	dbo.NhanVien t1 JOIN dbo.DonDatHang t2 ON t2.MaNV = t1.MaNV
GROUP BY  t1.HoTenNV,t1.MaNV
ORDER BY slsp DESC

SELECT t1.MaKH,t1.HoTenKH,YEAR(GETDATE())-YEAR(t1.NgaySinh) AS tuoi FROM	dbo.KhachHang t1 JOIN dbo.DonDatHang ON DonDatHang.MaKH = t1.MaKH
WHERE t1.QueQuan=N'Hà Nội'
ORDER BY t1.HoTenKH DESC



INSERT INTO dbo.DonDatHang
(
    SoHD,
    MaKH,
    MaNV,
    SanPham
)
VALUES
('H004','KH3','N3',N'Giày')

SELECT * FROM dbo.NhanVien


UPDATE dbo.NhanVien
SET Luong = Luong-Luong *0.05

DELETE FROM dbo.DonDatHang 
WHERE MaNV = 'N3'
delete FROM dbo.NhanVien
WHERE HoTenNV NOT LIKE	 (N'%ê%')

SELECT * FROM dbo.DonDatHang



