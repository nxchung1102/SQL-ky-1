CREATE DATABASE dezalo1
CREATE TABLE Phong
(
    MaPH VARCHAR(4) PRIMARY KEY,
	TenPhong NVARCHAR(30),
	DonGia MONEY
)
CREATE TABLE KhacHang
(
    MaKH VARCHAR(4),
	TenKH NVARCHAR(30),
	MaPH VARCHAR(4),
	NgayThue DATE,
	NgayTra DATE,
	PRIMARY KEY(MaKH),
	FOREIGN KEY(MaPH) REFERENCES dbo.Phong(MaPH) 
	
)
CREATE TABLE DichVu
(
    MaPH VARCHAR(4),
	MaKH VARCHAR(4),
	Ngay DATE,
	TienDV MONEY,
	TenDV NVARCHAR(30),
	FOREIGN KEY(MaPH) REFERENCES dbo.Phong(MaPH),
	FOREIGN KEY(MaKH) REFERENCES dbo.KhacHang(MaKH)
)
INSERT INTO dbo.Phong
(
    MaPH,
    TenPhong,
    DonGia
)
VALUES
('PH01',N'Phòng đơn',500000 ),
('PH02',N'Phòng đôi',700000 ),
('PH03',N'Phòng vip',1000000 )


 INSERT INTO dbo.KhacHang
(
    MaKH,
    TenKH,
    MaPH,
    NgayThue,
    NgayTra
)
VALUES
('KH01',N'Lê Văn Nghĩa','PH01','2020-02-15','2020-02-17'),
('KH02',N'Nguyễn Thị Lan','PH02','2020-01-12','2020-01-18'),
('KH03',N'Nguyễn Xuân Chung','PH02','2020-01-01','2020-01-31')
INSERT INTO dbo.DichVu
(
    MaPH,
    MaKH,
    Ngay,
    TienDV,
    TenDV
)
VALUES
( 'PH01','KH01','2020-02-16',30000,N'Giặt ủi' ),
( 'PH02','KH02','2020-01-17',10000,N'Điểm tâm' ),
( 'PH02','KH02','2020-01-18',20000,N'điện thọai' )

SELECT *, tienphon=(t0.songaythue*t0.DonGia)  from
(SELECT t1.TenKH,t2.TenPhong,t1.NgayThue,t1.NgayTra, songaythue= (DAY(t1.NgayTra)-DAY(t1.NgayThue)) ,t2.DonGia 
FROM dbo.KhacHang t1 JOIN	dbo.Phong t2 ON t2.MaPH = t1.MaPH
) t0
GROUP BY t0.TenKH,t0.TenPhong,t0.NgayThue,t0.NgayTra,t0.songaythue,t0.DonGia


SELECT TenKH, MaPH, NgayThue , NgayTra FROM dbo.KhacHang
WHERE TenKH LIKE N'%Lê%' AND MONTH(NgayThue)=2 AND YEAR(NgayThue)=2020


SELECT  t0.* FROM (
SELECT t2.TenKH,t1.MaPH,t1.TenPhong 
, DAY(t2.NgayTra)-DAY(t2.NgayThue) AS ngay_o 
FROM dbo.Phong t1 
JOIN dbo.KhacHang t2 ON t2.MaPH = t1.MaPH) t0
--WHERE t0.TenPhong LIKE N'Phòng đôi' OR t0.TenPhong LIKE N'Phòng đơn'
--AND MAX(t0.ngay_o) >t0.ngay_o
--WHERE t0.TenKH NOT LIKE N'Nguyễn Xuân Chung'
 GROUP BY t0.TenKH,t0.MaPH,t0.TenPhong,t0.ngay_o
 -- HAVING  MAX(t0.ngay_o) >t0.ngay_o


  SELECT t2.TenPhong, t1.MaPH , t2.DonGia  FROM	dbo.KhacHang t1 
  JOIN dbo.Phong t2
  ON t2.MaPH = t1.MaPH 
  WHERE  t1.MaPH NOT IN (SELECT t4.MaPH FROM dbo.KhacHang t3 
  JOIN dbo.Phong t4
  ON t4.MaPH = t3.MaPH 
  WHERE  MONTH(t3.NgayThue)=1 AND YEAR(t3.NgayThue)=2020)


  INSERT INTO dbo.DichVu
  (
      MaPH,
      MaKH,
      Ngay,
      TienDV,
      TenDV
  )
  VALUES
  (   'PH03',        -- MaPH - varchar(4)
      'KH02',        -- MaKH - varchar(4)
      '2020-01-01', -- Ngay - date
      100000,      -- TienDV - money
      N'Gội đầu dưới'        -- TenDV - nvarchar(30)
      )


UPDATE dbo.Phong 
SET DonGia = DonGia/2
WHERE TenPhong=N'Phòng đôi'

SELECT * FROM dbo.Phong 



 
 
 SELECT *, MAX(t0.ngay_o) from (  SELECT t1.TenKH, t1.MaPH, t2.TenPhong, DAY(t1.NgayTra)-DAY(t1.NgayThue) AS ngay_o
 FROM dbo.KhacHang t1 
 JOIN dbo.Phong t2 ON t2.MaPH = t1.MaPH 
 WHERE t2.TenPhong IN (N'Phòng đôi',N'Phòng đơn',N'Phòng vip') )t0
 GROUP BY t0.TenKH, t0.MaPH, t0.TenPhong, t0.ngay_o
 ORDER BY MAX(t0.ngay_o) DESC




