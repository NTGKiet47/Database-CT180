--1) Xem d? li?u c?a t?t c? các b?ng
select * from tacpham;
select * from docgia;
select * from muon;
select * from sach;

--3) Các tác ph?m (NT, t?a) c?a tác gi? 'Guy de Maupassant'.
select nt, tua from tacpham
where tacgia = 'Guy de Maupassant';

--4) Các ??c gi? s?ng ? ??a ch? '32 rue des Alouettes, 75003 Paris'.
select * from docgia
where dchi = '32 rue des Alouettes, 75003 Paris';

--5) Tìm tên nhà xu?t b?n các tác ph?m bao g?m t? 'Fleur'
select sach.nxb from sach
join tacpham on tacpham.nt = sach.nt
where tacpham.tua like '%Fleur%';

--6) Tìm tên các tác ph?m b?t ??u b?ng 'Le'
select tua from tacpham
where tua like 'Le %';

--7) Tìm tên các ??c gi? có m??n sách trong trong kho?ng th?i gian t? ngày 15/9/2007 ??n
--20/09/2007
select docgia.ten from docgia
join muon on muon.nd = docgia.nd
where ngaymuon between '09-15-2007' and '09-20-2007';

--8) Nhà xu?t b?n c?a tác ph?m tiêu ?? 'Germinal'.
select DISTINCT sach.nxb from sach
join tacpham on tacpham.nt = sach.nt
where tacpham.tua like '%Germinal%';

--9) Tên ??c gi? ?ã m??n tác ph?m 'Poésie'.
select ten from docgia
join muon on muon.nd = docgia.nd
join sach on sach.ns = muon.ns
join tacpham on tacpham.nt = sach.nt
where tacpham.tua like '%Poï¿½e%';

--10) Nh?ng ??c gi? nào ?ã m??n tác ph?m Les 'Fleurs du mal'
select ho, ten from docgia
join muon on muon.nd = docgia.nd
join sach on sach.ns = muon.ns
join tacpham on tacpham.nt = sach.nt
where tacpham.tua like '%Fleurs du mal%';

--11) Tìm các t?a sách, tên ??c gi? c?a các ??c gi? tr? sách quá th?i h?n cho phép
select tacpham.tua, docgia.ten from docgia
join muon on muon.nd = docgia.nd
join sach on sach.ns = muon.ns
join tacpham on tacpham.nt = sach.nt
where muon.ngaytra > muon.hantra;

--12) Tìm các t?a sách, tên ??c gi? c?a các ??c gi? tr? sách tr??c th?i h?n
select DISTINCT tacpham.tua, docgia.ten from docgia
join muon on muon.nd = docgia.nd
join sach on sach.ns = muon.ns
join tacpham on tacpham.nt = sach.nt
where muon.ngaytra < muon.hantra;

--13) Tên ??c gi? ?ã m??n tác ph?m c?a 'Victor Hugo'
select distinct docgia.ten from docgia
join muon on muon.nd = docgia.nd
join sach on sach.ns = muon.ns
join tacpham on tacpham.nt = sach.nt
where tacpham.tacgia = 'Victor Hugo';

--14) Tên ??c gi? và các tác ph?m ?ã ???c m??n n?m 2007
select DISTINCT tacpham.tua, docgia.ten from docgia
join muon on muon.nd = docgia.nd
join sach on sach.ns = muon.ns
join tacpham on tacpham.nt = sach.nt
where extract (year from ngaymuon) = 2007;

--PH?N CÓ H??NG D?N
--15) Tính s? tác ph?m có trong th? vi?n.
select count(*) from tacpham;

--16) T?a c?a tác ph?m mà có ít nh?t hai quy?n sách
select tacpham.tua, count(tacpham.tua) from tacpham
join sach on sach.nt = tacpham.nt
group by tacpham.tua
having count(tacpham.tua) >= 2;

--17) Tính S? tác ph?m c?a m?i tác gi?.
select tacpham.tacgia, count(tacpham.tacgia) from tacpham
group by tacpham.tacgia;

--18) Tính S? sách c?a m?i tác ph?m.
select tacpham.tua, count(tacpham.tua) soluong from sach
join tacpham on tacpham.nt = sach.nt
group by tacpham.tua;

--19) Tìm s? l?n m??n sách c?a m?i ??c gi? theo n?m
select docgia.ten, EXTRACT(year from ngaymuon), count(EXTRACT(year from ngaymuon)) solanmuon from docgia
join muon on muon.nd = docgia.nd
group by docgia.ten, EXTRACT(year from ngaymuon)
order by docgia.ten;

