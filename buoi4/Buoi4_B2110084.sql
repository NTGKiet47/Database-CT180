-- --PH?N T? LUY?N
-- --1. Tìm s? thông th??ng gi?a các b?ng trong CSDL
-- --2. M? các b?ng d? li?u ?? xem ki?u d? li?u c?a t?ng tr??ng và quan sát d? li?u c?a
-- --t?ng b?ng
SELECT * FROM CGTRINH;
SELECT * FROM CHUNHAN;
SELECT * FROM CHUTHAU;
SELECT * FROM CONGNHAN;
SELECT * FROM KTRUCSU;
SELECT * FROM THAMGIA;
SELECT * FROM THIETKE;
-- 3. Hãy cho bi?t thông tin v? các ki?n trúc s? có h? là Lê và sinh n?m 1956
SELECT * FROM KTRUCSU 
WHERE HOTEN_KTS LIKE "le%" AND NAMS_KTS = 1956;
-- 4. Hãy cho bi?t tên các công trình b?t ??u trong kho?ng 1/9/1994 ??n 20/10/1994
SELECT TEN_CTR 
FROM CGTRINH
WHERE NGAY_BD BETWEEN TO_DATE('1/9/1994', 'DD/MM/YYYY') AND TO_DATE('20/10/1994', 'DD/MM/YYYY');

-- 5. Hãy cho bi?t tên và ??a ch? các công trình do ch? th?u công ty xây d?ng s? 6 thi
SELECT TEN_CTR, DIACHI_CTR FROM CGTRINH
WHERE TEN_THAU = 'cty xd so 6';

-- 6. Tìm tên và ??a ch? liên l?c c?a các ch? th?u thi công công trình ? C?n Th? do ki?n
-- trúc s? Lê Kim Dung thi?t k?
SELECT DISTINCT TEN_THAU, DCHI_THAU
FROM THIETKE
JOIN CGTRINH ON THIETKE.STT_CTR = CGTRINH.STT_CTR
JOIN CHUTHAU ON CGTRINH.TEN_THAU = CHUTHAU.TEN_THAU
WHERE HOTEN_KTS = 'le kim dung';

-- 7. Hãy cho bi?t n?i t?t nghi?p c?a các ki?n trúc s? ?ã thi?t k? công trình Khách s?n
-- qu?c t? ? C?n Th?
SELECT KTRUCSU.HOTEN_KTS, KTRUCSU.NOI_TN FROM KTRUCSU
JOIN THIETKE ON THIETKE.HOTEN_KTS = KTRUCSU.HOTEN_KTS
JOIN CGTRINH ON THIETKE.STT_CTR = CGTRINH.STT_CTR
WHERE TEN_CTR = 'khach san quoc te' AND TINH_THANH = 'can tho';


-- 8. Cho bi?t h? tên, n?m sinh và n?m vào ngh? c?a các công nhân có chuyên môn hàn
-- ho?c ?i?n ?ã tham gia các công trình mà ch? th?u Lê V?n S?n ?ã trúng th?u
SELECT * FROM CONGNHAN
JOIN THAMGIA ON congnhan.hoten_cn = thamgia.hoten_cn
JOIN CGTRINH ON cgtrinh.stt_ctr = thamgia.stt_ctr
WHERE TEN_THAU = 'le van son' AND (CONGNHAN.CH_MON = 'dien' OR CONGNHAN.CH_MON = 'han');


-- 9. Nh?ng công nhân nào ?ã b?t ??u tham gia công trình Khách s?n Qu?c t? ? C?n Th?
-- trong giai ?o?n t? ngày 15/12/1994 ??n 31/12/1994
select CONGNHAN.HOTEN_CN from CONGNHAN
JOIN THAMGIA ON congnhan.hoten_cn = thamgia.hoten_cn
JOIN CGTRINH ON cgtrinh.stt_ctr = thamgia.stt_ctr
WHERE TEN_CTR = 'khach san quoc te' AND TINH_THANH = 'can tho'
AND (NGAY_TGIA BETWEEN to_date('15/12/1994','dd/mm/yyyy') and to_date('31/12/1994','dd/mm/yyyy'));

-- 10. Cho bi?t h? tên và n?m sinh c?a các ki?n trúc s? ?ã t?t nghi?p ? TP HCM và ?ã thi?t
-- k? ít nh?t m?t công trình có kinh phí ??u t? trên 400 tri?u ??ng
SELECT distinct ktrucsu.hoten_kts, ktrucsu.nams_kts FROM KTRUCSU
JOIN THIETKE ON ktrucsu.hoten_kts = thietke.hoten_kts
JOIN CGTRINH ON cgtrinh.stt_ctr = thietke.stt_ctr
WHERE KINH_PHI > 400;

