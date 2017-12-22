--뷰 삭제

DROP VIEW BOARD_VIEW;

DROP VIEW EVENT_VIEW;

DROP VIEW EVENT_RESULT_VIEW;

DROP VIEW EVENT_JOIN_USER_VIEW;

DROP VIEW FAVORITE_LIST_VIEW;

DROP VIEW GIFTICON_VIEW;

DROP VIEW PURCHASE_VIEW;

DROP VIEW SERVICE_CENTER_VIEW;

DROP VIEW SERVICE_CENTER_COMMENT_VIEW;

DROP VIEW STORE_PRODUCT_VIEW;

DROP VIEW STORE_POPULARITY_PRODUCT_VIEW;

DROP VIEW POPULARITY_PRODUCT_VIEW;

DROP VIEW PRODUCT_VIEW;

DROP VIEW STORE_VIEW;

DROP VIEW SALE_VIEW;

DROP VIEW SALE_PRODUCT_KIND_VIEW;

DROP VIEW USER_VIEW;


/* 자유게시판 뷰 */

CREATE VIEW BOARD_VIEW AS
SELECT A.BOARD_NO, A.TITLE, A.WRITER, B.USER_NAME, A.CONTENTS, A.WRITE_DATE, A.READCOUNT, A.ORIGINAL_FILE_NAME, A.STORED_FILE_NAME, A.DEL_CHECK
FROM TB_BOARD A
JOIN TB_USER B ON(A.WRITER = B.USER_NO)
WITH READ ONLY;


/* 상호 > vo */


/* 할인 > vo */


/* 할인상품 x */


/* 이벤트 뷰 */

CREATE VIEW EVENT_VIEW AS
SELECT A.EVENT_NO, A.TITLE, A.WRITER, B.USER_NAME, A.CONTENTS, A.START_DATE, A.END_DATE, A.JOIN_LIMIT, A.READCOUNT, A.ORIGINAL_FILE_NAME,
A.STORED_FILE_NAME, B.BRAND_NO, C.BRAND_NAME,A.DEL_CHECK FROM TB_EVENT A JOIN TB_USER B ON(A.WRITER = B.USER_NO) JOIN TB_BRAND C ON (B.BRAND_NO = C.BRAND_NO)
WITH READ ONLY;


/*이벤트 참여 > vo */


/* 이벤트 결과 뷰*/
CREATE VIEW EVENT_RESULT_VIEW AS
SELECT A.EVENT_RESULT_NO, A.EVENT_NO, A.TITLE, A.WRITER, B.USER_NAME, A.CONTENTS, A.WRITE_DATE, A.READCOUNT, A.ORIGINAL_FILE_NAME,
A.STORED_FILE_NAME, B.BRAND_NO, A.DEL_CHECK FROM TB_EVENT_RESULT A JOIN TB_USER B ON(A.WRITER = B.USER_NO)
WITH READ ONLY;


/* 이벤트 결과 이벤트참여리스트 뷰 */
CREATE VIEW EVENT_JOIN_USER_VIEW AS
SELECT EVENT_NO, USER_NO, USER_NAME FROM TB_EVENT_JOIN
JOIN TB_USER USING(USER_NO)
WITH READ ONLY;


/* 관심목록 = 사용자 +지점 +상품 */
/* 사용자 번호, 상호번호, 지점번호, 지점명, 상품번호, 상품명, 상품이미지 */
CREATE VIEW FAVORITE_LIST_VIEW AS
SELECT USER_NO, STORE_NO, STORE_NAME, B.BRAND_NAME,
PRODUCT_NO, PRODUCT_NAME, STORED_FILE_NAME, PRICE
FROM TB_FAVORITE_LIST
JOIN TB_STORE USING (STORE_NO)
JOIN TB_PRODUCT A USING (PRODUCT_NO)
JOIN TB_BRAND B ON (A.BRAND_NO = B.BRAND_NO)
WITH READ ONLY;


