--------------------------------------------레시피찜 ↗-----------------------------------------------------------------

--DROP TABLE ZZIM;
--DROP SEQUENCE ZZIMSEQ;

CREATE SEQUENCE ZZIMSEQ;

CREATE TABLE ZZIM (
SEQ NUMBER NOT NULL,
ID VARCHAR2(100) NOT NULL ,    -- USERID
RECIPE_ID NUMBER NOT NULL,--레시피코드
RECIPE_NM_KO VARCHAR2(400) NOT NULL,
PRIMARY KEY(RECIPE_ID,RECIPE_NM_KO),
CONSTRAINT CON_ZZIMID FOREIGN KEY(ID) REFERENCES LOGIN(ID),
CONSTRAINT CON_ZZIMRECIP FOREIGN KEY(RECIPE_ID) REFERENCES RECIPE_INFO(RECIPE_ID)
);



--INSERT INTO ZZIM VALUES(ZZIMSEQ.NEXTVAL,'yyon8810',4,'콩나물밥');
--DELETE FROM ZZIM WHERE RECIPE_NM_KO = '콩나물밥';
--SELECT RECIPE_NM_KO FROM RECIPE_INFO WHERE RECIPE_ID = 4;
--select * from zzim;