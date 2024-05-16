 -- 로그인 기록 테이블 생성
 create table tbl_login_log
 (PK_LoginSeq   NUMBER  not null
 , FK_Userid  VARCHAR2(30)    not null
 ,ipAddress VARCHAR2(40)    not null
 , LoginDate    DATE    not null
 ,constraint  PK_tbl_login_log_PK_LoginSeq primary key(Pk_LoginSeq)
,constraint  FK_tbl_login_log_FK_Userid foreign key(Fk_Userid) references tbl_user(Pk_Userid)
 );
 
 -- 로그인 기록 시퀀스 생성
 create sequence PK_LoginSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;

-- QnA 테이블 생성
 create table tbl_QnA
 (
 FK_Userid  VARCHAR2(30)    not null
 ,QnAWriteDate DATE     not null
 , QnATitle VARCHAR2(150)   not null
 , QnAContent VARCHAR2(30000)   not null
 , QnAPwd VARCHAR2(20)   not null
 );

 -- QnA 시퀀스 생성
 create sequence PK_QnASeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle
nocache;