/* 기프티콘보관함 = 기프티콘 +구매 +사용자 +지점상품  */
/*  
기프티콘번호, 사용자번호, 상품 이미지, 상호번호,  지점번호, 지점명, 상품번호, 상품명, 구매수량, 기프티콘 소멸날짜extinction_date(제조일+유통기한) ,사용여부, 바코드이미지명
*/
CREATE VIEW GIFTICON_VIEW AS
SELECT A.GIFTICON_NO, B.USER_NO, E.STORED_FILE_NAME, E.BRAND_NO, 
D.STORE_NO, D.STORE_NAME, E.PRODUCT_NO, E.PRODUCT_NAME, B.PURCHASE_QUANTITY,
C.MANUFACTURE_DATE+E.EXPIRATION_DATE AS EXTINCTION_DATE, --기프티콘 만료날짜--
A.IS_USE, A.BARCODE_IMG_NAME 
FROM TB_GIFTICON A
JOIN TB_PURCHASE B USING (PURCHASE_NO)
JOIN TB_STORE_PRODUCT C USING (STORE_PRODUCT_NO)
JOIN TB_STORE D ON (D.STORE_NO = C.STORE_NO)
JOIN TB_PRODUCT E ON (E.PRODUCT_NO = C.PRODUCT_NO)
JOIN TB_BRAND F ON(E.BRAND_NO = F.BRAND_NO)
WITH READ ONLY;

/* 상품 > vo */


/* 상품 종류 > vo */


/* 구매내역 조회 : 뷰 */

/* 번호(거래내역번호) 상품명 구매일 구매지점 수량 가격 적립P */

CREATE VIEW PURCHASE_VIEW AS
SELECT A.PURCHASE_NO,A.USER_NO,A.STORE_PRODUCT_NO,D.STORE_NO, D.STORE_NAME, E.PRODUCT_NO,E.PRODUCT_NAME,A.PURCHASE_QUANTITY,
A.CALCULATED_PRICE,A.USING_POINT, A.ACCUMULATE_POINT,A.PURCHASE_DATE  
FROM TB_PURCHASE A
JOIN TB_USER B ON(A.USER_NO = B.USER_NO)
JOIN TB_STORE_PRODUCT C ON(A.STORE_PRODUCT_NO = C.STORE_PRODUCT_NO)
JOIN TB_STORE D ON(C.STORE_NO=D.STORE_NO)
JOIN TB_PRODUCT E ON(C.PRODUCT_NO = E.PRODUCT_NO)
WITH READ ONLY;


/* 고객센터 문의 뷰 */
CREATE VIEW SERVICE_CENTER_VIEW AS
SELECT A.SERVICE_NO, A.TITLE, A.WRITER, B.USER_NAME, A.CONTENTS, A.WRITE_DATE, A.READCOUNT, A.ORIGINAL_FILE_NAME, 
A.STORED_FILE_NAME, A.DEL_CHECK
FROM TB_SERVICE_CENTER A
JOIN TB_USER B ON(A.WRITER = B.USER_NO)
WITH READ ONLY;


/* 고객센터 문의 댓글 뷰 */
CREATE VIEW SERVICE_CENTER_COMMENT_VIEW AS
SELECT A.SERVICE_COMMENT_NO, A.SERVICE_NO, A.WRITER, B.USER_NAME, A.CONTENTS, A.WRITE_DATE, A.DEL_CHECK
FROM TB_SERVICE_CENTER_COMMENT A
JOIN TB_USER B ON(A.WRITER = B.USER_NO)
WITH READ ONLY;


/* 지점 > vo */


/* 지점 상품 리스트 인기상품포함 뷰*/
/* 지점상품번호 지점번호 상품번호 상품명 제조사 가격 제조일 유통기한(계산된날짜) 재고 상품종류번호 상호번호 첨부파일변경명 삭제구분 */

