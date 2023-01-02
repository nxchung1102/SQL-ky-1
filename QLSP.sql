CREATE DATABASE QuanLySanPham;

create table Ma_hang (
MaHang varchar (20),
TenHang nvarchar (20),
DongGia int
);
CREATE TABLE Khach_hang (
   MAKH varchar (20),
   NgaySinh date,
   TenKH nvarchar(30),
   GioiTinh nvarchar(20),
   QueQuan nvarchar (20)
);
CREATE TABLE Hoa_don (
   SoPhieu varchar (20),
   NgayLap date,
   MAKH varchar (20)
);
CREATE TABLE CTHoa_don (
 SoPhieu varchar (20),
 MaHang varchar (20),
 SoLuong int
);