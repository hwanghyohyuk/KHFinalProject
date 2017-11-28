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