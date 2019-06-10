DROP TABLE LOGIN;
DROP SEQUENCE LOGINSEQ;

CREATE SEQUENCE LOGINSEQ;

CREATE TABLE LOGIN(
	USERSEQ NUMBER PRIMARY KEY,
	NAME VARCHAR2(100) NOT NULL,
	ID VARCHAR2(100) NOT NULL,
	PW VARCHAR2(50) NOT NULL,
	ADDR VARCHAR2(1000) NOT NULL,
	EMAIL VARCHAR2(100) NOT NULL,
	CONSTRAINT CON_ID UNIQUE(ID)
);

INSERT INTO LOGIN
VALUES(LOGINSEQ.NEXTVAL,'정햇나라','ASDF','ASDF','경기도 성남시 중원구','ASDF@ASDF');

SELECT * FROM LOGIN;


DROP SEQUENCE BOARDNOSEQ;
DROP TABLE BOARD;

--글 번호 시퀀스
CREATE SEQUENCE BOARDNOSEQ;


CREATE TABLE BOARD(
	BOARDNO NUMBER PRIMARY KEY,
	WRITER VARCHAR2(1000) NOT NULL,
	TITLE VARCHAR2(1000) NOT NULL,
	CONTENT VARCHAR2(4000) NOT NULL,
	REGDATE DATE NOT NULL
);

INSERT INTO BOARD
VALUES(BOARDNOSEQ.NEXTVAL,'작성자','안녕','하세요',SYSDATE);

SELECT * FROM BOARD;