CREATE VIEW STORE_PRODUCT_VIEW AS
SELECT A.STORE_PRODUCT_NO, A.STORE_NO, A.PRODUCT_NO, B.PRODUCT_NAME, B.MANUFACTURER, B.PRICE, A.MANUFACTURE_DATE, B.EXPIRATION_DATE,
TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0) AS EXPIRATION_HOUR, A.QUANTITY, B.PRODUCT_KIND_NO, F.PRODUCT_KIND_NAME, B.BRAND_NO, H.BRAND_NAME,
B.ORIGINAL_FILE_NAME, B.STORED_FILE_NAME, B.DEL_CHECK,
(SELECT COUNT(*) 
FROM TB_PURCHASE C 
JOIN TB_STORE_PRODUCT D ON(C.STORE_PRODUCT_NO = D.STORE_PRODUCT_NO)
JOIN TB_PRODUCT E ON(D.PRODUCT_NO = E.PRODUCT_NO)
WHERE E.PRODUCT_NO = A.PRODUCT_NO AND D.STORE_NO = A.STORE_NO) AS PURCHASE_COUNT
FROM TB_STORE_PRODUCT A
JOIN TB_PRODUCT B ON (A.PRODUCT_NO = B.PRODUCT_NO)
JOIN TB_PRODUCT_KIND F ON (B.PRODUCT_KIND_NO = F.PRODUCT_KIND_NO)
JOIN TB_BRAND H ON(B.BRAND_NO = H.BRAND_NO)
WITH READ ONLY;

/* 지점 할인상품 리스트 인기상품포함 뷰*/
-- STORE_PRODUCT VO
CREATE VIEW STORE_POPULARITY_PRODUCT_VIEW AS
SELECT A.STORE_PRODUCT_NO, A.STORE_NO, A.PRODUCT_NO, B.PRODUCT_NAME, B.MANUFACTURER, B.PRICE, A.MANUFACTURE_DATE, B.EXPIRATION_DATE,
TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0) AS EXPIRATION_HOUR, A.QUANTITY, B.PRODUCT_KIND_NO, F.PRODUCT_KIND_NAME, B.BRAND_NO, H.BRAND_NAME,
B.ORIGINAL_FILE_NAME, B.STORED_FILE_NAME, A.DEL_CHECK,
(SELECT COUNT(*) 
FROM TB_PURCHASE C 
JOIN TB_STORE_PRODUCT D ON(C.STORE_PRODUCT_NO = D.STORE_PRODUCT_NO)
JOIN TB_PRODUCT E ON(D.PRODUCT_NO = E.PRODUCT_NO)
WHERE E.PRODUCT_NO = A.PRODUCT_NO AND D.STORE_NO = A.STORE_NO) AS PURCHASE_COUNT,
G.DISCOUNT_NO, G.DISCOUNT_INFO, I.DISCOUNT_NAME,G.START_DATE,G.END_DATE,
TRUNC((TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0)/(B.EXPIRATION_DATE*24))*100,2) AS EXPIRATION_RATE,
(CASE
    WHEN
  TRUNC((TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0)/(B.EXPIRATION_DATE*24))*100,2) <70 AND
  TRUNC((TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0)/(B.EXPIRATION_DATE*24))*100,2) >=60    
    THEN '10%'
   WHEN
  TRUNC((TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0)/(B.EXPIRATION_DATE*24))*100,2) <60 AND
  TRUNC((TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0)/(B.EXPIRATION_DATE*24))*100,2) >=50    
    THEN '20%'
       WHEN
  TRUNC((TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0)/(B.EXPIRATION_DATE*24))*100,2) <50 AND
  TRUNC((TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0)/(B.EXPIRATION_DATE*24))*100,2) >=40    
    THEN '30%'
       WHEN
  TRUNC((TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0)/(B.EXPIRATION_DATE*24))*100,2) <40 AND
  TRUNC((TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0)/(B.EXPIRATION_DATE*24))*100,2) >=30    
    THEN  '40%'
       WHEN
  TRUNC((TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0)/(B.EXPIRATION_DATE*24))*100,2) <30 AND
  TRUNC((TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0)/(B.EXPIRATION_DATE*24))*100,2) >=0    
    THEN  '50%'
    ELSE '0%'
