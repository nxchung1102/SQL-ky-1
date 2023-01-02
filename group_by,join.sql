select NoiSinh, COUNT(noisinh) from SinhVien
group by NoiSinh

select PHAI, COUNT(PHAI) demSL from SinhVien
group by  PHAI
select * from KetQua
select MASV,AVG(diem)diemTB from dbo.KetQua
where LanThi=1 
group by MASV
having AVG(diem) >5

select * from SinhVien
join Khoa 
on SinhVien.MAKH=Khoa.MAKH

select * from KetQua
join MonHoc
on KetQua.MAMH=MonHoc.MAMH

select * from SinhVien
left join KetQua
on SinhVien.MASV=KetQua.MASV
--câu 18
select * from SinhVien
full join Khoa 
on SinhVien.MAKH=Khoa.MAKH

select * from SinhVien
left join KetQua
on SinhVien.MASV=KetQua.MASV
where KQ is null;

select *,
case when diemTB<5 then 'yeu' 
when DiemTB>5 then 'dat' end as xeploai from sinhvien

select HOSV,TENSV,MAMH,LanThi,Diem,KQ, 
case when diem<5 then 'k'
when diem>=5 then 'd' end KQ  from KetQua,SinhVien

select* from Khoa

 
 select SinhVien.NoiSinh,COUNT(noisinh) soSVDangtheohoc from SinhVien
 group by NoiSinh

 select MAKH,SUM(hocbong) tongHB from SinhVien
 group by MAKH
 
 select Khoa.MAKH from Khoa
group by MAKH
