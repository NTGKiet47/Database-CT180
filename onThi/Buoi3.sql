CREATE TABLE TACPHAM(
	NT 		smallint primary key ,
	tua 		varchar(150),
	tacgia 		varchar(100)
) ;
CREATE TABLE DOCGIA (
	ND		smallint PRIMARY KEY ,
	ho		VARCHAR(30),
	ten		VARCHAR(30),
	dchi	VARCHAR(100),
	tel		CHAR(10)
) ;

CREATE TABLE SACH (
	NS		smallint primary key ,
	nxb		varchar(50),
	NT		smallint not null, 
 	foreign key(NT) references TACPHAM(NT)
);

CREATE TABLE MUON (
	NS		smallint not NULL, 
	foreign key(NS) references SACH(NS),
	ngaymuon	date not NULL,
	hantra	date not null,
	ngaytra 	date,
	ND		smallint not null, 
	foreign key(ND) references DOCGIA(ND),
	primary key 	(NS, ngaymuon)
) ;

INSERT INTO TACPHAM VALUES (1,'Les miserables','Victor Hugo');
INSERT INTO TACPHAM VALUES (2,'Germinal ','Emile Zola');
INSERT INTO TACPHAM VALUES (3,'Madame Bovary','Gustave Flaubert');
INSERT INTO TACPHAM VALUES (4,'Les Fleurs du mal','Charles Baudelaire');
INSERT INTO TACPHAM VALUES (5,'La Bete Humaine','Emile Zola');
INSERT INTO TACPHAM VALUES (6,'Le Pere Goriot ','Honore de Balzac');
INSERT INTO TACPHAM VALUES (7,'Le Rouge et le Noir','Stendhal');
INSERT INTO TACPHAM VALUES (8,'Une vie','Guy de Maupassant');
INSERT INTO TACPHAM VALUES (9,'Ubu Roi','Alfred Jarry');
INSERT INTO TACPHAM VALUES (10,'Po?e','Arthur Rimbaud');
INSERT INTO TACPHAM VALUES (11,'La Mare au Diable','George Sand');
INSERT INTO TACPHAM VALUES (12,'Carmen','Prosper Merimee');
INSERT INTO TACPHAM VALUES (13,'Lettres de mon moulin','Alphonse Daudet');
INSERT INTO TACPHAM VALUES (14,'Les contes du chat perch�', 'Marcel Ayme');
INSERT INTO TACPHAM VALUES (15,'La Peste','Albert Camus');
INSERT INTO TACPHAM VALUES (16,'Le petit prince','Antoine de St Exupery');


