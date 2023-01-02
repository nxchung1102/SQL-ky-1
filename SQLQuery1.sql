create database QuanLySinhVien
--Database 'QuanLySinhVien' already exists : đã tồn tại
--bắt buộc phải có "," trừ câu lệnh cuối cùng
CREATE TABLE SinhVien (
    Ma_sv varchar(20), 
    ten varchar(20),
    tuoi int,
	primary key (Ma_sv),
);
drop table sinhvien
insert into SinhVien
values('PH1111',N'nguyễn xuân chung',19)
select * from SinhVien

CREATE TABLE LopHoc (
    MaLop varchar(20) primary key not null, 
    TenLH varchar(20)not null,
    SoSV int,
	Phong varchar(20),
	check(SoSV<=20)
);
drop table LopHoc

insert into LopHoc (MaLop,TenLH,SoSV,Phong)
values ('NXC21','IT18202',20,'D408');
CREATE TABLE SinhVien1 (
    Ma_sv varchar(20)primary key, 
    ten varchar(20),
    tuoi int,
	MaLop varchar(20) references LopHoc(MaLop),
);
insert into SinhVien1
values ('PH11111',N'nguyễn xuân chung',19,'NXC21')
select * from LopHoc