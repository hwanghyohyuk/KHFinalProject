/* 구매내역 조회 : 뷰 */

/* 번호(거래내역번호) 상품명 구매일 구매지점 수량 가격 적립P */

/*
CREATE VIEW PURCHASE_RECODE_VIEW AS
*/
SELECT USER_NO, PRODUCT_NAME, STORE_NAME, PURCHASE_QUANTITY, CALCULATED_PRICE, ACCUMULATE_POINT  FROM TB_PURCHASE
JOIN TB_USER USING(USER_NO)
JOIN TB_STORE_PRODUCT USING(STORE_PRODUCT_NO)
JOIN TB_STORE ON(TB_STORE_PRODUCT.STORE_NO=TB_STORE.STORE_NO)
JOIN TB_PRODUCT USING(PRODUCT_NO);

/* 기프티콘보관함 = 기프티콘 +구매 +사용자 +지점상품  */
/*  
기프티콘번호, 사용자번호, 상품 이미지, 상호번호,  지점번호, 지점명, 상품번호, 상품명, 구매수량, 기프티콘 소멸날짜extinction_date(제조일+유통기한) ,사용여부, 바코드이미지명
*/
/*
CREATE VIEW GIFTICON_VIEW AS
*/
SELECT A.GIFTICON_NO, B.USER_NO, E.STORED_FILE_NAME, E.BRAND_NO, 
D.STORE_NO, D.STORE_NAME, E.PRODUCT_NO, E.PRODUCT_NAME, B.PURCHASE_QUANTITY,
C.MANUFACTURE_DATE+E.EXPIRATION_DATE AS EXTINCTION_DATE, --기프티콘 만료날짜--
A.IS_USE, A.BARCODE_IMG_NAME 
FROM TB_GIFTICON A
JOIN TB_PURCHASE B USING (PURCHASE_NO)
JOIN TB_STORE_PRODUCT C USING (STORE_PRODUCT_NO)
JOIN TB_STORE D ON (D.STORE_NO = C.STORE_NO)
JOIN TB_PRODUCT E ON (E.PRODUCT_NO = C.PRODUCT_NO)
JOIN TB_BRAND F ON(E.BRAND_NO = F.BRAND_NO);

/* 관심목록 = 사용자 +지점 +상품 */
/* 
사용자 번호, 상호번호, 지점번호, 지점명, 상품번호, 상품명,  상품이미지
*/
/*
CREATE VIEW FAVORITE_LIST_VIEW AS
*/
SELECT USER_NO, A.BRAND_NO, D.BRAND_NAME , A.STORE_NO, STORE_NAME, B.PRODUCT_NO, B.PRODUCT_NAME, B.STORED_FILE_NAME,  
STORE_PRODUCT_NO,  MIN(C.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE) AS MIN_EXPIRATION_DAY
FROM TB_FAVORITE_LIST
JOIN TB_STORE A ON(A.STORE_NO = TB_FAVORITE_LIST.STORE_NO)
JOIN TB_PRODUCT B ON(B.PRODUCT_NO = TB_FAVORITE_LIST.PRODUCT_NO)
JOIN TB_STORE_PRODUCT C ON(A.STORE_NO = C.STORE_NO AND B.PRODUCT_NO = C.PRODUCT_NO)
JOIN TB_BRAND D ON(A.BRAND_NO=D.BRAND_NO)
GROUP BY USER_NO, A.BRAND_NO,  D.BRAND_NAME, A.STORE_NO, STORE_NAME, B.PRODUCT_NO, B.PRODUCT_NAME, B.STORED_FILE_NAME,  
STORE_PRODUCT_NO;

/* 지점 상품 리스트 뷰*/
/* 지점상품번호 지점번호 상품번호 상품명 제조사 가격 제조일 유통기한(계산된날짜) 재고 상품종류번호 상호번호 첨부파일변경명 삭제구분 */
/*
CREATE VIEW STORE_PRODUCT_VIEW AS
*/
SELECT STORE_PRODUCT_NO, STORE_NO, PRODUCT_NO, PRODUCT_NAME, MANUFACTURER, PRICE, MANUFACTURE_DATE, B.EXPIRATION_DATE,
TRUNC((A.MANUFACTURE_DATE+B.EXPIRATION_DATE-SYSDATE)*24,0) AS EXPIRATION_HOUR, A.QUANTITY, B.PRODUCT_KIND_NO, B.BRAND_NO,
B.STORED_FILE_NAME, B.DEL_CHECK
FROM TB_STORE_PRODUCT A
JOIN TB_PRODUCT B USING (PRODUCT_NO);

/* 이벤트 결과 이벤트참여리스트 뷰 */
/*
CREATE VIEW EVENT_JOIN_USER_VIEW AS
*/
SELECT EVENT_NO, USER_NO, USER_NAME FROM TB_EVENT_JOIN
JOIN TB_USER USING(USER_NO);


/* 실시간 인기상품 리스트 TOP3 : 뷰 */
/* 
인기상품 = 구매내역이 가장 많은 상품 
3사의 모든 상품을 대상으로 함

조회 내용 : 상호명, 상품명, 구매횟수 
*/
SELECT * FROM(
SELECT BRAND_NAME, PRODUCT_NAME, COUNT(*) AS PURCHASE_COUNT
FROM TB_PURCHASE
JOIN TB_STORE_PRODUCT USING(STORE_PRODUCT_NO)
JOIN TB_PRODUCT USING(PRODUCT_NO)
JOIN TB_BRAND USING(BRAND_NO)
GROUP BY BRAND_NAME,PRODUCT_NAME
ORDER BY 3 DESC) WHERE ROWNUM <=3;