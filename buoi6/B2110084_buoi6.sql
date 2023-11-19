--1. Thêm khóa chính cho các b?ng ?ã cho
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
--2. Cho bi?t quán ‘Pizza Hut’ ?ã ph?c v? các bánh pizza nào ?


SELECT DISTINCT QUANPIZZA, AN.PIZZA FROM AN
JOIN LUI_TOI ON LUI_TOI.TEN = AN.TEN
ORDER BY QUANPIZZA;
--3. Danh sách các bánh pizza mà các quán có bán ?
SELECT * FROM PHUC_VU;

--4. Cho bi?t tên các quán có ph?c v? các bánh pizza mà tên g?m ch? ‘m’
SELECT QUANPIZZA FROM PHUC_VU
WHERE PIZZA LIKE '%m%';

--5. Tìm tên và tu?i c?a ng??i ?n ?ã ??n quán ‘Dominos’, s?p x?p k?t qu? gi?m d?n theo
--tu?i?
SELECT * FROM NGUOI_AN
JOIN LUI_TOI ON LUI_TOI.TEN = NGUOI_AN.TEN
WHERE LUI_TOI.QUANPIZZA = 'Dominos'
ORDER BY NGUOI_AN.TUOI DESC;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   

--6. Tìm tên quán pizza và s? bánh pizza mà m?i quán ph?c v? ?
SELECT DISTINCT QUANPIZZA,COUNT (AN.PIZZA) FROM AN
JOIN LUI_TOI ON LUI_TOI.TEN = AN.TEN
GROUP BY QUANPIZZA;

--7. Tìm tên nh?ng quán pizza ph?c v? pizza v?i giá cao nh?t ?
SELECT DISTINCT QUANPIZZA FROM PHUC_VU
WHERE GIA >= ALL(SELECT GIA FROM PHUC_VU);

--8. Tìm tên các quán có ph?c v? ít nh?t m?t bánh pizza mà “Ian” thích ?n ?
SELECT DISTINCT PHUC_VU.QUANPIZZA FROM PHUC_VU
JOIN LUI_TOI ON LUI_TOI.QUANPIZZA = PHUC_VU.QUANPIZZA
JOIN AN ON AN.TEN = LUI_TOI.TEN
WHERE LUI_TOI.TEN = 'Ian';

--9. Tìm tên các quán có ph?c v? ít nh?t m?t bánh mà “Eli” không thích ?
SELECT DISTINCT PHUC_VU.QUANPIZZA FROM PHUC_VU
WHERE PHUC_VU.PIZZA NOT IN (SELECT DISTINCT PHUC_VU.QUANPIZZA FROM PHUC_VU
                        JOIN LUI_TOI ON LUI_TOI.QUANPIZZA = PHUC_VU.QUANPIZZA
                        JOIN AN ON AN.TEN = LUI_TOI.TEN
                        WHERE LUI_TOI.TEN = 'Eli');

--10. Tìm tên các quán ch? ph?c v? các bánh mà “Eli” thích ?
SELECT DISTINCT PHUC_VU.QUANPIZZA FROM PHUC_VU
WHERE PHUC_VU.QUANPIZZA NOT IN (SELECT DISTINCT QUANPIZZA FROM PHUC_VU
                            WHERE PIZZA NOT IN (SELECT PIZZA FROM AN
                            WHERE TEN = 'Eli'));

--11. Tên quán có ph?c v? bánh v?i giá l?n h?n t?t c? bánh ph?c v? b?i quán ‘New York
--Pizza’
SELECT DISTINCT QUANPIZZA FROM PHUC_VU
WHERE GIA > ALL (SELECT GIA FROM PHUC_VU
                WHERE QUANPIZZA = 'New York Pizza');

--12. Tìm tên các quán ch? ph?c v? các bánh có giá nh? h?n 10 ?
SELECT DISTINCT QUANPIZZA FROM PHUC_VU
WHERE QUANPIZZA NOT IN (SELECT DISTINCT QUANPIZZA FROM PHUC_VU
                    WHERE GIA >= 10);

--13. Tìm tên bánh ???c ph?c v? b?i quán ‘New York Pizza’ và quán ‘Dominos’
SELECT PIZZA FROM PHUC_VU WHERE QUANPIZZA = 'New York Pizza'
INTERSECT
SELECT PIZZA FROM PHUC_VU WHERE QUANPIZZA = 'Dominos';

--14. Tìm tên bánh ???c ph?c v? b?i quán ‘Little Caesars’ và không ph?c v? b?i quán 'Pizza
--Hut'
SELECT PIZZA FROM PHUC_VU WHERE QUANPIZZA = 'Little Caesars'
MINUS
SELECT PIZZA FROM PHUC_VU WHERE QUANPIZZA = 'Pizza Hut';

--15. Tìm tên các quán có ph?c v? t?t c? các lo?i bánh pizza?
CREATE TABLE DS_PIZZA AS (SELECT DISTINCT PIZZA FROM PHUC_VU);
--SELECT * FROM ds_pizza;
SELECT QUANPIZZA,COUNT(*) FROM PHUC_VU
GROUP BY QUANPIZZA
HAVING  COUNT(PIZZA) = (SELECT COUNT(PIZZA) FROM DS_PIZZA);

DROP TABLE DS_PIZZA;

--16. Tên quán ph?c v? ít nh?t 2 bánh pizza mà ‘Gus’ thích ?
SELECT DISTINCT QUANPIZZA, COUNT(PHUC_VU.PIZZA) FROM PHUC_VU 
JOIN AN ON PHUC_VU.PIZZA = AN.PIZZA
WHERE TEN = 'Gus'
GROUP BY PHUC_VU.QUANPIZZA
HAVING COUNT(PHUC_VU.PIZZA) >= 2;

--17. Tìm tên các quán có ph?c v? t?t c? các bánh mà ‘Ian’ thích
SELECT DISTINCT QUANPIZZA, COUNT(B1.PIZZA) FROM PHUC_VU
LEFT JOIN (SELECT PIZZA FROM AN WHERE TEN = 'Ian') B1 ON B1.PIZZA = PHUC_VU.PIZZA
WHERE B1.PIZZA IS NOT NULL
GROUP BY QUANPIZZA 
HAVING COUNT(B1.PIZZA) = 2
ORDER BY QUANPIZZA;

--18. Tên ng??i ?n lui t?i ít nh?t 3 quán?
select distinct ten from an 
join phuc_vu on phuc_vu.pizza = an.pizza
group by ten
having count(quanpizza) >= 3;

--19. Tính s? lo?i pizza mà m?i quán có bán ?
select quanpizza, count(pizza) from phuc_vu
group by quanpizza;

--20. Tìm tên ng??i ?n thích các bánh ít nh?t là gi?ng các bánh mà Hil thích ?
SELECT * FROM AN WHERE TEN = 'Hil';

SELECT TEN FROM AN
JOIN (SELECT PIZZA FROM AN WHERE TEN = 'Hil') B1 ON B1.PIZZA = AN.PIZZA
WHERE TEN <> 'Hil'
GROUP BY AN.TEN
HAVING COUNT(AN.PIZZA) >= 2;
