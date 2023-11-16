create table KHOAHOC(
    MAKH varchar(10) primary key not null,
    TENKH varchar(50) not null,
    NGAYBD date not null,
    NGAYKT date not null,
    constraint CHECK_NGAY check (NGAYKT > NGAYBD)
);
create table CHUONGTRINH(
    MACT varchar(10) primary key not null,
    TENCT varchar(50) not null
);
create table LOAILOP(
    MALOAI varchar(10) primary key not null,
    MACT varchar(10) references CHUONGTRINH(MACT) not null,
    TENLOAI varchar(50) not null
);
create table LOP(
    MALOP varchar(10) primary key not null,
    MALOAI varchar(10) references LOAILOP(MALOAI) not null,
    TENLOP varchar(10) not null,
    SISO int not null,
    MAKH varchar(10) references KHOAHOC(MAKH) not null,
    constraint CHECK_SISO check (SISO > 12)
);
create table HOCVIEN(
    MAHV varchar(10) primary key not null,
    TENHV varchar(50) not null,
    GIOITINH int default 1,
    NGAYSINH date not null,
    SDT varchar(10) not null,
    DIACHI varchar(100) not null
);
alter table HOCVIEN
add constraint CHECK_GIOITINH check (GIOITINH = 1 OR GIOITINH = 0);
create table PHIEUTHU(
    SOPT varchar(10) primary key not null,
    MAHV varchar(10) references HOCVIEN(MAHV) not null,
    MALOP varchar(10) references LOP(MALOP) not null,
    NGAYLAPPHIEU date not null,
    THANHTIEN int not null
);
create table MONHOC(
    MAMH varchar(10) primary key not null,
    TENMH varchar(50) not null
)
create table DIEM(
    MAMH varchar(10) references MONHOC(MAMH) not null,
    MAHV varchar(10) references HOCVIEN(MAHV) not null,
    MALOP varchar(10) references LOP(MALOP) not null,
    DIEM int not null
);
alter table DIEM
add constraint MULTI_PRIMARYKEYS primary key (MAMH, MAHV, MALOP)
add constraint CHECK_DIEM check (DIEM >=0 AND DIEM <= 10);

insert all
    into KHOAHOC(MAKH, TENKH, NGAYBD, NGAYKT) values ('K001', 'Khóa 1', to_date('2020-01-10', 'yyyy-mm-dd'), to_date('2020-03-20', 'yyyy-mm-dd'))
    into KHOAHOC(MAKH, TENKH, NGAYBD, NGAYKT) values ('K002', 'Khóa 2', to_date('2020-02-28', 'yyyy-mm-dd'), to_date('2020-05-28', 'yyyy-mm-dd'))
    into KHOAHOC(MAKH, TENKH, NGAYBD, NGAYKT) values ('K003', 'Khóa 3', to_date('2020-04-10', 'yyyy-mm-dd'), to_date('2020-07-20', 'yyyy-mm-dd'))
    into KHOAHOC(MAKH, TENKH, NGAYBD, NGAYKT) values ('K004', 'Khóa 4', to_date('2020-06-15', 'yyyy-mm-dd'), to_date('2020-09-20', 'yyyy-mm-dd'))
select * from dual;
select * from KHOAHOC;

insert all
    into CHUONGTRINH(MACT, TENCT) VALUES ('CT007','Chứng chỉ tiếng anh 6 Bậc(A1, B1, B2, C1')
    into CHUONGTRINH(MACT, TENCT) VALUES ('CT006','Chương trình CamBrige')
    into CHUONGTRINH(MACT, TENCT) VALUES ('CT005','Tiếng Anh Ielts')
    into CHUONGTRINH(MACT, TENCT) VALUES ('CT004','Chương trình TOEIC')
    into CHUONGTRINH(MACT, TENCT) VALUES ('CT003','Tiếng Anh luyện kỹ năng')
    into CHUONGTRINH(MACT, TENCT) VALUES ('CT002','Tiếng Anh trẻ em')
    into CHUONGTRINH(MACT, TENCT) VALUES ('CT001','Tiếng Anh Tổng quát')
select * from dual;

insert all
    into LOAILOP(MALOAI, MACT, TENLOAI) values('LL001', 'CT001','Tiếng Anh căn bản')
    into LOAILOP(MALOAI, MACT, TENLOAI) values('LL002', 'CT001','Tiếng Anh A1')
    into LOAILOP(MALOAI, MACT, TENLOAI) values('LL003', 'CT001','Tiếng Anh A2')
    into LOAILOP(MALOAI, MACT, TENLOAI) values('LL004', 'CT001','Tiếng Anh B1')
    into LOAILOP(MALOAI, MACT, TENLOAI) values('LL005', 'CT001','Tiếng Anh B2')
    into LOAILOP(MALOAI, MACT, TENLOAI) values('LL006', 'CT001','Tiếng Anh C1')
select * from dual;

insert all
    INTO LOP(MALOP, MALOAI, TENLOP, SISO, MAKH) VALUES ('L001','LL001', 'Lớp 1', 30, 'K001')
    INTO LOP(MALOP, MALOAI, TENLOP, SISO, MAKH) VALUES ('L002','LL001', 'Lớp 2', 30, 'K001')
    INTO LOP(MALOP, MALOAI, TENLOP, SISO, MAKH) VALUES ('L003','LL002', 'Lớp 1', 25, 'K001')
select * from dual;