-- 11. Tìm h? tên và chuyên môn c?a các công nhân tham gia các công trình do ki?n trúc
-- s? Lê Thanh Tùng thi?t k?
SELECT thamgia.hoten_cn, congnhan.ch_mon  FROM THAMGIA
JOIN THIETKE ON thietke.stt_ctr = thamgia.stt_ctr
JOIN CONGNHAN ON THAMGIA.hoten_cn = CONGNHAN.hoten_cn
WHERE thietke.hoten_kts = 'le thanh tung';

-- 12. Cho bi?t tên công trình có kinh phí cao nh?t
SELECT TEN_CTR FROM CGTRINH
WHERE KINH_PHI >= ALL(SELECT CGTRINH.KINH_PHI FROM CGTRINH);

-- 13. Cho bi?t h? tên ki?n trúc s? tr? tu?i nh?t
SELECT HOTEN_KTS FROM KTRUCSU
WHERE NAMS_KTS >= ALL(SELECT NAMS_KTS FROM KTRUCSU);

-- 14. Tìm t?ng kinh phí c?a các công trình theo t?ng ch? th?u
SELECT TEN_THAU, SUM(KINH_PHI) FROM CGTRINH
GROUP BY TEN_THAU;

-- 15. Tìm tên và ??a ch? nh?ng ch? th?u ?ã trúng th?u công trình có kinh phí th?p nh?t


-- 16. Cho bi?t h? tên các ki?n trúc s? có t?ng thù lao thi?t k? các công trình l?n h?n 25
-- tri?u
SELECT HOTEN_KTS, SUM(THU_LAO) FROM THIETKE
GROUP BY hoten_kts
HAVING SUM(thu_lao) > 25;



-- 17. Cho bi?t s? l??ng các ki?n trúc s? có t?ng thù lao thi?t k? các công trình l?n h?n 25
-- tri?u


-- 18. Tính s? công trình mà m?i ki?n trúc s? ?ã thi?t k?
SELECT HOTEN_KTS, COUNT(STT_CTR) FROM THIETKE
GROUP BY hoten_kts;

-- 19. Tính t?ng s? công nhân ?ã tham gia m?i công trình
-- 20. Tìm tên và ??a ch? công trình có t?ng s? công nhân tham gia nhi?u nh?t


-- 21. Cho bi?t tên các thành ph? và kinh phí trung bình c?a các công trình c?a t?ng thành
-- ph? t??ng ?ng
SELECT TINH_THANH, AVG(KINH_PHI) FROM CGTRINH
GROUP BY TINH_THANH;


-- --PH?N TỰ LUYỆN
-- --1. Tìm s? thông th??ng gi?a các b?ng trong CSDL


-- 2. Mở các bảng dữ liệu để xem kiểu dữ liệu của từng trường và quan sát dữ liệu của
-- từng bảng

SELECT * FROM CGTRINH;
SELECT * FROM CHUNHAN;
SELECT * FROM CHUTHAU;
SELECT * FROM CONGNHAN;
SELECT * FROM KTRUCSU;
SELECT * FROM THAMGIA;
SELECT * FROM THIETKE;

-- 3. Hãy cho biết thông tin về các kiến trúc sư có họ là Lê và sinh năm 1956
SELECT * FROM KTRUCSU 
WHERE HOTEN_KTS LIKE "le%" AND NAMS_KTS = 1956;
-- 4. Hãy cho biết tên các công trình bắt đầu trong khoảng 1/9/1994 đến 20/10/1994
SELECT TEN_CTR 
FROM CGTRINH
WHERE NGAY_BD BETWEEN TO_DATE('1/9/1994', 'DD/MM/YYYY') AND TO_DATE('20/10/1994', 'DD/MM/YYYY');

-- 5. Hãy cho biết tên và địa chỉ các công trình do chủ thầu ‘công ty xây dựng số 6’ thi
-- công (chú ý: xem dữ liệu để lấy đúng tên công ty xây dựng số 6)
SELECT TEN_CTR, DIACHI_CTR FROM CGTRINH
WHERE TEN_THAU = 'cty xd so 6';

-- 6. Tìm tên và địa chỉ liên lạc của các chủ thầu thi công công trình ở Cần Thơ do kiến
-- trúc sư Lê Kim Dung thiết kế
SELECT DISTINCT TEN_THAU, DCHI_THAU
FROM THIETKE
JOIN CGTRINH ON THIETKE.STT_CTR = CGTRINH.STT_CTR
JOIN CHUTHAU ON CGTRINH.TEN_THAU = CHUTHAU.TEN_THAU
WHERE HOTEN_KTS = 'le kim dung';

