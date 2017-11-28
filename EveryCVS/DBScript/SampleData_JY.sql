/* 상호 table data */
INSERT INTO TB_BRAND VALUES(0, NULL);
INSERT INTO TB_BRAND VALUES(1, 'GS25');
INSERT INTO TB_BRAND VALUES(2, 'CU');
INSERT INTO TB_BRAND VALUES(3, '7ELEVEN');

/* 상품분류 table data */
INSERT INTO TB_PRODUCT_KIND VALUES(1, '과일');
INSERT INTO TB_PRODUCT_KIND VALUES(2, '도시락');
INSERT INTO TB_PRODUCT_KIND VALUES(3, '김밥');
INSERT INTO TB_PRODUCT_KIND VALUES(4, '햄버거');
INSERT INTO TB_PRODUCT_KIND VALUES(5, '햄');
INSERT INTO TB_PRODUCT_KIND VALUES(6, '라면');
INSERT INTO TB_PRODUCT_KIND VALUES(7, '아이스크림');
INSERT INTO TB_PRODUCT_KIND VALUES(8, '샐러드');
INSERT INTO TB_PRODUCT_KIND VALUES(9, '과자');
INSERT INTO TB_PRODUCT_KIND VALUES(10, '음료');

/* 상품 table sample data */
/* 7ELEVEN */
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '모심)보성녹돈불고기도시락', '주식회사 올가니카키친',
4200, 2, 2, 3, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '롯데)의성마늘 햄쌈 도시락', '롯데푸드',
3900, 2, 2, 3, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '모심)두부조림 도시락', '주식회사 올가니카키친',
3800, 2, 2, 3, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '롯데)춘천식닭갈비도시락', '롯데푸드',
4300, 2, 2, 3, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '롯데)전주식한상도시락', '롯데푸드',
4500, 2, 2, 3, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '롯데)함박볼로네즈스파게티', '롯데푸드',
3800, 2, 2, 3, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '롯데)김치제육소시지도시락', '롯데푸드',
3800, 2, 2, 3, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '롯데)닭조아 치킨치킨 도시락', '롯데푸드',
4000, 2, 2, 3, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '모심)언양식불고기도시락', '주식회사 올가니카키친',
4200, 2, 2, 3, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '롯데)군산오징어 도시락', '롯데푸드',
4300, 2, 3, 3, NULL, NULL, 'N');

/* CU */
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '주)비빔참치마요', NULL,
900, 2, 3, 2, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '샌)BLT비엘티샌드위치', NULL,
2000, 2, 4, 2, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '주)뉴통햄구이참치마요', NULL,
900, 2, 3, 2, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '샌)제주뉴게맛살샌드위치', NULL,
2300, 2, 4, 2, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '샌)시저치킨샌드위치', NULL,
2000, 2, 4, 2, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '햄)잇츠빅치킨버거', NULL,
2300, 2, 4, 2, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '햄)뉴불고기버거', NULL,
1000, 2, 4, 2, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '도)훈제오리', NULL,
4900, 2, 2, 2, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '햄)날가지새우', NULL,
2500, 2, 4, 2, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '한성)몬스터후랑크', NULL,
1800, 2, 5, 3, NULL, NULL, 'N');


/* GS25 */
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '진짜진짜많구나도시락', NULL,
4300, 2, 2, 3, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '풍성한가위도시락', NULL,
6000, 2, 2, 3, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '명가추석반상도시락', NULL,
10000, 2, 2, 3, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '돔베고기도시락', NULL,
4800, 2, 2, 3, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '낮도밤안함박도시락', NULL,
3600, 2, 2, 3, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '심야식당도시락', NULL,
6000, 2, 2, 3, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '모두의정찬도시락', NULL,
3900, 2, 2, 3, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '칠리새우도시락', NULL,
4300, 2, 2, 3, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '완전크닭도시락', NULL,
4500, 2, 2, 3, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '부대찌개도시락', NULL,
4000, 2, 2, 3, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '코카)씨그램레몬탄산수350ML', '코카콜라음료(주)',
1300, 10, 10, 3, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '푸르밀)비피더스사과300ML', '푸르밀',
1200, 10, 10, 3, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, 'CJ)컨디션헛개수1L', 'CJ',
2500, 10, 10, 3, NULL, NULL, 'N');
INSERT INTO TB_PRODUCT VALUES(SEQ_PRODUCT_NO.NEXTVAL, '해광)바나나스틱1200', '해광',
1200, 10, 9, 3, NULL, NULL, 'N');

/* 할인 table data */
INSERT INTO TB_DC_INFO VALUES(1, '1+1');
INSERT INTO TB_DC_INFO VALUES(2, '2+1');
INSERT INTO TB_DC_INFO VALUES(3, '증정행사');
INSERT INTO TB_DC_INFO VALUES(4, '할인행사');

/* 할인 상품 table sample data */
INSERT INTO TB_DC_PRODUCT VALUES('25305326', 1, 4, '3900');
INSERT INTO TB_DC_PRODUCT VALUES('25305326', 3, 4, '3500');
INSERT INTO TB_DC_PRODUCT VALUES('25305326', 5, 4, '4000');
INSERT INTO TB_DC_PRODUCT VALUES('25471219', 11, 1, NULL);
INSERT INTO TB_DC_PRODUCT VALUES('25471219', 18, 3, '20');
INSERT INTO TB_DC_PRODUCT VALUES('25471219', 12, 4, '1800');
INSERT INTO TB_DC_PRODUCT VALUES('22497453', 5, 3, '31');
INSERT INTO TB_DC_PRODUCT VALUES('22497453', 15, 4, '3500');
INSERT INTO TB_DC_PRODUCT VALUES('22497453', 25, 4, '3900');
INSERT INTO TB_DC_PRODUCT VALUES('22605244', 17, 1, NULL);
INSERT INTO TB_DC_PRODUCT VALUES('22605244', 34, 1, NULL);
INSERT INTO TB_DC_PRODUCT VALUES('22605244', 28, 3, '32');