END) AS DISCOUNT_RATE,
(CASE
    WHEN
  TRUNC((TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0)/(B.EXPIRATION_DATE*24))*100,2) <70 AND
  TRUNC((TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0)/(B.EXPIRATION_DATE*24))*100,2) >=60    
    THEN B.PRICE * 0.9
   WHEN
  TRUNC((TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0)/(B.EXPIRATION_DATE*24))*100,2) <60 AND
  TRUNC((TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0)/(B.EXPIRATION_DATE*24))*100,2) >=50    
    THEN B.PRICE * 0.8
       WHEN
  TRUNC((TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0)/(B.EXPIRATION_DATE*24))*100,2) <50 AND
  TRUNC((TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0)/(B.EXPIRATION_DATE*24))*100,2) >=40    
    THEN B.PRICE * 0.7
       WHEN
  TRUNC((TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0)/(B.EXPIRATION_DATE*24))*100,2) <40 AND
  TRUNC((TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0)/(B.EXPIRATION_DATE*24))*100,2) >=30    
    THEN B.PRICE * 0.6
       WHEN
  TRUNC((TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0)/(B.EXPIRATION_DATE*24))*100,2) <30 AND
  TRUNC((TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0)/(B.EXPIRATION_DATE*24))*100,2) >=0    
    THEN B.PRICE * 0.5
    ELSE B.PRICE
END) AS EXPIRATION_PRICE
FROM TB_STORE_PRODUCT A
JOIN TB_PRODUCT B ON (A.PRODUCT_NO = B.PRODUCT_NO)
JOIN TB_PRODUCT_KIND F ON (B.PRODUCT_KIND_NO = F.PRODUCT_KIND_NO)
LEFT OUTER JOIN TB_DC_PRODUCT G ON (A.PRODUCT_NO = G.PRODUCT_NO AND A.STORE_NO = G.STORE_NO)
JOIN TB_BRAND H ON(B.BRAND_NO = H.BRAND_NO)
LEFT OUTER JOIN TB_DC_INFO I ON(G.DISCOUNT_NO = I.DISCOUNT_NO)
WITH READ ONLY;

/* 전체 상품 리스트에서의 인기상품포함 뷰 */
/* 인기상품 = 구매내역이 가장 많은 상품, 3사의 모든 상품을 대상으로 함
조회 내용 : 상호명, 상품명, 구매횟수 */

/* 전체 상품 리스트 뷰*/
CREATE VIEW PRODUCT_VIEW AS 
SELECT A.PRODUCT_NO, A.PRODUCT_NAME, A.MANUFACTURER, A.PRICE, A.EXPIRATION_DATE, A.PRODUCT_KIND_NO, E.PRODUCT_KIND_NAME,
A.BRAND_NO, F.BRAND_NAME,A.ORIGINAL_FILE_NAME, A.STORED_FILE_NAME,
A.DEL_CHECK, 
(SELECT COUNT(*) 
FROM TB_PURCHASE B 
JOIN TB_STORE_PRODUCT C ON(B.STORE_PRODUCT_NO = C.STORE_PRODUCT_NO)
JOIN TB_PRODUCT D ON(C.PRODUCT_NO = D.PRODUCT_NO)
WHERE D.PRODUCT_NO = A.PRODUCT_NO) AS PURCHASE_COUNT
FROM TB_PRODUCT A
JOIN TB_PRODUCT_KIND E ON (A.PRODUCT_KIND_NO = E.PRODUCT_KIND_NO)
JOIN TB_BRAND F ON (F.BRAND_NO = A.BRAND_NO)
WITH READ ONLY;

/* 금주의 인기상품 (구매수가 많은 순)
조회 내용 : 상호명, 상품번호, 상품명, 구매횟수 */
CREATE VIEW POPULARITY_PRODUCT_VIEW AS
SELECT C.BRAND_NO, C.PRODUCT_NO, C.PRODUCT_NAME, SUM(A.PURCHASE_QUANTITY) SALE_QUANTITY
FROM TB_PURCHASE A
JOIN TB_STORE_PRODUCT B ON (A.STORE_PRODUCT_NO = B.STORE_PRODUCT_NO)
JOIN TB_PRODUCT C ON (B.PRODUCT_NO = C.PRODUCT_NO)
WHERE (SYSDATE - A.PURCHASE_DATE) < 7
GROUP BY C.BRAND_NO, C.PRODUCT_NO, C.PRODUCT_NAME
ORDER BY SALE_QUANTITY DESC
WITH READ ONLY;

