-- 차량 이름 변경 시작 --

-- 외래키 제약조건이 있을 때 부모테이블, 자식테이블 변경 방법
/*
1. 외래 키 제약 조건을 일시적으로 비활성화
 2 . 부모 테이블의 기본 키 값 변경
3. 자식 테이블의 외래 키 값 변경
4. 외래 키 제약 조건을 다시 활성화
*/
select *
from TBL_CAR;

select *
from tbl_power;

select *
from TBL_INCOLOR;

select *
from TBL_OUTCOLOR;

SELECT *
FROM TBL_OPTION;

SELECT constraint_name, constraint_type, table_name
FROM ALL_CONSTRAINTS
WHERE constraint_type = 'R' and table_name='TBL_OPTION';

--1. 외래 키 제약 조건을 일시적으로 비활성화
ALTER TABLE TBL_POWER DISABLE CONSTRAINT FK_TBL_POWER_FK_CARNAME;
ALTER TABLE TBL_INCOLOR DISABLE CONSTRAINT FK_TBL_INCOLOR_FK_CARNAME;
ALTER TABLE TBL_OUTCOLOR DISABLE CONSTRAINT FK_TBL_OUTCOLOR_FK_CARNAME;
ALTER TABLE TBL_OPTION DISABLE CONSTRAINT FK_TBL_OPTION_FK_CARNAME;

--2. 부모 테이블의 기본 키 값 변경
update TBL_CAR set Pk_CarName = 'G90_BLACK' where Pk_CarName='G90 BLACK';
update TBL_CAR set Pk_CarName = 'G90_LONG_WHEEL_BASE' where Pk_CarName='G90 LONG WHEEL BASE';
update TBL_CAR set Pk_CarName = 'G80_ELECTRIFIED' where Pk_CarName='G80 ELECTRIFIED';
update TBL_CAR set Pk_CarName = 'G70_SHOOTING_BRAKE' where Pk_CarName='G70 SHOOTING BRAKE';
update TBL_CAR set Pk_CarName = 'GV80_COUPE' where Pk_CarName='GV80 COUPE';
update TBL_CAR set Pk_CarName = 'GV70_ELECTRIFIED' where Pk_CarName='GV70 ELECTRIFIED';

--3. 자식 테이블의 외래 키 값 변경
UPDATE TBL_POWER SET Fk_CarName = 'G90_BLACK' WHERE Fk_CarName = 'G90 BLACK';
UPDATE TBL_INCOLOR SET Fk_CarName = 'G90_BLACK' WHERE Fk_CarName = 'G90 BLACK';
UPDATE TBL_OUTCOLOR SET Fk_CarName = 'G90_BLACK' WHERE Fk_CarName = 'G90 BLACK';
UPDATE TBL_OPTION SET Fk_CarName = 'G90_BLACK' WHERE Fk_CarName = 'G90 BLACK';

--4. 외래 키 제약 조건 다시 활성화
ALTER TABLE TBL_POWER ENABLE CONSTRAINT FK_TBL_POWER_FK_CARNAME;
ALTER TABLE TBL_INCOLOR ENABLE CONSTRAINT FK_TBL_INCOLOR_FK_CARNAME;
ALTER TABLE TBL_OUTCOLOR ENABLE CONSTRAINT FK_TBL_OUTCOLOR_FK_CARNAME;
ALTER TABLE TBL_OPTION ENABLE CONSTRAINT FK_TBL_OPTION_FK_CARNAME;

COMMIT;

-- 차량 이름 변경 완료 끝 --

ROLLBACK;


-- tbl_car(차량) 테이블에 CarPoint 컬럼 추가(초기값 GENERAL)
ALTER TABLE tbl_car ADD CarPoint VARCHAR2(20) DEFAULT 'GENERAL';

select *
from TBL_CAR;

update TBL_CAR set CarPoint = 'BLACK' where Pk_CarName='G90_BLACK';
update TBL_CAR set CarPoint = 'LONG_WHEEL_BASE' where Pk_CarName='G90_LONG_WHEEL_BASE';
update TBL_CAR set CarPoint = 'ELECTRIFIED' where Pk_CarName='G80_ELECTRIFIED';
update TBL_CAR set CarPoint = 'SHOOTING_BRAKE' where Pk_CarName='G70_SHOOTING_BRAKE';
update TBL_CAR set CarPoint = 'COUPE' where Pk_CarName='GV80_COUPE';
update TBL_CAR set CarPoint = 'ELECTRIFIED' where Pk_CarName='GV70_ELECTRIFIED';

COMMIT;

select PK_CARNAME , CarPoint 
from TBL_CAR

-- tbl_car(차량) 테이블에 CarLogo 컬럼 추가
ALTER TABLE tbl_car ADD CarLogo VARCHAR2(20);

select *
from TBL_CAR;

update TBL_CAR set CarLogo = 'NEW' where Pk_CarName='G90_BLACK';
update TBL_CAR set CarLogo = 'NEW' where Pk_CarName='GV70';
update TBL_CAR set CarLogo = 'EV' where Pk_CarName='G80_ELECTRIFIED';
update TBL_CAR set CarLogo = 'EV' where Pk_CarName='GV70_ELECTRIFIED';
update TBL_CAR set CarLogo = 'EV' where Pk_CarName='GV60';

select *
from TBL_CAR;

COMMIT;


