--1. Th�m kh�a ch�nh cho c�c b?ng ?� cho
ALTER table NGUOI_AN
ADD CONSTRAINT TEN PRIMARY KEY (TEN);

ALTER table LUI_TOI
ADD CONSTRAINT TENQUANPIZZA PRIMARY KEY (TEN, QUANPIZZA);

ALTER table AN
ADD CONSTRAINT TENPIZZA PRIMARY KEY (TEN, PIZZA);

ALTER tablE PHUC_VU
ADD CONSTRAINT PIZZA_GIA PRIMARY KEY (QUANPIZZA, PIZZA, GIA);

ALTER TABLE LUI_TOI
ADD CONSTRAINT FK_TEN FOREIGN KEY(TEN) REFERENCES NGUOI_AN(TEN);

ALTER TABLE PHUC_VU
ADD CONSTRAINT GIA_LON_HON0 CHECK (GIA > 0);
--2. Cho bi?t qu�n �Pizza Hut� ?� ph?c v? c�c b�nh pizza n�o ?


SELECT DISTINCT QUANPIZZA, AN.PIZZA FROM AN
JOIN LUI_TOI ON LUI_TOI.TEN = AN.TEN
ORDER BY QUANPIZZA;
--3. Danh s�ch c�c b�nh pizza m� c�c qu�n c� b�n ?
SELECT * FROM PHUC_VU;

--4. Cho bi?t t�n c�c qu�n c� ph?c v? c�c b�nh pizza m� t�n g?m ch? �m�
SELECT QUANPIZZA FROM PHUC_VU
WHERE PIZZA LIKE '%m%';

--5. T�m t�n v� tu?i c?a ng??i ?n ?� ??n qu�n �Dominos�, s?p x?p k?t qu? gi?m d?n theo
--tu?i?
SELECT * FROM NGUOI_AN
JOIN LUI_TOI ON LUI_TOI.TEN = NGUOI_AN.TEN
WHERE LUI_TOI.QUANPIZZA = 'Dominos'
ORDER BY NGUOI_AN.TUOI DESC;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

--6. T�m t�n qu�n pizza v� s? b�nh pizza m� m?i qu�n ph?c v? ?
SELECT DISTINCT QUANPIZZA,COUNT (AN.PIZZA) FROM AN
JOIN LUI_TOI ON LUI_TOI.TEN = AN.TEN
GROUP BY QUANPIZZA;

--7. T�m t�n nh?ng qu�n pizza ph?c v? pizza v?i gi� cao nh?t ?
SELECT DISTINCT QUANPIZZA FROM PHUC_VU
WHERE GIA >= ALL(SELECT GIA FROM PHUC_VU);

--8. T�m t�n c�c qu�n c� ph?c v? �t nh?t m?t b�nh pizza m� �Ian� th�ch ?n ?
SELECT DISTINCT PHUC_VU.QUANPIZZA FROM PHUC_VU
JOIN LUI_TOI ON LUI_TOI.QUANPIZZA = PHUC_VU.QUANPIZZA
JOIN AN ON AN.TEN = LUI_TOI.TEN
WHERE LUI_TOI.TEN = 'Ian';

--9. T�m t�n c�c qu�n c� ph?c v? �t nh?t m?t b�nh m� �Eli� kh�ng th�ch ?
SELECT DISTINCT PHUC_VU.QUANPIZZA FROM PHUC_VU
WHERE PHUC_VU.PIZZA NOT IN (SELECT DISTINCT PHUC_VU.QUANPIZZA FROM PHUC_VU
                        JOIN LUI_TOI ON LUI_TOI.QUANPIZZA = PHUC_VU.QUANPIZZA
                        JOIN AN ON AN.TEN = LUI_TOI.TEN
                        WHERE LUI_TOI.TEN = 'Eli');

--10. T�m t�n c�c qu�n ch? ph?c v? c�c b�nh m� �Eli� th�ch ?
SELECT DISTINCT PHUC_VU.QUANPIZZA FROM PHUC_VU
WHERE PHUC_VU.QUANPIZZA NOT IN (SELECT DISTINCT QUANPIZZA FROM PHUC_VU
                            WHERE PIZZA NOT IN (SELECT PIZZA FROM AN
                            WHERE TEN = 'Eli'));