--20) Tìm tên tác ph?m có ít nh?t 3 sách
select tacpham.tua, count(tacpham.tua) soluong from sach
join tacpham on tacpham.nt = sach.nt
group by tacpham.tua
having count(tacpham.tua) >= 3;

--21) Tìm tên tác ph?m có nhi?u sách nh?t
select tacpham.tua, count(tacpham.tua) soluong from sach
join tacpham on tacpham.nt = sach.nt
group by tacpham.tua
having count(tacpham.tua) = (select max( count(*) ) from sach group by sach.nt);

--22) Tên nhà xu?t b?n xu?t b?n nhi?u sách nh?t
select sach.nxb, count(sach.nxb) from sach
group by sach.nxb
having count(sach.nxb) = (select max(count(*)) from sach group  by sach.nxb);

--23) Tính S? tác gi? có ít nh?t hai tác ph?m
select sach.nxb, count(sach.nxb) from sach
group by sach.nxb
having count(sach.nxb) = (select min(count(*)) from sach group  by sach.nxb);

--24) Tìm t?a tác ph?m có nhi?u ng??i m??n nh?t
select tacpham.tua, count(tacpham.tua) from tacpham
join sach on sach.nt = tacpham.nt
join muon on muon.ns = sach.ns
group by tacpham.tua
having count(tacpham.tua) = (select max(count(tacpham.tua)) from tacpham join sach on sach.nt = tacpham.nt
join muon on muon.ns = sach.ns group by tacpham.tua);

--25) Tìm t?a tác ph?m có ít ng??i m??n nh?t
select tacpham.tua, count(tacpham.tua) from tacpham
join sach on sach.nt = tacpham.nt
join muon on muon.ns = sach.ns
group by tacpham.tua
having count(tacpham.tua) = (select min(count(tacpham.tua)) from tacpham 
                            join sach on sach.nt = tacpham.nt
                            join muon on muon.ns = sach.ns group by tacpham.tua);

--
--select docgia.ten, tacpham.tua from tacpham
--join sach on tacpham.nt = sach.nt
--join muon on sach.ns = muon.ns
--join docgia on docgia.nd = muon.nd;

--26) Tìm ??c gi? m??n nhi?u tác ph?m nh?t
select docgia.ho, docgia.ten, count(tacpham.nt) from docgia
join muon on docgia.nd = muon.nd
join sach on sach.ns = muon.ns
join tacpham on tacpham.nt = sach.nt
group by docgia.ho, docgia.ten
having count(tacpham.nt) = (select max(count(tacpham.nt)) from docgia
                            join muon on docgia.nd = muon.nd
                            join sach on sach.ns = muon.ns
                            join tacpham on tacpham.nt = sach.nt
                            group by docgia.ho, docgia.ten);

--27) Tìm tên ??c gi? m??n ít tác ph?m nh?t
select docgia.ho, docgia.ten, count(tacpham.nt) from docgia
join muon on docgia.nd = muon.nd
join sach on sach.ns = muon.ns
join tacpham on tacpham.nt = sach.nt
group by docgia.ho, docgia.ten
having count(tacpham.nt) = (select min(count(tacpham.nt)) from docgia
                            join muon on docgia.nd = muon.nd
                            join sach on sach.ns = muon.ns
                            join tacpham on tacpham.nt = sach.nt
                            group by docgia.ho, docgia.ten);

--28) Tìm tên tác ph?m có ít nh?t m?t quy?n sách không ai m??n
select distinct tacpham.tua from tacpham
join sach on tacpham.nt = sach.nt
left join muon on sach.ns = muon.ns
where muon.ns is null;

--29) Tìm tên tác ph?m có t?t c? các quy?n sách ??u ???c m??n
select distinct tacpham.tua from tacpham
join sach on tacpham.nt = sach.nt
left join muon on sach.ns = muon.ns
minus (select distinct tacpham.tua from tacpham
        join sach on tacpham.nt = sach.nt
        left join muon on sach.ns = muon.ns
        where muon.ns is null);

--30) Tìm h? tên ??c gi? ch?a m??n quy?n sách nào
select distinct docgia.ho, docgia.ten from docgia
left join muon on muon.nd = docgia.nd
left join sach on sach.ns = muon.ns
where muon.ns is null;

--31) Tìm thông tin v? nhà su?t b?n c?a quy?n sách mà ch?a ???c ai m??n
select * from sach
left join muon on sach.ns = muon.ns
where muon.nd is null;