-- 7. Hãy cho biết nơi tốt nghiệp của các kiến trúc sư đã thiết kế công trình Khách sạn
-- quốc tế ở Cần Thơ
SELECT KTRUCSU.HOTEN_KTS, KTRUCSU.NOI_TN FROM KTRUCSU
JOIN THIETKE ON THIETKE.HOTEN_KTS = KTRUCSU.HOTEN_KTS
JOIN CGTRINH ON THIETKE.STT_CTR = CGTRINH.STT_CTR
WHERE TEN_CTR = 'khach san quoc te' AND TINH_THANH = 'can tho';

-- 8. Cho biết họ tên, năm sinh và năm vào nghề của các công nhân có chuyên môn hàn
-- hoặc điện đã tham gia các công trình mà chủ thầu Lê Văn Sơn đã trúng thầu
SELECT * FROM CONGNHAN
JOIN THAMGIA ON congnhan.hoten_cn = thamgia.hoten_cn
JOIN CGTRINH ON cgtrinh.stt_ctr = thamgia.stt_ctr
WHERE TEN_THAU = 'le van son' AND (CONGNHAN.CH_MON = 'dien' OR CONGNHAN.CH_MON = 'han');

-- 9. Những công nhân nào đã bắt đầu tham gia sông trình Khách sạn Quốc tế ở Cần Thơ
-- trong giai đoạn từ ngày 15/12/1994 đến 31/12/1994
select CONGNHAN.HOTEN_CN from CONGNHAN
JOIN THAMGIA ON congnhan.hoten_cn = thamgia.hoten_cn
JOIN CGTRINH ON cgtrinh.stt_ctr = thamgia.stt_ctr
WHERE TEN_CTR = 'khach san quoc te' AND TINH_THANH = 'can tho'
AND (NGAY_TGIA BETWEEN to_date('15/12/1994','dd/mm/yyyy') and to_date('31/12/1994','dd/mm/yyyy'));

-- 10. Cho biết họ tên và năm sinh của các kiến trúc sư đã tốt nghiệp ở TP HCM và đã thiết
-- kế ít nhất một công trình có kinh phí đầu tư trên 400 triệu đồng
SELECT distinct ktrucsu.hoten_kts, ktrucsu.nams_kts FROM KTRUCSU
JOIN THIETKE ON ktrucsu.hoten_kts = thietke.hoten_kts
JOIN CGTRINH ON cgtrinh.stt_ctr = thietke.stt_ctr
WHERE KINH_PHI > 400;

-- 11. Tìm họ tên và chuyên môn của các công nhân tham gia các công trình do kiến trúc
-- sư Lê Thanh Tùng thiết kế

SELECT thamgia.hoten_cn, congnhan.ch_mon  FROM THAMGIA
JOIN THIETKE ON thietke.stt_ctr = thamgia.stt_ctr
JOIN CONGNHAN ON THAMGIA.hoten_cn = CONGNHAN.hoten_cn
WHERE thietke.hoten_kts = 'le thanh tung';

-- 12. Cho biết tên công trình có kinh phí cao nhất
SELECT TEN_CTR FROM CGTRINH
WHERE KINH_PHI >= ALL(SELECT CGTRINH.KINH_PHI FROM CGTRINH);

-- 13. Cho biết họ tên kiến trúc sư trẻ tuổi nhất
SELECT HOTEN_KTS FROM KTRUCSU
WHERE NAMS_KTS >= ALL(SELECT NAMS_KTS FROM KTRUCSU);

-- 14. Tìm tổng kinh phí của các công trình theo từng chủ thầu
SELECT TEN_THAU, SUM(KINH_PHI) FROM CGTRINH
GROUP BY TEN_THAU;

-- 15. Tìm tên và địa chỉ những chủ thầu đã trúng thầu công trình có kinh phí thấp nhất


-- 16. Cho biết họ tên các kiến trúc sư có tổng thù lao thiết kế các công trình lớn hơn 25
-- triệu
SELECT HOTEN_KTS, SUM(THU_LAO) FROM THIETKE
GROUP BY hoten_kts
HAVING SUM(thu_lao) > 25;

-- 17. Cho biết số lượng các kiến trúc sư có tổng thù lao thiết kế các công trình lớn hơn 25
-- triệu
SELECT HOTEN_KTS, SUM(THU_LAO) FROM THIETKE
GROUP BY HOTEN_KTS
HAVING SUM(THU_LAO) > 25; 

