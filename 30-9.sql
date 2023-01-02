--subquery truy vấn con,truy vẫn lồng truy vấn
select * from SinhVien where
HocBong=(select MAX(hocbong) from SinhVien)

select * from (select * from SinhVien where PHAI= N'nữ')B--bảng mới tên: B
where HocBong>0
select * from  KetQua where
Diem=(select max(diem) from KetQua where LanThi=1 and MAMH='CSDL')

select * from SinhVien,KetQua
where SinhVien.MASV=KetQua.MASV

select*from SinhVien s full join
KetQua k on s.MASV=k.MASV

select * from 
(select top 2 * from SinhVien order by HocBong asc)A
union
select * from
(select top 2 * from SinhVien order by HocBong desc)B