insert all
    into HOCVIEN(MAHV, TENHV, GIOITINH, NGAYSINH, SDT, DIACHI) values ('HV0001','Đỗ Bình An', 1, to_date('2000-11-02', 'yyyy-mm-dd'), '917217036','Cờ Đỏ - Cần Thơ')
    into HOCVIEN(MAHV, TENHV, GIOITINH, NGAYSINH, SDT, DIACHI) values ('HV0002','Đỗ Gia Bảo', 1, to_date('2000-12-02', 'yyyy-mm-dd'), '917217036','Ô Môn - Cần Thơ')
    into HOCVIEN(MAHV, TENHV, GIOITINH, NGAYSINH, SDT, DIACHI) values ('HV0003','Đỗ Phúc Vinh', 1, to_date('2000-11-02', 'yyyy-mm-dd'), '917217036','Cù Lao Dung - Cần Thơ')
    into HOCVIEN(MAHV, TENHV, GIOITINH, NGAYSINH, SDT, DIACHI) values ('HV0004','Thạch Chí Tâm', 1, to_date('2000-01-02', 'yyyy-mm-dd'), '917217036','Châu Thành - Cần Thơ')
    into HOCVIEN(MAHV, TENHV, GIOITINH, NGAYSINH, SDT, DIACHI) values ('HV0005','Lê Cẩm Giao', 0, to_date('2000-11-05', 'yyyy-mm-dd'), '917217036','Phong Điền - Cần Thơ')
    into HOCVIEN(MAHV, TENHV, GIOITINH, NGAYSINH, SDT, DIACHI) values ('HV0006','Huỳnh Gia Bảo', 1, to_date('2000-11-02', 'yyyy-mm-dd'), '917217036','Phong Điền - Cần Thơ')
select * from dual;

insert all 
    into PHIEUTHU(SOPT, MAHV, MALOP, NGAYLAPPHIEU, THANHTIEN) values ('PT000002','HV0002','L001',to_date('2021-06-01', 'yyyy-mm-dd'),135000)
    into PHIEUTHU(SOPT, MAHV, MALOP, NGAYLAPPHIEU, THANHTIEN) values ('PT000003','HV0003','L001',to_date('2021-06-01', 'yyyy-mm-dd'),135000)
    into PHIEUTHU(SOPT, MAHV, MALOP, NGAYLAPPHIEU, THANHTIEN) values ('PT000004','HV0004','L001',to_date('2021-06-01', 'yyyy-mm-dd'),135000)
    into PHIEUTHU(SOPT, MAHV, MALOP, NGAYLAPPHIEU, THANHTIEN) values ('PT000005','HV0005','L001',to_date('2021-06-01', 'yyyy-mm-dd'),135000)
    into PHIEUTHU(SOPT, MAHV, MALOP, NGAYLAPPHIEU, THANHTIEN) values ('PT000006','HV0006','L001',to_date('2021-06-01', 'yyyy-mm-dd'),135000)
    -- into PHIEUTHU(SOPT, MAHV, MALOP, NGAYLAPPHIEU, THANHTIEN) values ('PT000007','HV0007','L001',to_date('2021-06-01', 'yyyy-mm-dd'),135000)
select * from dual;

-- Câu 3: Dòng dữ liệu ('PT00008','HV0012','L001','06-02-2021',1350000) không thể thêm được vào bảng PHIEUTHU.
-- Vì trong bảng HOCVIEN chưa có học viên có mã là HV0012

-- Câu 4: Dòng dữ liệu ('L004','LL002','Lớp 4',10,'K001') không thể thêm được vào bảng LOP.
-- Vì SISO = 10 không thỏa ràng buộc của bảng là SISO > 12

-- Câu 5: delete from KHOAHOC where MAKH = 'K001';
-- Khóa học có mã 'K001' không thể xóa được. 
-- Vì MAKH = 'K001' là được tham chiếu từ bảng LOP 

-- Câu 6: delete from KHOAHOC where MAKH = 'K002';
-- Khóa học mã 'K002' có thể xóa được. Vì không có khóa ngoại nào tham chiếu tới nó

-- Câu 7: Giảm giá cột thành tiền của phiếu thu 000001 xuống 10%
UPDATE PHIEUTHU set THANHTIEN = THANHTIEN*0.9
where SOPT = 'PT000001'
-- Không có dòng nào được cập nhật vì chưa có phiếu thu nào có SOPT = 'PT000001'

-- Câu 8: Thêm vào quan hệ LOP cột hocphi
alter table LOP
add "HOCPHI" int;
-- cập nhật giá trị cho cột 
-- a) 1350000 cho loại lớp LL001
update LOP set HOCPHI = 1350000
where MALOAI = 'LL001';
-- b) 1650000 cho loại lớp LL002
update LOP set HOCPHI = 1650000
where MALOAI = 'LL002';

-- Câu 9: Tạo bảng HOCVIEN_NAM(MAHV,TENHV,SDT,NGAYSINH,DIACHI), chỉ bao gồm các
-- học viên giới tính nam (0)
-- 10. Lấy dữ liệu tự động từ bảng HOCVIEN thêm vào bảng HOCVIEN_NAM vừa tạo
-- Em gộp 2 câu làm chung
create table HOCVIEN_NAM
as (select MAHV, TENHV, SDT, NGAYSINH, DIACHI from HOCVIEN where GIOITINH = 0);

-- Câu 11: Bảng KHOAHOC không xóa được, vì cột MAKH được tham chiếu từ bảng LOP
drop table KHOAHOC

-- Câu 12: Bảng HOCVIEN_NAM có thể xóa được vì không có bảng nào tham chiếu tới nó.
drop table HOCVIEN_NAM

-- Câu 13: Đổi kiểu dữ liệu của cột tenMH trong bảng MONHOC thành VARCHAR(100)
alter table MONHOC
modify TENMH varchar(100);