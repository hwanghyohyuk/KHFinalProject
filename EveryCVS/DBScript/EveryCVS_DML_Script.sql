/* 상호 table data */
INSERT INTO TB_BRAND VALUES(0, NULL);
INSERT INTO TB_BRAND VALUES(1, 'GS25');
INSERT INTO TB_BRAND VALUES(2, 'CU');
INSERT INTO TB_BRAND VALUES(3, '7ELEVEN');

/* 상품종류 table data */
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


/* SAMPLE DATA STORE_PRODUCT */
/*세븐일레븐 대치점*/
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '25305326', 1, SYSDATE, 2);
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '25305326', 3, SYSDATE, 3);
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '25305326', 5, SYSDATE, 1);

/*CU 역삼달샘점*/
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '25471219', 11, SYSDATE, 1);
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '25471219', 18, SYSDATE, 1);
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '25471219', 12, SYSDATE, 2);

/*CU 대치점*/
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '20399380', 3, SYSDATE, 1);
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '20399380', 13, SYSDATE, 2);
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '20399380', 23, SYSDATE, 2);

/*GS25 대치학원점*/
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '22520776', 4, SYSDATE, 2);
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '22520776', 14, SYSDATE, 3);
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '22520776', 24, SYSDATE, 1);

/*GS25 역삼태양점*/
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '22497453', 5, SYSDATE, 2);
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '22497453', 15, SYSDATE, 5);
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '22497453', 25, SYSDATE, 1);

/*GS25 로데오점*/
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '22497502', 6, SYSDATE, 2);
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '22497502', 16, SYSDATE, 4);
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '22497502', 26, SYSDATE, 2);

/*GS25 역삼점*/
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '22605244', 34, SYSDATE, 1);
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '22605244', 17, SYSDATE, 4);
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '22605244', 28, SYSDATE, 3);

/*CU 자곡현대점*/
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '23253923', 8, SYSDATE, 1);
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '23253923', 18, SYSDATE, 2);
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '23253923', 28, SYSDATE, 2);

/*GS25 대치점*/
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '23492143', 9, SYSDATE, 1);
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '23492143', 19, SYSDATE, 2);
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '23492143', 29, SYSDATE, 2);

/*GS25 압구정점*/
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '25437481', 10, SYSDATE, 7);
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '25437481', 20, SYSDATE, 2);
INSERT INTO TB_STORE_PRODUCT VALUES(SEQ_STORE_PRODUCT_NO.NEXTVAL, '25437481', 30, SYSDATE, 2);

/*사용자*/
INSERT INTO TB_USER VALUES(SEQ_USER_NO.NEXTVAL, 'admin@iei.or.kr', 'admin', '사이트관리자', '92/06/18', 'M', '010-5913-6110', '경기도 부천시 길주로 300', null, null, 0, 'sitemanager', null, null, null, null);
INSERT INTO TB_USER VALUES(SEQ_USER_NO.NEXTVAL, 'user11@iei.or.kr', 'user11', 'GS25관리자', '94/03/04', 'W', '010-2122-6374', '경기도 안산시 상록구 안산천남1로 70', null, null, 0, 'cvsmanager', null, null, null, 1);
INSERT INTO TB_USER VALUES(SEQ_USER_NO.NEXTVAL, 'user22@iei.or.kr', 'user22', 'CU관리자', '94/03/03', 'W', '010-8906-0239', '인천광역시 연수구 송도동 컨벤시아대로', null, null, 0, 'cvsmanager', null, null, null, 2);
INSERT INTO TB_USER VALUES(SEQ_USER_NO.NEXTVAL, 'user33@iei.or.kr', 'user33', '세븐일레븐관리자', '94/03/04', 'W', '010-9190-1099', '경기도 이천시 모가면 사실로 988', null, null, 0, 'cvsmanager', null, null, null, 3);
INSERT INTO TB_USER VALUES(SEQ_USER_NO.NEXTVAL, 'user44@iei.or.kr', 'user44', '세븐일레븐대치점관리자', '89/12/25', 'M', '010-1234-5678', '서울시 강남구 남부순환로 3032', null, null, 0, 'storemanager', null, null, '25305326', 3);
INSERT INTO TB_USER VALUES(SEQ_USER_NO.NEXTVAL, 'user55@iei.or.kr', 'user55', 'CU역삼달샘점관리자', '86/11/02', 'M', '010-2345-6789', '서울 강남구 역삼동 637-9', null, null, 0, 'storemanager', null, null, '25471219', 2);
INSERT INTO TB_USER VALUES(SEQ_USER_NO.NEXTVAL, 'user66@iei.or.kr', 'user66', 'GS25로데오점관리자', '80/09/10', 'W', '010-3456-7890', '서울 강남구 압구정로48길 15', null, null, 0, 'storemanager', null, null, '22497502', 1);
INSERT INTO TB_USER VALUES(SEQ_USER_NO.NEXTVAL, 'user77@iei.or.kr', 'user77', '사용자1', '96/12/07', 'W', '010-1111-2222', '서울 강남구 영동대로 513', null, null, 0, 'customer', 10000, 745, null, null);
INSERT INTO TB_USER VALUES(SEQ_USER_NO.NEXTVAL, 'user88@iei.or.kr', 'user88', '사용자2', '75/05/24', 'M', '010-2222-3333', '경기 고양시 일산서구로 217-60', null, null, 0, 'customer', 20000, 800, null, null);
INSERT INTO TB_USER VALUES(SEQ_USER_NO.NEXTVAL, 'user99@iei.or.kr', 'user99', '사용자3', '00/04/01', 'M', '010-3333-4444', '서울 영등포구 63로 50', null, null, 0, 'customer', 150000, 600, null, null);


