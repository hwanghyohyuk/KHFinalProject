--이벤트 테이블, 결과 테이블, 참여테이블(TB_EVENT,TB_EVENT_RESULT,TB_EVENT_JOIN)
-- ? ->WRITER
-- # ->USER_NO
--CU
insert into TB_EVENT values(SEQ_EVENT_NO.NEXTVAL, '라면 한 박스 이벤트', ?, '라면 이벤트 당첨자 뽑습니다!',SYSDATE + 1, SYSDATE +2, 5, default, null,null,'N');
insert into TB_EVENT_JOIN values(#,SEQ_EVENT_NO.CURRVAL);
insert into TB_EVENT_RESULT values(SEQ_EVENT_RESULT_NO.NEXTVAL,SEQ_EVENT_NO.CURRVAL,'라면 한 박스 당첨자 발표',?,'당첨자 발표합니다',sysdate, default,null,null,'N');


insert into TB_EVENT values(SEQ_EVENT_NO.NEXTVAL, '카드할인 이벤트', ?, '제휴할인',SYSDATE + 1, SYSDATE +2, null, default, null,null,'N');

insert into TB_EVENT values(SEQ_EVENT_NO.NEXTVAL, '도시락 기프티콘 이벤트', ?, '기프티콘 받을사람 뽑습니다','2017-11-28', '2017-11-29', 3, default, null,null,'N');
insert into TB_EVENT_JOIN values(#,SEQ_EVENT_NO.CURRVAL);
insert into TB_EVENT_RESULT values(SEQ_EVENT_RESULT_NO.NEXTVAL,SEQ_EVENT_NO.CURRVAL+1,'도시락 기프티콘 당첨자 발표', ?,'당첨자 발표합니다',sysdate, default,null,null,'N');



--GS
insert into TB_EVENT values(SEQ_EVENT_NO.NEXTVAL, '커피 한 컵 이벤트', ?, '커피한컵 이벤트 당첨자 뽑습니다!',SYSDATE + 1, SYSDATE +2, 10, default, null,null,'N');
insert into TB_EVENT_JOIN values(#,SEQ_EVENT_NO.CURRVAL);
insert into TB_EVENT_RESULT values(SEQ_EVENT_RESULT_NO.NEXTVAL,SEQ_EVENT_NO.CURRVAL,'커피 한 컵 이벤트 당첨자 발표', ?,'당첨자 발표합니다',sysdate, default,null,null,'N');

insert into TB_EVENT values(SEQ_EVENT_NO.NEXTVAL, '카드할인 이벤트', ?, '제휴할인',SYSDATE + 1, SYSDATE +2, null, default, null,null,'N');

insert into TB_EVENT values(SEQ_EVENT_NO.NEXTVAL, '사이다 1+1 이벤트', ?, '기프티콘 받을사람 뽑습니다','2017-11-28', '2017-11-29', 10, default, null,null,'N');
insert into TB_EVENT_JOIN values(#,SEQ_EVENT_NO.CURRVAL);
insert into TB_EVENT_RESULT values(SEQ_EVENT_RESULT_NO.NEXTVAL,SEQ_EVENT_NO.CURRVAL,'사이다 1+1이벤트 당첨자 발표', ?,'당첨자 발표합니다',sysdate, default,null,null,'N');


--7eleven
insert into TB_EVENT values(SEQ_EVENT_NO.NEXTVAL, '과자 한 박스 이벤트', ?, '과자 이벤트 당첨자 뽑습니다!',SYSDATE + 1, SYSDATE +2, 2, default, null,null,'N');
insert into TB_EVENT_JOIN values(#,SEQ_EVENT_NO.CURRVAL);
insert into TB_EVENT_RESULT values(SEQ_EVENT_RESULT_NO.NEXTVAL,SEQ_EVENT_NO.CURRVAL,'과자 한 박스 이벤트 당첨자 발표', ?,'당첨자 발표합니다',sysdate, default,null,null,'N');

insert into TB_EVENT values(SEQ_EVENT_NO.NEXTVAL, '카드할인 이벤트', ?, '제휴할인',SYSDATE + 1, SYSDATE +2, null, 1, null,null,'N');

insert into TB_EVENT values(SEQ_EVENT_NO.NEXTVAL, '콜라 기프티콘 이벤트', ?, '기프티콘 받을사람 뽑습니다','2017-11-28', '2017-11-29', 10, default, null,null,'N');
insert into TB_EVENT_JOIN values(#,SEQ_EVENT_NO.CURRVAL);
insert into TB_EVENT_RESULT values(SEQ_EVENT_RESULT_NO.NEXTVAL,SEQ_EVENT_NO.CURRVAL,'콜라 기프티콘 이벤트 당첨자 발표', ?,'당첨자 발표합니다',sysdate, default,null,null,'N');


COMMIT;

