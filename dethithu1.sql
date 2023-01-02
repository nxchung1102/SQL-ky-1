create database qlsv
create table SinhVien(
MASV varchar (5) primary key,
HVT nvarchar (30),
NgaySinh date,
PHAI nvarchar (4),
)
drop table SinhVien

create table MonHoc(
MAMH varchar (4) primary key ,
TenMH nvarchar (30),
SoTC int
)
drop table MonHoc

create table DIEM(
MASV varchar (5),
MAMH varchar (4),
Diemthi int,
primary key (MASV,MAMH),
FOREIGN KEY(MASV) REFERENCES dbo.SinhVien(MASV),
FOREIGN KEY(MAMH) REFERENCES dbo.MonHoc(MAMH)
)
drop table DIEM



)