/* SAMPLE DATA PURCHASE */

INSERT INTO TB_PURCHASE VALUES(SEQ_PURCHASE_NO.NEXTVAL,1, '25437481', 1,4200 , NULL, NULL, 42,'17/11/21');
INSERT INTO TB_PURCHASE VALUES(SEQ_PURCHASE_NO.NEXTVAL,2, '23253923', 1,4500 , NULL, NULL, 45,'17/11/21');
INSERT INTO TB_PURCHASE VALUES(SEQ_PURCHASE_NO.NEXTVAL,3, '20399380', 1,3800 , NULL, NULL, 38,'17/10/2');
INSERT INTO TB_PURCHASE VALUES(SEQ_PURCHASE_NO.NEXTVAL,4, '25305326', 1,2000 , NULL, NULL, 20,'17/10/11');
INSERT INTO TB_PURCHASE VALUES(SEQ_PURCHASE_NO.NEXTVAL,5, '23253923', 1,2300 , NULL, NULL, 23,'17/9/21');
INSERT INTO TB_PURCHASE VALUES(SEQ_PURCHASE_NO.NEXTVAL,6, '20399380', 1,4000 , NULL, NULL, 40,'17/9/22');
INSERT INTO TB_PURCHASE VALUES(SEQ_PURCHASE_NO.NEXTVAL,7, '25305326', 1,4500 , NULL, NULL, 45,'17/9/4');
INSERT INTO TB_PURCHASE VALUES(SEQ_PURCHASE_NO.NEXTVAL,8, '25437481', 1,3200 , NULL, NULL, 32,'17/8/12');
INSERT INTO TB_PURCHASE VALUES(SEQ_PURCHASE_NO.NEXTVAL,9, '25305326', 1,2000 , NULL, NULL, 20,'17/8/21');
INSERT INTO TB_PURCHASE VALUES(SEQ_PURCHASE_NO.NEXTVAL,10, '25437481', 1,2400 , NULL, NULL, 24,'17/8/30');

/* SAMPLE DATA GIFTICON */

INSERT INTO TB_GIFTICON VALUES(SEQ_GIFTICON_NO.NEXTVAL, 1, NULL, 'N' );
INSERT INTO TB_GIFTICON VALUES(SEQ_GIFTICON_NO.NEXTVAL, 2, NULL, 'N' );
INSERT INTO TB_GIFTICON VALUES(SEQ_GIFTICON_NO.NEXTVAL, 3, NULL, 'N' );
INSERT INTO TB_GIFTICON VALUES(SEQ_GIFTICON_NO.NEXTVAL, 4, NULL, 'N' );
INSERT INTO TB_GIFTICON VALUES(SEQ_GIFTICON_NO.NEXTVAL, 5, NULL, 'N' );
INSERT INTO TB_GIFTICON VALUES(SEQ_GIFTICON_NO.NEXTVAL, 6, NULL, 'N' );
INSERT INTO TB_GIFTICON VALUES(SEQ_GIFTICON_NO.NEXTVAL, 7, NULL, 'N' );
INSERT INTO TB_GIFTICON VALUES(SEQ_GIFTICON_NO.NEXTVAL, 8, NULL, 'N' );
INSERT INTO TB_GIFTICON VALUES(SEQ_GIFTICON_NO.NEXTVAL, 9, NULL, 'N' );
INSERT INTO TB_GIFTICON VALUES(SEQ_GIFTICON_NO.NEXTVAL, 10, NULL, 'N' );