/* 판매내역 */ 
CREATE VIEW SALE_VIEW AS
SELECT A.PURCHASE_NO SALE_NO, D.STORE_NO, D.BRAND_NO, E.PRODUCT_NO, E.PRODUCT_NAME,E.PRODUCT_KIND_NO, A.PURCHASE_QUANTITY SALE_QUANTITY, 
A.CALCULATED_PRICE, A.USING_POINT, A.PURCHASE_DATE SALE_DATE, B.USER_NO, B.USER_NAME, SUBSTR(B.PHONE,-4) AS PHONE_NICK
FROM TB_PURCHASE A 
JOIN TB_USER B ON(A.USER_NO = B.USER_NO)
JOIN TB_STORE_PRODUCT C ON(A.STORE_PRODUCT_NO = C.STORE_PRODUCT_NO)
JOIN TB_STORE D ON(C.STORE_NO = D.STORE_NO)
JOIN TB_PRODUCT E ON(C.PRODUCT_NO = E.PRODUCT_NO)
WITH READ ONLY;

/*종류별 판매량*/
CREATE VIEW SALE_PRODUCT_KIND_VIEW AS
SELECT C.STORE_NO, C.BRAND_NO, D.PRODUCT_KIND_NO, E.PRODUCT_KIND_NAME,SUM(A.PURCHASE_QUANTITY) AS SALE_QUANTITY
FROM TB_PURCHASE A 
JOIN TB_STORE_PRODUCT B ON(A.STORE_PRODUCT_NO = B.STORE_PRODUCT_NO)
JOIN TB_STORE C ON(B.STORE_NO = C.STORE_NO)
JOIN TB_PRODUCT D ON(B.PRODUCT_NO = D.PRODUCT_NO)
JOIN TB_PRODUCT_KIND E ON(D.PRODUCT_KIND_NO = E.PRODUCT_KIND_NO)
GROUP BY C.STORE_NO, C.BRAND_NO,D.PRODUCT_KIND_NO,E.PRODUCT_KIND_NAME
WITH READ ONLY;

/* 지점 뷰 */
CREATE VIEW STORE_VIEW AS
SELECT  A.*, B.BRAND_NAME, NVL(C.SALEQ, 0) SALEQUANTITY
FROM TB_STORE A
LEFT OUTER JOIN (SELECT BRAND_NO, STORE_NO, SUM(SALE_QUANTITY) SALEQ
  FROM SALE_VIEW
  GROUP BY BRAND_NO, STORE_NO) C ON (A.BRAND_NO = C.BRAND_NO AND A.STORE_NO = C.STORE_NO)
JOIN TB_BRAND B ON(A.BRAND_NO = B.BRAND_NO)
WITH READ ONLY;

/*사용자 뷰*/
CREATE VIEW USER_VIEW AS
SELECT A.*,B.BRAND_NAME,C.STORE_NAME FROM TB_USER A LEFT OUTER JOIN TB_BRAND B ON(B.BRAND_NO = A.BRAND_NO) LEFT OUTER JOIN TB_STORE C ON (A.STORE_NO = C.STORE_NO)  ORDER BY 1 ASC
WITH READ ONLY;


/* oracle function */
/
CREATE OR REPLACE FUNCTION RADIANS(nDegrees IN NUMBER) 
RETURN NUMBER DETERMINISTIC 
IS
BEGIN
  RETURN nDegrees / 57.29577951308232087679815481410517033235;
END RADIANS;
 /
create or replace function DISTNACE_WGS84( H_LAT in number, H_LNG in number, T_LAT in number, T_LNG in number)
return number deterministic
is
begin
  return ( 6371.0 * acos(  
          cos( radians( H_LAT ) )*cos( radians( T_LAT /* 위도 */ ) )
          *cos( radians( T_LNG /* 경도 */ )-radians( H_LNG ) )
          +
          sin( radians( H_LAT ) )*sin( radians( T_LAT /* 위도 */ ) )        
         ));
end DISTNACE_WGS84;
 /


COMMIT;