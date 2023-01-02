create database Bang_insert

create table Khoa(
MAKH varchar(4) primary key,
TENKH nvarchar(50),
SLSV int null,
);
drop table Khoa

insert into Khoa (MAKH,TENKH)
values ('HTTT',N'hệ thống thông tin'),
	   ('MANG',N'mạng và truyền thông'),
	   ('CNPM',N'công nghệ phần mền'),
	   ('KTMT',N'kỹ thuật máy tính'),
	   ('KHMT',N'khoa học máy tính');
	   select * from Khoa

create table SinhVien(
MASV varchar(4) primary key,
HOSV nvarchar(30),
TENSV nvarchar(10),
PHAI nvarchar (4),
NgaySinh datetime,
NoiSinh nvarchar (30),
MAKH varchar(4) references Khoa(MAKH),
HocBong money,
DiemTB numeric(4,2) null,
);
drop table SinhVien

insert into SinhVien (MASV,HOSV,TENSV,PHAI,NgaySinh,NoiSinh,MAKH,HocBong)
values ('SV01',N'Lê Kim',N'Lan',N'nữ','1990-02-23 00:00:00',N'Hà Nội','HTTT',130000),
	   ('SV02',N'Trần Minh',N'Chánh',N'nam','1992-12-24 00:00:00',N'Bình Định','MANG',150000),
	   ('SV03',N'Lê An',N'Tuyết',N'nữ','1991-02-21 00:00:00',N'Hải Phòng','HTTT',170000),
	   ('SV04',N'Trần Anh',N'Tuấn',N'nam','1993-12-20 00:00:00',N'tpHCM','MANG',80000),
	   ('SV05',N'Trần Thị',N'Mai',N'nữ','1991-08-12 00:00:00',N'tpHCM','CNPM',0),
	   ('SV06',N'Lê Thị Thu',N'Thủy',N'nữ','1991-01-02 00:00:00',N'An Giang','HTTT',0),
	   ('SV07',N'Nguyễn Kim',N'Thư',N'nữ','1990-02-02 00:00:00',N'Hà Nội','CNPM',180000),
	   ('SV08',N'Lê Văn',N'Long',N'nam','1992-12-08 00:00:00',N'tpHCM','HTTT',190000);
	   select * from SinhVien

create table MonHoc(
MAMH varchar(4) primary key,
TenMH nvarchar(35),
SoTiet tinyint,
);
drop table MonHoc
insert into MonHoc (MAMH,TenMH,SoTiet)
values ('CSDL',N'cơ sở dữ liệu',45),
	   ('TTNT',N'trí tuệ nhân tạo',45),
	   ('MMT',N'mạng máy tính',45),
	   ('DHMT',N'đồ họa máy tính',60),
	   ('CTDL',N'cấu trúc dữ liệu',60);
	   select * from MonHoc

create table KetQua(
MASV varchar(4) references SinhVien(MASV),
MAMH varchar(4) references MonHoc(MAMH),
LanThi tinyint,
Diem numeric(4,2),
KQ varchar(1) null,
primary key (MaSV,MAMH,LanThi)
);
drop table KetQua

insert into KetQua (MaSV,MAMH,LanThi,Diem)
values ('SV01','CSDL',1,3),
	   ('SV01','CSDL',2,6),
	   ('SV01','TTNT',1,5.5),
	   ('SV01','TTNT',2,6),
	   ('SV01','MMT',1,5),
	   ('SV02','CSDL',1,4.5),
	   ('SV02','CSDL',2,7),
	   ('SV02','MMT',1,10),
	   ('SV02','CTDL',1,9),
	   ('SV03','CSDL',1,2),
	   ('SV03','CSDL',2,5),
	   ('SV03','MMT',1,2.5),
	   ('SV03','MMT',2,4),
	   ('SV04','CSDL',1,4.5),
	   ('SV04','CTDL',1,10),
	   ('SV05','CSDL',1,7),
	   ('SV05','MMT',1,2.5),
	   ('SV05','MMT',2,5),
	   ('SV06','TTNT',1,6),
	   ('SV06','DHMT',1,10);
	   select * from KetQua


