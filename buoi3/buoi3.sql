--1) Xem d? li?u c?a t?t c? c�c b?ng
select * from tacpham;
select * from docgia;
select * from muon;
select * from sach;

--3) C�c t�c ph?m (NT, t?a) c?a t�c gi? 'Guy de Maupassant'.
select nt, tua from tacpham
where tacgia = 'Guy de Maupassant';

--4) C�c ??c gi? s?ng ? ??a ch? '32 rue des Alouettes, 75003 Paris'.
select * from docgia
where dchi = '32 rue des Alouettes, 75003 Paris';

--5) T�m t�n nh� xu?t b?n c�c t�c ph?m bao g?m t? 'Fleur'
select sach.nxb from sach
join tacpham on tacpham.nt = sach.nt
where tacpham.tua like '%Fleur%';

--6) T�m t�n c�c t�c ph?m b?t ??u b?ng 'Le'
select tua from tacpham
where tua like 'Le %';

--7) T�m t�n c�c ??c gi? c� m??n s�ch trong trong kho?ng th?i gian t? ng�y 15/9/2007 ??n
--20/09/2007
select docgia.ten from docgia
join muon on muon.nd = docgia.nd
where ngaymuon between '09-15-2007' and '09-20-2007';

--8) Nh� xu?t b?n c?a t�c ph?m ti�u ?? 'Germinal'.
select DISTINCT sach.nxb from sach
join tacpham on tacpham.nt = sach.nt
where tacpham.tua like '%Germinal%';

--9) T�n ??c gi? ?� m??n t�c ph?m 'Po�sie'.
select ten from docgia
join muon on muon.nd = docgia.nd
join sach on sach.ns = muon.ns
join tacpham on tacpham.nt = sach.nt
where tacpham.tua like '%Po�e%';

--10) Nh?ng ??c gi? n�o ?� m??n t�c ph?m Les 'Fleurs du mal'
select ho, ten from docgia
join muon on muon.nd = docgia.nd
join sach on sach.ns = muon.ns
join tacpham on tacpham.nt = sach.nt
where tacpham.tua like '%Fleurs du mal%';

--11) T�m c�c t?a s�ch, t�n ??c gi? c?a c�c ??c gi? tr? s�ch qu� th?i h?n cho ph�p
select tacpham.tua, docgia.ten from docgia
join muon on muon.nd = docgia.nd
join sach on sach.ns = muon.ns
join tacpham on tacpham.nt = sach.nt
where muon.ngaytra > muon.hantra;

--12) T�m c�c t?a s�ch, t�n ??c gi? c?a c�c ??c gi? tr? s�ch tr??c th?i h?n
select DISTINCT tacpham.tua, docgia.ten from docgia
join muon on muon.nd = docgia.nd
join sach on sach.ns = muon.ns
join tacpham on tacpham.nt = sach.nt
where muon.ngaytra < muon.hantra;

--13) T�n ??c gi? ?� m??n t�c ph?m c?a 'Victor Hugo'
select distinct docgia.ten from docgia
join muon on muon.nd = docgia.nd
join sach on sach.ns = muon.ns
join tacpham on tacpham.nt = sach.nt
where tacpham.tacgia = 'Victor Hugo';

--14) T�n ??c gi? v� c�c t�c ph?m ?� ???c m??n n?m 2007
select DISTINCT tacpham.tua, docgia.ten from docgia
join muon on muon.nd = docgia.nd
join sach on sach.ns = muon.ns
join tacpham on tacpham.nt = sach.nt
where extract (year from ngaymuon) = 2007;

--PH?N C� H??NG D?N
--15) T�nh s? t�c ph?m c� trong th? vi?n.
select count(*) from tacpham;

--16) T?a c?a t�c ph?m m� c� �t nh?t hai quy?n s�ch
select tacpham.tua, count(tacpham.tua) from tacpham
join sach on sach.nt = tacpham.nt
group by tacpham.tua
having count(tacpham.tua) >= 2;

--17) T�nh S? t�c ph?m c?a m?i t�c gi?.
select tacpham.tacgia, count(tacpham.tacgia) from tacpham
group by tacpham.tacgia;

--18) T�nh S? s�ch c?a m?i t�c ph?m.
select tacpham.tua, count(tacpham.tua) soluong from sach
join tacpham on tacpham.nt = sach.nt
group by tacpham.tua;

--19) T�m s? l?n m??n s�ch c?a m?i ??c gi? theo n?m
select docgia.ten, EXTRACT(year from ngaymuon), count(EXTRACT(year from ngaymuon)) solanmuon from docgia
join muon on muon.nd = docgia.nd
group by docgia.ten, EXTRACT(year from ngaymuon)
order by docgia.ten;

--20) T�m t�n t�c ph?m c� �t nh?t 3 s�ch
select tacpham.tua, count(tacpham.tua) soluong from sach
join tacpham on tacpham.nt = sach.nt
group by tacpham.tua
having count(tacpham.tua) >= 3;

--21) T�m t�n t�c ph?m c� nhi?u s�ch nh?t
select tacpham.tua, count(tacpham.tua) soluong from sach
join tacpham on tacpham.nt = sach.nt
group by tacpham.tua
having count(tacpham.tua) = (select max( count(*) ) from sach group by sach.nt);

--22) T�n nh� xu?t b?n xu?t b?n nhi?u s�ch nh?t
select sach.nxb, count(sach.nxb) from sach
group by sach.nxb
having count(sach.nxb) = (select max(count(*)) from sach group  by sach.nxb);

--23) T�nh S? t�c gi? c� �t nh?t hai t�c ph?m
select sach.nxb, count(sach.nxb) from sach
group by sach.nxb
having count(sach.nxb) = (select min(count(*)) from sach group  by sach.nxb);

--24) T�m t?a t�c ph?m c� nhi?u ng??i m??n nh?t
select tacpham.tua, count(tacpham.tua) from tacpham
join sach on sach.nt = tacpham.nt
join muon on muon.ns = sach.ns
group by tacpham.tua
having count(tacpham.tua) = (select max(count(tacpham.tua)) from tacpham join sach on sach.nt = tacpham.nt
join muon on muon.ns = sach.ns group by tacpham.tua);

--25) T�m t?a t�c ph?m c� �t ng??i m??n nh?t
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

--26) T�m ??c gi? m??n nhi?u t�c ph?m nh?t
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

--27) T�m t�n ??c gi? m??n �t t�c ph?m nh?t
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

--28) T�m t�n t�c ph?m c� �t nh?t m?t quy?n s�ch kh�ng ai m??n
select distinct tacpham.tua from tacpham
join sach on tacpham.nt = sach.nt
left join muon on sach.ns = muon.ns
where muon.ns is null;

--29) T�m t�n t�c ph?m c� t?t c? c�c quy?n s�ch ??u ???c m??n
select distinct tacpham.tua from tacpham
join sach on tacpham.nt = sach.nt
left join muon on sach.ns = muon.ns
minus (select distinct tacpham.tua from tacpham
        join sach on tacpham.nt = sach.nt
        left join muon on sach.ns = muon.ns
        where muon.ns is null);

--30) T�m h? t�n ??c gi? ch?a m??n quy?n s�ch n�o
select distinct docgia.ho, docgia.ten from docgia
left join muon on muon.nd = docgia.nd
left join sach on sach.ns = muon.ns
where muon.ns is null;

--31) T�m th�ng tin v? nh� su?t b?n c?a quy?n s�ch m� ch?a ???c ai m??n
select * from sach
left join muon on sach.ns = muon.ns
where muon.nd is null;








