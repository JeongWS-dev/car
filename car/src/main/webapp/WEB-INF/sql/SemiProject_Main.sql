-- 회원 테이블
create table tbl_User    
(Pk_UserId             VARCHAR2(30)   not null  -- 회원아이디
,UserPwd               VARCHAR2(30)   not null  -- 비밀번호 (SHA-256 암호화 대상)
,UserName              NVARCHAR2(15)  not null  -- 회원명
,UserEmail             VARCHAR2(100)  not null  -- 이메일 (AES-256 암호화/복호화 대상)
,UserMobile            VARCHAR2(11)   not null  -- 연락처 (AES-256 암호화/복호화 대상)
,UserJubun             VARCHAR2(13)   not null  -- 주민등록번호
,Userpostcode          VARCHAR2(5)              -- 우편번호
,UserAddress           VARCHAR(200)             -- 주소
,UserDetailAddress     VARCHAR2(200)            -- 상세주소
,UserExtraAddress      VARCHAR2(200)            -- 참고항목
,UserGender            VARCHAR2(4)              -- 성별   남 / 여
,UserRegisterday       DATE default sysdate     -- 가입일자  
,UserLastChangePwd     DATE default sysdate     -- 마지막 비밀번호 변경일자
,UserStatus            NUMBER(1) default 1 not null     -- 회원탈퇴유무   1: 사용가능(가입중) / 0:사용불능(탈퇴) 
,UserIdle              NUMBER(1) default 0 not null     -- 휴면유무      0 : 활동중  /  1 : 휴면중 
,constraint PK_tbl_User_Pk_UserId primary key(Pk_UserId)
,constraint UQ_tbl_User_UserEmail  unique(UserEmail)
,constraint CK_tbl_User_UserGender check( UserGender in('남','여') )
,constraint CK_tbl_User_UserStatus check( UserStatus in(0,1) )
,constraint CK_tbl_User_UserIdle check( UserIdle in(0,1) )
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 -- 차량 테이블
create table tbl_car
(Pk_CarName   VARCHAR2(20)  not null -- 차량이름
,CarPrice     NUMBER        not null -- 차량가격
,CarType      NVARCHAR2(10) not null -- 차종
,constraint Pk_tbl_car_Pk_CarName primary key(Pk_CarName)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 옵션_선택품목 테이블
create table tbl_Option 
(Pk_OptionCode   VARCHAR2(300)  not null -- 선택품목코드  
,Fk_CarName  VARCHAR2(20)       not null -- 차량이름
,Option_Img   VARCHAR2(300)   not null -- 품목 사진
,OptionDesc    VARCHAR2(300) -- 품목 설명
,OptionPrice    NUMBER default 0 -- 옵션가격
,constraint Pk_tbl_Option_Pk_OptionCode primary key(Pk_OptionCode)
,constraint Fk_tbl_Option_Fk_CarName foreign key(Fk_CarName) references tbl_car(Pk_CarName)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 내 선택품목 테이블
create table tbl_MyOption
(Pk_MyOptionSeq   NUMBER           -- 선택품목 시퀀스
,Fk_PaperSeq      NUMBER
,Fk_OptionCode    VARCHAR2(300)
,constraint  PK_tbl_MyOption primary key(Pk_MyOptionSeq)
,constraint  FK_tbl_MyOption_Fk_PaperSeq foreign key(Fk_PaperSeq) references tbl_Paper(Pk_PaperSeq)
,constraint  FK_tbl_MyOption_Fk_OptionCode foreign key(Fk_OptionCode) references tbl_Option(Pk_OptionCode)
);

create sequence Pk_MyOptionSeq;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 파워트레인 테이블
create table tbl_powertrain 
(Pk_PowertrainCode         VARCHAR2(300)    
,Fk_CarName                VARCHAR2(20)      not null
,PowerTrainMain_Img        VARCHAR2(200)     not null
,PowerTrainIcon_Img        VARCHAR2(200)     not null
,PowerTrainPrice           NUMBER     default 0
,PowerTrainDesc            VARCHAR2(300)    
,constraint PK_tbl_powertrain_Pk_PowertrainCode primary key(Pk_PowertrainCode)
,constraint FK_tbl_powertrain_Fk_CarName foreign key(Fk_CarName) references tbl_car(Pk_CarName)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- FAQ 테이블
create table tbl_FAQ
(Pk_FAQSeq            NUMBER(5)          
,FAQTitle             VARCHAR2(150)      not null 
,FAQContent           VARCHAR2(3000)     not null
,constraint PK_tbl_FAQ_Pk_FAQSeq primary key(Pk_FAQSeq)
);


create sequence Pk_FAQSeq; -- Pk_FAQSeq 시퀀스

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 옵션_내장디자인컬러 테이블 생성
create table tbl_InsideColor
(Pk_InsideColorCode          VARCHAR2(300)                  --내장디자인 코드  pk            
,Fk_CarName                  VARCHAR2(20)  not null         --차량 이름       fk
,InsideColorIcon_Img         VARCHAR2(300) not null         --내장컬러 아이콘 사진
,InsideColorCar_Img          VARCHAR2(300) not null         --내장컬러별 차량 사진
,InsideColorPrice            NUMBER        default 0        --내장컬러 가격
,registerday  date default sysdate not null 
,updateday    date 
,constraint PK_tbl_InsideColor_InsideColorCode primary key(Pk_InsideColorCode)
,constraint FK_tbl_InsideColor_fk_CarName foreign key(Fk_CarName) references tbl_InsideColor(Fk_CarName) 
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 옵션_외장디자인컬러 테이블 생성
create table tbl_OutsideColor
(Pk_OutsideColorCode          VARCHAR2(300)             --외장디자인 코드  pk
,Fk_CarName                   VARCHAR2(20)  not null    --차량 이름       fk
,OutsideColorIcon_Img         VARCHAR2(300) not null    --외장컬러 아이콘 사진
,OutsideColorCar_Img          VARCHAR2(300) not null    --외장컬러별 차량 사진
,OutsideColorPrice            NUMBER        default 0   --외장컬러 가격
,constraint PK_tbl_OutsideColor_OutsideColorCode primary key(Pk_OutsideColorCode)
,constraint FK_tbl_OutsideColor_fk_CarName foreign key(Fk_CarName) references tbl_OutsideColor(Fk_CarName)
);

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 내 견적서 생성
create table tbl_Paper
(Pk_PaperSeq                NUMBER                          --견적서 번호    pk
,Fk_UserId                  VARCHAR2(30)    not null        --유저아이디     fk
,Fk_CarName                 VARCHAR2(20)    not null        --차량 이름      fk
,Fk_InsideColorCode         VARCHAR2(20)    not null        --내장디자인 코드  fk
,Fk_PowertrainCode          VARCHAR2(300)   not null        --엔진코드        fk 
,Fk_OutsideColorCode        VARCHAR2(300)   not null        --외장디자인 코드  fk
,constraint PK_tbl_Paper_PaperSeq primary key(Pk_PaperSeq)
,constraint FK_tbl_Paper_fk_UserId foreign key(Fk_UserId) references tbl_Paper(Fk_UserId) 
,constraint FK_tbl_Paper_fk_CarName foreign key(Fk_CarName) references tbl_Paper(Fk_CarName) 
,constraint FK_tbl_Paper_fk_InsideColorCode foreign key(Fk_InsideColorCode) references tbl_Paper(Fk_InsideColorCode) 
,constraint FK_tbl_Paper_fk_PowertrainCode foreign key(Fk_PowertrainCode) references tbl_Paper(Fk_PowertrainCode) 
,constraint FK_tbl_Paper_fk_OutsideColorCode foreign key(Fk_OutsideColorCode) references tbl_Paper(Fk_OutsideColorCode) 
);

-- 내 견적서 시퀀스
create sequence Pk_PaperSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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
create sequence PK_LoginSeq;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- QnA 테이블 생성
 create table tbl_QnA
 (Pk_QnASeq NUMBER  not null
 , FK_Userid  VARCHAR2(30)    not null
 ,QnAWriteDate DATE     not null
 , QnATitle VARCHAR2(150)   not null
 , QnAContent VARCHAR2(30000)   not null
 , QnAPwd VARCHAR2(20)   not null
  ,constraint  PK_tbl_QnA_Pk_QnASeq primary key(Pk_QnASeq)
,constraint  FK_tbl_QnA_FK_Userid foreign key(Fk_Userid) references tbl_user(Pk_Userid)
 );

 -- QnA 시퀀스 생성
 create sequence PK_QnASeq;