/* SAMPLE DATA FAVORITE_LIST */

INSERT INTO TB_FAVORITE_LIST VALUES(1, '25437481', 1);
INSERT INTO TB_FAVORITE_LIST VALUES(2, '25305326', 2);
INSERT INTO TB_FAVORITE_LIST VALUES(3, '25437481', 3);
INSERT INTO TB_FAVORITE_LIST VALUES(4, '25437481', 4);
INSERT INTO TB_FAVORITE_LIST VALUES(5, '20399380', 5);
INSERT INTO TB_FAVORITE_LIST VALUES(6, '25305326', 6);
INSERT INTO TB_FAVORITE_LIST VALUES(7, '23253923', 7);
INSERT INTO TB_FAVORITE_LIST VALUES(8, '23253923', 8);
INSERT INTO TB_FAVORITE_LIST VALUES(9, '20399380', 9);
INSERT INTO TB_FAVORITE_LIST VALUES(10, '23253923', 10);

/* EVENT */

--CU
INSERT INTO TB_EVENT VALUES(SEQ_EVENT_NO.NEXTVAL, '라면 한 박스 이벤트', 3, '라면 이벤트 당첨자 뽑습니다!',SYSDATE + 1, SYSDATE +2, 5, DEFAULT, NULL,NULL,'N');
INSERT INTO TB_EVENT_JOIN VALUES(7,SEQ_EVENT_NO.CURRVAL);
INSERT INTO TB_EVENT_RESULT VALUES(SEQ_EVENT_RESULT_NO.NEXTVAL,SEQ_EVENT_NO.CURRVAL,'라면 한 박스 당첨자 발표',3,'당첨자 발표합니다',SYSDATE, DEFAULT,NULL,NULL,'N');

INSERT INTO TB_EVENT VALUES(SEQ_EVENT_NO.NEXTVAL, '카드할인 이벤트', 3, '제휴할인',SYSDATE + 1, SYSDATE +2, NULL, DEFAULT, NULL,NULL,'N');

INSERT INTO TB_EVENT VALUES(SEQ_EVENT_NO.NEXTVAL, '도시락 기프티콘 이벤트', 3, '기프티콘 받을사람 뽑습니다','2017-11-28', '2017-11-29', 3, DEFAULT, NULL,NULL,'N');
INSERT INTO TB_EVENT_JOIN VALUES(7,SEQ_EVENT_NO.CURRVAL);
INSERT INTO TB_EVENT_RESULT VALUES(SEQ_EVENT_RESULT_NO.NEXTVAL,SEQ_EVENT_NO.CURRVAL,'도시락 기프티콘 당첨자 발표', 3,'당첨자 발표합니다',SYSDATE, DEFAULT,NULL,NULL,'N');


--GS
INSERT INTO TB_EVENT VALUES(SEQ_EVENT_NO.NEXTVAL, '커피 한 컵 이벤트', 2, '커피한컵 이벤트 당첨자 뽑습니다!',SYSDATE + 1, SYSDATE +2, 10, DEFAULT, NULL,NULL,'N');
INSERT INTO TB_EVENT_JOIN VALUES(7,SEQ_EVENT_NO.CURRVAL);
INSERT INTO TB_EVENT_RESULT VALUES(SEQ_EVENT_RESULT_NO.NEXTVAL,SEQ_EVENT_NO.CURRVAL,'커피 한 컵 이벤트 당첨자 발표', 2,'당첨자 발표합니다',SYSDATE, DEFAULT,NULL,NULL,'N');

INSERT INTO TB_EVENT VALUES(SEQ_EVENT_NO.NEXTVAL, '카드할인 이벤트', 2, '제휴할인',SYSDATE + 1, SYSDATE +2, NULL, DEFAULT, NULL,NULL,'N');