INSERT INTO DOCGIA VALUES (1,'Lecoeur','Jeanette','16 rue de la R?blique, 75010 Paris','0145279274');
INSERT INTO DOCGIA VALUES (2,'Lecoeur','Philippe','16 rue de la R?blique, 75010 Paris','0145279274');
INSERT INTO DOCGIA VALUES (3,'Dupont','Yvan','73 rue Lamarck, 75018 Paris','0163538294');
INSERT INTO DOCGIA VALUES (4,'Mercier','Claude','155 avenue Parmentier, 75011 Paris','0136482736');
INSERT INTO DOCGIA VALUES (5,'L?r','Marc','90 avenue du Maine, 75014 Paris','0164832947');
INSERT INTO DOCGIA VALUES (6,'Martin','Laure','51 boulevard Diderot, 75012 Paris','0174693277');
INSERT INTO DOCGIA VALUES (7,'Crozier','Martine','88 rue des Portes Blanches, 75018 Paris','0146829384');
INSERT INTO DOCGIA VALUES (8,'Lebon','Cl?nt','196 boulevard de Sebastopol, 75001 Paris','0132884739');
INSERT INTO DOCGIA VALUES (9,'Dufour','Jacques','32 rue des Alouettes, 75003 Paris','0155382940');
INSERT INTO DOCGIA VALUES (10,'Dufour','Antoine','32 rue des Alouettes, 75003 Paris','0155382940');
INSERT INTO DOCGIA VALUES (11,'Dufour','St?anie','32 rue des Alouettes, 75003 Paris','0155382940');
INSERT INTO DOCGIA VALUES (12,'Raymond','Carole','35 rue Oberkampf, 75011 Paris','0153829402');
INSERT INTO DOCGIA VALUES (13,'Durand','Albert','4 rue Mandar, 75002 Paris','0642374021');
INSERT INTO DOCGIA VALUES (14,'Wilson','Paul','12 rue Paul Vaillant Couturier, 92400 Montrouge','0642327407');
INSERT INTO DOCGIA VALUES (15,'Grecault','Philippe','15 rue de la Roquette, 75012 Paris','0132762983');
INSERT INTO DOCGIA VALUES (16,'Carre','St?ane','51 boulevard Diderot, 75012 Paris','0174693277');
INSERT INTO DOCGIA VALUES (17,'Johnson','Astrid','3 rue L? Blum, 75002 Paris','0143762947');
INSERT INTO DOCGIA VALUES (18,'Mirou','Caroline','2 square Mirabeau, 75011 Paris','0163827399');
INSERT INTO DOCGIA VALUES (19,'Espelette','Jean-Jacques','141 avenue de France, 75019 Paris','0134887264');
INSERT INTO DOCGIA VALUES (20,'Despentes','Anthony','56 boulevard de la Villette, 75019 Paris','0133889463');
INSERT INTO DOCGIA VALUES (21,'Terlu','V?nique','45 rue des Batignolles, 75020 Paris','0165998372');
INSERT INTO DOCGIA VALUES (22,'Rihour','C?le','7 rue Montorgueil, 75002 Paris','0166894754');
INSERT INTO DOCGIA VALUES (23,'Franchet','Pierre','160 rue Montmartre, 75009 Paris','0633628549');
INSERT INTO DOCGIA VALUES (24,'Trochet','Ernest','34 rue de l''Esperance, 75008 Paris','0638295563');
INSERT INTO DOCGIA VALUES (25,'Gainard','Simon','55 rue Desnouettes, 75015 Paris','0174928934');
INSERT INTO DOCGIA VALUES (26,'Touche','Johanna','14 rue du Bac, 75006 Paris','0619384065');
INSERT INTO DOCGIA VALUES (27,'Cornu','Sylvain','22 rue Mouffetard, 75005 Paris','0184927489');
INSERT INTO DOCGIA VALUES (28,'Frederic','Cyril','15 rue du Simplon, 75018 Paris','0173625492');
INSERT INTO DOCGIA VALUES (29,'Crestard','Cedric','5 rue Doudeauville, 75018 Paris','0629485700');
INSERT INTO DOCGIA VALUES (30,'Le Bihan','Karine','170 bis rue Ordener, 75018 Paris','0638995221');


INSERT INTO SACH VALUES (1,'GF',1);
INSERT INTO SACH VALUES (2,'FOLIO',2);
INSERT INTO SACH VALUES (3,'HACHETTE',3);
INSERT INTO SACH VALUES (4,'GF',4);
INSERT INTO SACH VALUES (5,'FOLIO',5);
INSERT INTO SACH VALUES (6,'FOLIO',6);
INSERT INTO SACH VALUES (7,'GF',7);
INSERT INTO SACH VALUES (8,'FOLIO',8);
INSERT INTO SACH VALUES (9,'HACHETTE',9);
INSERT INTO SACH VALUES (10,'GF',10);
INSERT INTO SACH VALUES (11,'HACHETTE',11);
INSERT INTO SACH VALUES (12,'FOLIO',12);
INSERT INTO SACH VALUES (13,'GF',13);
INSERT INTO SACH VALUES (14,'FOLIO',14);
INSERT INTO SACH VALUES (15,'HACHETTE',15);
INSERT INTO SACH VALUES (16,'HACHETTE',16);
INSERT INTO SACH VALUES (17,'GF',1);
INSERT INTO SACH VALUES (18,'FOLIO',2);
INSERT INTO SACH VALUES (19,'HACHETTE',2);
INSERT INTO SACH VALUES (20,'FOLIO',4);
INSERT INTO SACH VALUES (21,'GF',5);
INSERT INTO SACH VALUES (22,'HACHETTE',4);
INSERT INTO SACH VALUES (23,'HACHETTE',7);
INSERT INTO SACH VALUES (24,'FOLIO',8);
INSERT INTO SACH VALUES (25,'GF',1);
INSERT INTO SACH VALUES (26,'HACHETTE',10);
INSERT INTO SACH VALUES (27,'FOLIO',11);
INSERT INTO SACH VALUES (28,'FOLIO',12);
INSERT INTO SACH VALUES (29,'GF',1);
INSERT INTO SACH VALUES (30,'HACHETTE',14);

INSERT INTO MUON VALUES (1,'9-2-2007','9-16-2007','9-7-2007',1);
INSERT INTO MUON VALUES (1,'10-1-2006','10-15-2006','10-11-2006',26);
INSERT INTO MUON VALUES (1,'6-14-2007','6-28-2007','6-19-2007',2);

