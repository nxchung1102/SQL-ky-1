-- buổi 3
alter table SinhVien
add mail varchar(50);

alter table SinhVien
add constraint checkTuoiSV check(year(NgaySinh)>1989);

alter table SinhVien
drop column mail

alter table SinhVien
alter column HocBong int

update SinhVien
set PHAI = N'nữ'
where TENSV = 'lan'

delete SinhVien
where MASV = 'SV05'

select * from MonHoc

update MonHoc
set SoTiet= 45
where TenMH = 'cơ sở dữ liệu'

update SinhVien
set PHAI = N'nam',HOSV = N'lên kim',TENSV =N'lân'
where TENSV = 'lan'

select *from SinhVien

update SinhVien
set HocBong = HocBong*1.2
where MAKH = 'MANG'

select *from KetQua

select * from SinhVien
order by HocBong desc
-- esc = tăng dần, desc= giảm dần


