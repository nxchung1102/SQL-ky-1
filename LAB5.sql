CREATE DATABASE QLHH;
CREATE TABLE MATHANG(
	MAHANG VARCHAR(4) PRIMARY KEY,
	TENAHANG NVARCHAR(40),
	DONGIA MONEY
)
CREATE TABLE KHACHHANG
(
	MAKH VARCHAR(4) PRIMARY KEY,
	NGAYSINH DATE,
	TENKH NVARCHAR(20),
	GIOITINH NVARCHAR(4),
	QUEQUAN NVARCHAR(20)
)
CREATE TABLE HOADON
(
	SOPHIEU VARCHAR(4) PRIMARY KEY,
	NGAYLAP DATE,
	MAKH VARCHAR(4) REFERENCES dbo.KHACHHANG
)
CREATE TABLE CTHOADON
(
	SOPHIEU VARCHAR(4),
	MAHANG VARCHAR(4),
	PRIMARY KEY(SOPHIEU,MAHANG),
	SOLUONG INT,
	FOREIGN KEY(SOPHIEU) REFERENCES dbo.HOADON(SOPHIEU),
	FOREIGN KEY(MAHANG) REFERENCES dbo.MATHANG(MAHANG)
)

INSERT INTO dbo.MATHANG(MAHANG,TENAHANG,DONGIA)VALUES('M1', N'Dưỡng môi Ohui',200000),
('M2',N'Tinh chât Ohui',1000000),
('M3',N'Kem dưỡng Ohui',550000)
INSERT INTO dbo.KHACHHANG(MAKH,NGAYSINH,TENKH,GIOITINH,QUEQUAN)
VALUES('K1','2000-12-01',N'Trần Diệu Vy',N'Nữ',N'Hà Nội'),
('K2','2006-03-02',N'Trần Đình Trọng', N'Nam',N'Thái Bình'),
('K3','2013-03-14',N'Minh Hà',N'Nữ',N'Sài Gòn'),
('K4','2000-12-21',N'Trương Tiến Dũng',N'Nam',N'Đà Lạt')

INSERT INTO dbo.HOADON
(
    SOPHIEU,
    NGAYLAP,
	MAKH
)
VALUES('P1','2022-1-1','K1'),
('P2','2022-01-18','K1'),
('P3','2022-04-18','K3')
INSERT INTO dbo.CTHOADON(SOPHIEU,MAHANG,SOLUONG)VALUES
('P1', 'M1', 2),
('P1', 'M2', 3),
('P2', 'M2', 1),
('P1', 'M3', 2)
--Câu 2
SELECT MAKH,TENKH,GIOITINH FROM dbo.KHACHHANG WHERE TENKH LIKE N'Trần%' AND QUEQUAN = N'Hà nội'

SELECT *, YEAR(GETDATE()) - YEAR(NGAYSINH) AS Tuoi FROM dbo.KHACHHANG WHERE YEAR(GETDATE()) - YEAR(NGAYSINH) > 20

SELECT MAKH, TENKH  FROM KHACHHANG WHERE MAKH not in (SELECT DISTINCT(MAKH) FROM HOADON)

 