INSERT INTO MUON VALUES (1,'4-27-2007','5-11-2007','5-8-2007',3);
INSERT INTO MUON VALUES (2,'8-23-2007','9-6-2007','9-2-2007',4);
INSERT INTO MUON VALUES (2,'10-6-2007','10-20-2007', NULL,28);

INSERT INTO MUON VALUES (9,'10-6-2007','10-20-2007', NULL,28);
INSERT INTO MUON VALUES (3,'9-9-2007','9-23-2007','9-13-2007',3);
INSERT INTO MUON VALUES (4,'2-8-2007','2-22-2007','2-12-2007',12);
INSERT INTO MUON VALUES (4,'2-7-2006','2-21-2006','2-20-2006',4);

INSERT INTO MUON VALUES (4,'6-17-2007','7-1-2007','6-27-2007',5);
INSERT INTO MUON VALUES (5,'10-4-2007','10-19-2007', NULL,16);
INSERT INTO MUON VALUES (6,'3-11-2007','3-25-2007','3-16-2007',3);

INSERT INTO MUON VALUES (8,'7-14-2007','7-28-2007','7-20-2007',18);
INSERT INTO MUON VALUES (8,'3-9-2007','3-23-2007','3-27-2007',13);

INSERT INTO MUON VALUES (10,'4-11-2007','4-25-2007','4-23-2007',8);
INSERT INTO MUON VALUES (10,'1-27-2006','2-10-2006','1-31-2006',7);
INSERT INTO MUON VALUES (11,'10-1-2007','10-15-2007', NULL,22);

INSERT INTO MUON VALUES (12,'3-3-2003','3-17-2003','3-13-2003',7);
INSERT INTO MUON VALUES (14,'10-2-2007','10-16-2007', NULL,1);
INSERT INTO MUON VALUES (15,'5-4-2007','5-18-2007','5-12-2007',10);

INSERT INTO MUON VALUES (16,'10-5-2007','10-19-2007', NULL,2);
INSERT INTO MUON VALUES (18,'7-4-2007','7-18-2007','7-11-2007',3);
INSERT INTO MUON VALUES (20,'12-17-2006','12-31-2006','12-17-2006',27);

INSERT INTO MUON VALUES (20,'9-6-2007','9-20-2007','9-22-2007',9);
INSERT INTO MUON VALUES (21,'9-7-2007','9-21-2007','9-19-2007',14);
INSERT INTO MUON VALUES (24,'2-14-2007','2-28-2007','2-20-2007',26);
INSERT INTO MUON VALUES (25,'8-19-2006','9-2-2006','9-3-2006',1);
INSERT INTO MUON VALUES (26,'11-15-2006','11-29-2006','11-22-2006',9);
INSERT INTO MUON VALUES (29,'9-20-2007','10-4-2007', NULL,27);

