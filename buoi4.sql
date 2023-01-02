select * from Customers
where ContactTitle ='owner'
--* chọn tất cả thông tin 
select * from sinhvien
where HocBong >100000

select * from sinhvien
where PHAI =N'nữ' and HocBong>0

select * from sinhvien
where HocBong not in(100000,190000)

select * from sinhvien
where HocBong between 1000 and 170000

select * from sinhvien
where TENSV like 't%'

select * from sinhvien
where TENSV like '%y'

select * from sinhvien
where TENSV like '%t%'

select * , year (getdate())-year(ngaysinh) tuoi from SinhVien
where year (getdate())-year(ngaysinh)>21
--getdate() ngày tháng năm hiện tại
select 
GETDATE()

-- count min max
select count (masv) as dem  from SinhVien
select max (HocBong)  from SinhVien
select min (HocBong)  from SinhVien
select sum (HocBong)  from SinhVien
select avg (HocBong)  from SinhVien

select * from SinhVien
order by HocBong asc

select * from SinhVien
order by HocBong desc