-- 18. Tính số công trình mà mỗi kiến trúc sư đã thiết kế
SELECT HOTEN_KTS, COUNT(STT_CTR) FROM THIETKE
GROUP BY hoten_kts;

-- 19. Tính tổng số công nhân đã tham gia mỗi công trình
SELECT STT_CTR, COUNT(HOTEN_CN) FROM THAMGIA
GROUP BY STT_CTR;

-- 20. Tìm tên và địa chỉ công trình có tổng số công nhân tham gia nhiều nhất


-- 21. Cho biết tên các thành phố và kinh phí trung bình của các công trình của từng thành
-- phố tương ứng


SELECT TINH_THANH, AVG(KINH_PHI) FROM CGTRINH
GROUP BY TINH_THANH;

-- PHÀN CÓ HƯỚNG DẪN
-- 22. Cho biết tên và địa chỉ của các công trình mà công nhân Nguyễn Hồng Vân đang
-- tham gia vào ngày 18/12/1994



-- 23. Cho biết họ tên kiến trúc sư vừa thiết kế các công trình do Phòng dịch vụ Sở Xây
-- dựng thi công, vừa thiết kế các công trình do chủ thầu Lê Văn Sơn thi công



-- 24. Cho biết họ tên các công nhân có tham gia các công trình ở Cần Thơ nhưng không
-- tham gia công trình ở Vĩnh Long
select distinct CONGNHAN.HOTEN_CN FROM CONGNHAN
JOIN THAMGIA ON THAMGIA.HOTEN_CN = CONGNHAN.HOTEN_CN
JOIN CGTRINH ON THAMGIA.STT_CTR = CGTRINH.STT_CTR
WHERE TINH_THANH = 'can tho' and CONGNHAN.HOTEN_CN not in (select CONGNHAN.HOTEN_CN FROM CONGNHAN
													JOIN THAMGIA ON THAMGIA.HOTEN_CN = CONGNHAN.HOTEN_CN
													JOIN CGTRINH ON THAMGIA.STT_CTR = CGTRINH.STT_CTR
													WHERE TINH_THANH = 'vinh long');



-- 25. Cho biết tên của các chủ thầu đã thi công các công trình có kinh phí lớn hơn tất cả
-- các công trình do chủ thầu Phòng dịch vụ sở xây dựng thi công
select * FROM CGTRINH
WHERE KINH_PHI > ALL(SELECT SUM(KINH_PHI) FROM CGTRINH
					WHERE TEN_THAU = 'phong dich vu so xd');
         

-- 26. Cho biết họ tên các kiến trúc sư có thù lao thiết kế cho một công trình nào đó dưới
-- giá trị trung bình thù lao thiết kế của các KTS.
SELECT distinct HOTEN_KTS FROM THIETKE
WHERE THU_LAO < (SELECT AVG(THU_LAO) FROM THIETKE);

-- 27. Cho biết họ tên các công nhân có tổng số ngày tham gia vào các công trình lớn hơn
-- tổng số ngày tham gia của công nhân Nguyễn Hồng Vân
SELECT HOTEN_CN, SUM(SO_NGAY) FROM THAMGIA
GROUP BY HOTEN_CN
having SUM(SO_NGAY) > (SELECT SUM(SO_NGAY) FROM THAMGIA
						GROUP BY HOTEN_CN
						HAVING HOTEN_CN = 'nguyen hong van');


-- 28. Cho biết họ tên công nhân có tham gia tất cả các công trình
SELECT HOTEN_CN, COUNT(STT_CTR) FROM THAMGIA
GROUP BY HOTEN_CN
HAVING COUNT(STT_CTR) = (SELECT count(*) FROM CGTRINH);
-- 29. Tìm các cặp tên của chủ thầu có trúng thầu các công trình tại cùng một thành phố
SELECT DISTINCT CTG1.TEN_THAU, CTG2.TEN_THAU, CTG1.TINH_THANH FROM CGTRINH CTG1 
JOIN CGTRINH CTG2 WHERE CTG1.TINH_THANH = CTG2.TINH_THANH AND CTG1.TEN_THAU < CTG2.TEN_THAU;


-- 30. Tìm các cặp tên của các công nhân có lamg việc chung với nhau trong ít nhất là hai
-- công trình
SELECT TG1.HOTEN_CN, TG2.HOTEN_CN FROM THAMGIA TG1 JOIN THAMGIA TG2 
ON TG1.STT_CTR = TG2.STT_CTR WHERE TG1.HOTEN_CN < TG2.HOTEN_CN
GROUP BY TG1.HOTEN_CN, TG2.HOTEN_CN
HAVING COUNT(*) > 1;