--PH?N T? LUY?N
--1) Xem d? li?u c?a t?t c? c�c b?ng
SELECT * from DOCGIA;
SELECT * FROM MUON;
SELECT * FROM SACH;
SELECT * FROM TACPHAM;
--2) V? s? ?? li�n th�ng
--3) C�c t�c ph?m (NT, t?a) c?a t�c gi? 'Guy de Maupassant'.
select * from TACPHAM WHERE TACGIA = 'Guy de Maupassant';
--4) C�c ??c gi? s?ng ? ??a ch? '32 rue des Alouettes, 75003 Paris'.
select * from docgia where dchi = '32 rue des Alouettes, 75003 Paris';
--5) T�m t�n nh� xu?t b?n c�c t�c ph?m bao g?m t? 'Fleur'
select distinct nxb from tacpham
join sach on sach.nt = tacpham.nt
where tua like '%Fleur%';
--6) T�m t�n c�c t�c ph?m b?t ??u b?ng 'Le'
select tua from tacpham
where tua like '%Le %';
--7) T�m t�n c�c ??c gi? c� m??n s�ch trong trong kho?ng th?i gian t? ng�y 15/9/2007 ??n
--20/09/2007
select * from docgia 
join muon on muon.nd = docgia.nd
where ngaymuon between '09/15/2007' and '09/20/2007';
--8) Nh� xu?t b?n c?a t�c ph?m ti�u ?? 'Germinal'.
select * from sach 
join tacpham on sach.nt = tacpham.nt
where tacpham.tua like '%Germinal%';
--9) T�n ??c gi? ?� m??n t�c ph?m 'Po�sie'.
select distinct docgia.ten from docgia 
join muon on muon.nd = docgia.nd
join sach on sach.ns = muon.ns
join tacpham on tacpham.nt = sach.nt
where tua like '%Po?e%';
--10) Nh?ng ??c gi? n�o ?� m??n t�c ph?m Les 'Fleurs du mal'
select distinct docgia.ten from docgia 
join muon on muon.nd = docgia.nd
join sach on sach.ns = muon.ns
join tacpham on tacpham.nt = sach.nt
where tua like '%Fleurs du mal%';
--11) T�m c�c t?a s�ch, t�n ??c gi? c?a c�c ??c gi? tr? s�ch qu� th?i h?n cho ph�p
select tua TuaSach, ten TenDocGia from muon
join docgia on docgia.nd = muon.nd
join sach on sach.ns = muon.ns
join tacpham on tacpham.nt = sach.nt
where ngaytra > hantra;
--12) T�m c�c t?a s�ch, t�n ??c gi? c?a c�c ??c gi? tr? s�ch tr??c th?i h?n
select distinct tua TuaSach, ten TenDocGia from muon
join docgia on docgia.nd = muon.nd
join sach on sach.ns = muon.ns
join tacpham on tacpham.nt = sach.nt
where ngaytra < hantra;
--13) T�n ??c gi? ?� m??n t�c ph?m c?a 'Victor Hugo'
select distinct docgia.ten TenDocGia from docgia
join muon on muon.nd = docgia.nd
join sach on sach.ns = muon.ns
join tacpham on tacpham.nt = sach.nt
where tacgia like '%Victor Hugo%';
--14) T�n ??c gi? v� c�c t�c ph?m ?� ???c m??n n?m 2007
select distinct docgia.ten TenDocGia, tacpham.tua TuaTacPham from docgia
join muon on muon.nd = docgia.nd
join sach on sach.ns = muon.ns
join tacpham on tacpham.nt = sach.nt
where (extract ( year from muon.ngaymuon)) = 2007;
--PH?N C� H??NG D?N
--15) T�nh s? t�c ph?m c� trong th? vi?n.
select count(*) SoTacPham from tacpham;
--16) T?a c?a t�c ph?m m� c� �t nh?t hai quy?n s�ch.
select tua, count(tua) as soQuyenSach from sach
join tacpham on tacpham.nt = sach.nt
group by tua
having count(tua) >= 2;
--17) T�nh S? t�c ph?m c?a m?i t�c gi?.
select tacgia, count(*) SoTacPham from tacpham
group by tacgia;
--18) T�nh S? s�ch c?a m?i t�c ph?m.
select tua, count(tua) as soQuyenSach from sach
join tacpham on tacpham.nt = sach.nt
group by tua;
--19) T�m s? l?n m??n s�ch c?a m?i ??c gi? theo n?m
select docgia.ten TenDocGia, count(*) from muon 
join docgia on docgia.nd = muon.nd
group by docgia.ten;
--20) T�m t�n t�c ph?m c� �t nh?t 3 s�ch
select tua, count(tua) as soQuyenSach from sach
join tacpham on tacpham.nt = sach.nt
group by tua
having count(tua) >= 3;
--21) T�m t�n t�c ph?m c� nhi?u s�ch nh?t
select tua, count(tua) as soQuyenSach from sach
join tacpham on tacpham.nt = sach.nt
group by tua
having count(tua) = (select max(count(tua)) as soQuyenSach from sach
                            join tacpham on tacpham.nt = sach.nt
                            group by tua);
--22) T�n nh� xu?t b?n xu?t b?n nhi?u s�ch nh?t
select nxb, count(nt) from sach
group by nxb
having count(*) >= (select max(count(nt)) from sach
                    group by nxb);  
--23) T�nh S? t�c gi? c� �t nh?t hai t�c ph?m
select count(*) from (
                        select tacgia, count(tua) from tacpham
                        group by tacgia
                        having count(tua) >= 2);

--24) T�m t?a t�c ph?m c� nhi?u ng??i m??n nh?t
--25) T�m t?a t�c ph?m c� �t ng??i m??n nh?t
--26) T�m ??c gi? m??n nhi?u t�c ph?m nh?t
--27) T�m t�n ??c gi? m??n �t t�c ph?m nh?t
--28) T�m t�n t�c ph?m c� �t nh?t m?t quy?n s�ch kh�ng ai m??n
--29) T�m t�n t�c ph?m c� t?t c? c�c quy?n s�ch ??u ???c m??n
--30) T�m h? t�n ??c gi? ch?a m??n quy?n s�ch n�o
--31) T�m th�ng tin v? nh� su?t b?n c?a quy?n s�ch m� ch?a ???c ai m??n