--11. T�n qu�n c� ph?c v? b�nh v?i gi� l?n h?n t?t c? b�nh ph?c v? b?i qu�n �New York
--Pizza�
SELECT DISTINCT QUANPIZZA FROM PHUC_VU
WHERE GIA > ALL (SELECT GIA FROM PHUC_VU
                WHERE QUANPIZZA = 'New York Pizza');

--12. T�m t�n c�c qu�n ch? ph?c v? c�c b�nh c� gi� nh? h?n 10 ?
SELECT DISTINCT QUANPIZZA FROM PHUC_VU
WHERE QUANPIZZA NOT IN (SELECT DISTINCT QUANPIZZA FROM PHUC_VU
                    WHERE GIA >= 10);

--13. T�m t�n b�nh ???c ph?c v? b?i qu�n �New York Pizza� v� qu�n �Dominos�
SELECT PIZZA FROM PHUC_VU WHERE QUANPIZZA = 'New York Pizza'
INTERSECT
SELECT PIZZA FROM PHUC_VU WHERE QUANPIZZA = 'Dominos';

--14. T�m t�n b�nh ???c ph?c v? b?i qu�n �Little Caesars� v� kh�ng ph?c v? b?i qu�n 'Pizza
--Hut'
SELECT PIZZA FROM PHUC_VU WHERE QUANPIZZA = 'Little Caesars'
MINUS
SELECT PIZZA FROM PHUC_VU WHERE QUANPIZZA = 'Pizza Hut';

--15. T�m t�n c�c qu�n c� ph?c v? t?t c? c�c lo?i b�nh pizza?
CREATE TABLE DS_PIZZA AS (SELECT DISTINCT PIZZA FROM PHUC_VU);
--SELECT * FROM ds_pizza;
SELECT QUANPIZZA,COUNT(*) FROM PHUC_VU
GROUP BY QUANPIZZA
HAVING  COUNT(PIZZA) = (SELECT COUNT(PIZZA) FROM DS_PIZZA);

DROP TABLE DS_PIZZA;

--16. T�n qu�n ph?c v? �t nh?t 2 b�nh pizza m� �Gus� th�ch ?
SELECT DISTINCT QUANPIZZA, COUNT(PHUC_VU.PIZZA) FROM PHUC_VU 
JOIN AN ON PHUC_VU.PIZZA = AN.PIZZA
WHERE TEN = 'Gus'
GROUP BY PHUC_VU.QUANPIZZA
HAVING COUNT(PHUC_VU.PIZZA) >= 2;

--17. T�m t�n c�c qu�n c� ph?c v? t?t c? c�c b�nh m� �Ian� th�ch
SELECT DISTINCT QUANPIZZA, COUNT(B1.PIZZA) FROM PHUC_VU
LEFT JOIN (SELECT PIZZA FROM AN WHERE TEN = 'Ian') B1 ON B1.PIZZA = PHUC_VU.PIZZA
WHERE B1.PIZZA IS NOT NULL
GROUP BY QUANPIZZA 
HAVING COUNT(B1.PIZZA) = 2
ORDER BY QUANPIZZA;

--18. T�n ng??i ?n lui t?i �t nh?t 3 qu�n?
select distinct ten from an 
join phuc_vu on phuc_vu.pizza = an.pizza
group by ten
having count(quanpizza) >= 3;

--19. T�nh s? lo?i pizza m� m?i qu�n c� b�n ?
select quanpizza, count(pizza) from phuc_vu
group by quanpizza;

--20. T�m t�n ng??i ?n th�ch c�c b�nh �t nh?t l� gi?ng c�c b�nh m� Hil th�ch ?
SELECT * FROM AN WHERE TEN = 'Hil';

SELECT TEN FROM AN
JOIN (SELECT PIZZA FROM AN WHERE TEN = 'Hil') B1 ON B1.PIZZA = AN.PIZZA
WHERE TEN <> 'Hil'
GROUP BY AN.TEN
HAVING COUNT(AN.PIZZA) >= 2;