INSERT INTO TB_EVENT VALUES(SEQ_EVENT_NO.NEXTVAL, '사이다 1+1 이벤트', 2, '기프티콘 받을사람 뽑습니다','2017-11-28', '2017-11-29', 10, DEFAULT, NULL,NULL,'N');
INSERT INTO TB_EVENT_JOIN VALUES(7,SEQ_EVENT_NO.CURRVAL);
INSERT INTO TB_EVENT_RESULT VALUES(SEQ_EVENT_RESULT_NO.NEXTVAL,SEQ_EVENT_NO.CURRVAL,'사이다 1+1이벤트 당첨자 발표', 2,'당첨자 발표합니다',SYSDATE, DEFAULT,NULL,NULL,'N');


--7eleven
INSERT INTO TB_EVENT VALUES(SEQ_EVENT_NO.NEXTVAL, '과자 한 박스 이벤트', 4, '과자 이벤트 당첨자 뽑습니다!',SYSDATE + 1, SYSDATE +2, 2, DEFAULT, NULL,NULL,'N');
INSERT INTO TB_EVENT_JOIN VALUES(7,SEQ_EVENT_NO.CURRVAL);
INSERT INTO TB_EVENT_RESULT VALUES(SEQ_EVENT_RESULT_NO.NEXTVAL,SEQ_EVENT_NO.CURRVAL,'과자 한 박스 이벤트 당첨자 발표', 4,'당첨자 발표합니다',SYSDATE, DEFAULT,NULL,NULL,'N');

INSERT INTO TB_EVENT VALUES(SEQ_EVENT_NO.NEXTVAL, '카드할인 이벤트', 4, '제휴할인',SYSDATE + 1, SYSDATE +2, NULL, 1, NULL,NULL,'N');

INSERT INTO TB_EVENT VALUES(SEQ_EVENT_NO.NEXTVAL, '콜라 기프티콘 이벤트', 4, '기프티콘 받을사람 뽑습니다','2017-11-28', '2017-11-29', 10, DEFAULT, NULL,NULL,'N');
INSERT INTO TB_EVENT_JOIN VALUES(7,SEQ_EVENT_NO.CURRVAL);
INSERT INTO TB_EVENT_RESULT VALUES(SEQ_EVENT_RESULT_NO.NEXTVAL,SEQ_EVENT_NO.CURRVAL,'콜라 기프티콘 이벤트 당첨자 발표', 4,'당첨자 발표합니다',SYSDATE, DEFAULT,NULL,NULL,'N');


--TB_SERVICE_CENTER
INSERT INTO TB_SERVICE_CENTER VALUES(1,'이벤트는 언제하나요', 1,'이벤트는 언제하나요', SYSDATE,1 , NULL, NULL,'N' );
INSERT INTO TB_SERVICE_CENTER VALUES(2,'회원가입오류', 1,'회원가입이 안됩니다.', SYSDATE, 2 , NULL, NULL,'N' );
INSERT INTO TB_SERVICE_CENTER VALUES(3,'이벤트 어디서 볼수 있나요.', 1,'이벤트 어디서 볼수 있나요.', SYSDATE,3 , NULL, NULL,'N' );
INSERT INTO TB_SERVICE_CENTER VALUES(4,'아이디/패스워드를 찾을수 없습니다', 1,'아이디/패스워드를 찾을수 없습니다', SYSDATE,3 , NULL, NULL,'N' );
INSERT INTO TB_SERVICE_CENTER VALUES(5,'이벤트당첨발표 언제인가요??', 1,'이벤트당첨발표 언제인가요??.', SYSDATE,3 , NULL, NULL,'N' );
INSERT INTO TB_SERVICE_CENTER VALUES(6,'내 정보변경은 어디서 할 수 있나요', 1,'로그인후 마이페이지에서 변경할 수 있습니다', SYSDATE,3 , NULL, NULL,'N' );
INSERT INTO TB_SERVICE_CENTER VALUES(7,'고객의 아이디가 휴면상태로뜹니다', 1,'6개월이상 미이용시 휴면상태가 됩니다.', SYSDATE,3 , NULL, NULL,'N' );


