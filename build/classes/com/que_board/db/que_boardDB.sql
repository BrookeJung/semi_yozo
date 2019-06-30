
-----------------------------------------------------게시판

-----------------------------------------------------------------------------------------------------------테이블 다시만듦 !

--DROP SEQUENCE BOARDnoSQ;
--DROP SEQUENCE GROUPnoSQ;
--DROP TABLE QUEBOARD;

CREATE SEQUENCE BOARDNOSQ;
CREATE SEQUENCE GROUPNOSQ; 

CREATE TABLE QUEBOARD(
BOARDNO NUMBER PRIMARY KEY,
GROUPNO NUMBER NOT NULL,
GROUPSQ NUMBER NOT NULL,
REPLYNO NUMBER ,
SECFLAG VARCHAR2(2) ,
WRITER VARCHAR2(2000) NOT NULL,
TITLE VARCHAR2(3000),
CONTENT CLOB,
REGDATE DATE NOT NULL,
CONSTRAINT SECFLAG_CHK CHECK (SECFLAG IN('Y','N'))
);
-------------------TEST 용 ------------------------------------
INSERT INTO QUEBOARD VALUES(BOARDNOSQ.NEXTVAL,GROUPNOSQ.NEXTVAL,1,0,'N','asdf','안녕하세요','문의글입니다.',SYSDATE);

UPDATE QUEBOARD SET REPLYNO = REPLYNO+1 WHERE BOARDNO = 8;
---------------------------------------------------------------------------------------------
SELECT * FROM QUEBOARD;



	