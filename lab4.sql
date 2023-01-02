-- câu 4
update MonHoc
set SoTiet= 45
where TenMH = N'cơ sở dữ liệu'
select * from MonHoc


--câu 5
update SinhVien
set PHAI = N'nam',HOSV = N'lên kim',TENSV =N'lân'
where TENSV = 'lan'
select * from SinhVien

--câu 6
select *from SinhVien
update SinhVien
set HocBong = HocBong*1.2
where MAKH = 'MANG'

--câu 8
update Sinhvien 
set diemtb=(SELECT AVG(diem) from ketqua where MASV='SV01' and LANTHI=1) 
where MASV='SV01'
select *from SinhVien

-- câu 7
alter table ketqua
drop column kq

select *from KetQua

--câu 9
update Sinhvien
set diemtb=(SELECT AVG(diem) from ketqua where LanThi=(select min(LanThi) from KetQua where  MASV = Sinhvien.MASV) and MASV = Sinhvien.MASV) 

select *from SinhVien

--câu 10
update SinhVien
set DiemTB=(select AVG(diem) from KetQua 
where LanThi=(select max(LanThi) from KetQua where  MASV = Sinhvien.MASV ) and MASV = Sinhvien.MASV 
and mamh = (select MaMH from MonHoc where MonHoc.MAMH  = MAMH)) 

select *from KetQua
select *from SinhVien
select * from MonHoc

--câu 11


delete SinhVien
where HocBong =0
-- không xóa được vì nếu muốn xóa sinh viên không có học bổng thì phải xóa luôn kq ở bảng điểm



--câu 12 
select MASV,HOSV,TENSV,HocBong
from SinhVien
order by MASV  asc

-- câu 13 
select MASV,HOSV,TENSV,PHAI,NgaySinh,NoiSinh,MAKH,HocBong
from SinhVien
order by PHAI  asc,TENSV asc

--câu 15
select MAMH,TenMH,SoTiet
From MonHoc
Where TenMH like N't%'
Select *From MonHoc

--câu 16
select HOSV,TENSV,HocBong from SinhVien
where HocBong <=160000 and NoiSinh = N'tpHCM'

-- câu 17
SELECT MASV, MAKH 
FROM Sinhvien 
WHERE MAKH = 'HTTT' OR MAKH = 'CNPM'

-- câu 18
select MASV, NgaySinh, NoiSinh, HocBong from SinhVien
where NgaySinh between '1991-01-01' and '1992-06-05'

-- câu19
SELECT (HOSV +' '+ TENSV) AS TENSV, TENKH FROM dbo.Sinhvien RIGHT JOIN dbo.Khoa
ON Khoa.MAKH = Sinhvien.MAKH

-- câu 20
select MASV, HOSV, TENSV, NgaySinh from SinhVien
where month(ngaysinh)=12 and NoiSinh=N'tpHCM'

--câu 21
SELECT HOSV,TENSV,YEAR(GETDATE()) -YEAR(NGAYSINH) tuoi,HOCBONG 
FROM Sinhvien WHERE YEAR(GETDATE()) -YEAR(NGAYSINH) > 20

-- câu 22
alter table SinhVien
add  MucHocBong nvarchar(50);

select masv'Mã sinh viên',phai'Phái',MAKH 'Mã khoa','Mức học bổng'=case when hocbong>150000 then N'Học bổng cao' else N' Mức trung bình' end
from SinhVien
--câu 23
update KetQua
set KQ = 'Đ'
where Diem >=5

update KetQua
set KQ = 'k'
where Diem <5

select HOSV,TENSV,MAMH,LanThi,Diem,KQ from SinhVien,KetQua

--câu 24
select count (masv)  SoLuongSV  from SinhVien

--câu 25
select count (PHAI)  SoLuongSVNu  from SinhVien
where PHAI=N'nữ'

--câu 26
select SUM (HocBong) TongHocBong from SinhVien

--câu 9