--TB_SERVICE_CENTER_COMMENT
INSERT INTO TB_SERVICE_CENTER_COMMENT VALUES(1,1,1,'매월1회 하고있습니다',SYSDATE,'N');
INSERT INTO TB_SERVICE_CENTER_COMMENT VALUES(1,2,1,'입력정보를 전부 작성해 주세요',SYSDATE,'N');
INSERT INTO TB_SERVICE_CENTER_COMMENT VALUES(1,3,1,'메인페이지에 있습니다.',SYSDATE,'N');
INSERT INTO TB_SERVICE_CENTER_COMMENT VALUES(1,4,1,'홈페이지상에 등록된 고객정보 중 일부가 일치 하지 않는 경우 입니다.',SYSDATE,'N');
INSERT INTO TB_SERVICE_CENTER_COMMENT VALUES(1,5,1,'3일후 이벤트 당첨 발표입니다.',SYSDATE,'N');
INSERT INTO TB_SERVICE_CENTER_COMMENT VALUES(1,6,1,'로그인후 마이페이지에서 변경할 수 있습니다',SYSDATE,'N');
INSERT INTO TB_SERVICE_CENTER_COMMENT VALUES(1,7,1,'6개월이상 미이용시 휴면상태가 됩니다..',SYSDATE,'N');

--TB_BOARD
INSERT INTO TB_BOARD VALUES (1,'아침 이벤트 하나요?',1,'월요일부터 금요일까지 역삼역 근처 편의점에서 아침 할인 이벤트 하나요? 하면 편의점마다 얼마씩 하는지 알 수 있을까요? 점포마다 차이가 나는 건가요?',SYSDATE,0,NULL,NULL, DEFAULT); /* 사용자 - 일반 사용자*/
INSERT INTO TB_BOARD VALUES (2,'편의점에서 즉석요리 할 수 있는 거 뭐뭐 있음? ',1,'얼마 내서 맛있게 만들어 보려는데 추천좀',SYSDATE, 0, NULL, NULL, DEFAULT); /* 시용자 - 일반 사용자*/
INSERT INTO TB_BOARD VALUES (3,'가끔씩은 편의점 바로 타먹는 맥심커피를 마시는 것도 좋네요~',3,'사진 이미지 : 바닷가를 바라보면서 맥심 커피를 마시고 있는 이나영',SYSDATE, 0, NULL, NULL, DEFAULT); /* 사용자 - 일반 사용자*/
INSERT INTO TB_BOARD VALUES (4,'요새 신맛나는 우유가 유행인가요?',2,'오미남, 오미녀 이런 것도 있네요',SYSDATE, 0, NULL, NULL, DEFAULT); /* 사용자 - 일반 사용자*/
INSERT INTO TB_BOARD VALUES (5,'매장에서 제일 잘 나가는 식품이 뭐가 있나요?',4,'저희는 천왕역 바로 아래에서 운영하고 있는데 지금 어떤 게 제일 잘  팔리는 지 모르겠어요. 잇님들은 이런 겨울에 어떻게 운영하시나요?',SYSDATE, 0, NULL, NULL, DEFAULT); /* 사용자 - 지점관리자*/
INSERT INTO TB_BOARD VALUES (6,'매장 리모델링',1,'집에 붙어있는 편의점인데 어떻게 꾸미는 게 좋을까요? ',SYSDATE, 0, NULL, NULL, DEFAULT); /* 사용자 - 지점 관리자*/
INSERT INTO TB_BOARD VALUES (7,'도시락같은 걸 편의점에서 배달시킬 수 있습니까?',2,'직원이 30명정도 되는데 오늘 하루만 전화주문해서 배달시켜도 될까요?',SYSDATE, 0, NULL, NULL, DEFAULT); /* 사용자 - 일반 고객*/
INSERT INTO TB_BOARD VALUES (8,'페이코 티머니 추가 할인 어떻게 받아요?',3,'저번에 물어보니까 다른 것보다 10% 더 할인이 된다고 하던데 어떻게 하는지 잘 모르겠어요. 잇님들 페이코 티머니는 편의점에서 등록해야 하나요?',SYSDATE, 0, NULL, NULL, DEFAULT); /*사용자 -일반고객*/
INSERT INTO TB_BOARD VALUES (9,'lg 와이파이 무제한 쿠폰 어떻게 사요?',2,'한정 판매라고 하던데 통신사가 LG U+면 모두 가입할 수 있는 건가요?',SYSDATE, 0, NULL, NULL, DEFAULT); /* 사용자 - 일반 고객*/
INSERT INTO TB_BOARD VALUES (10,'편의점 택배 붙이면 얼마만에 배송되나요?',3,'보통 택배하고 똑같이 배송되나요?',SYSDATE, 0, NULL, NULL, DEFAULT); /*사용자 - 일반 고객*/
COMMIT;


