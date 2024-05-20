-- 회원 테이블 (생성 완료)
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

 -- 차량 테이블 (생성 완료)
create table tbl_car
(Pk_CarName   VARCHAR2(20)  not null -- 차량이름
,CarPrice     NUMBER        not null -- 차량가격
,CarType      NVARCHAR2(10) not null -- 차종
,constraint Pk_tbl_car_Pk_CarName primary key(Pk_CarName)
);

select pk_carName, carPrice
from tbl_car
where pk_carName = 'G90';

insert into tbl_car(Pk_CarName,CarPrice,CarType)values('G90 BLACK','138000000','SEDAN');
insert into tbl_car(Pk_CarName,CarPrice,CarType)values('G90','95400000','SEDAN');
insert into tbl_car(Pk_CarName,CarPrice,CarType)values('G90 LONG WHEEL BASE','167200000','SEDAN');
insert into tbl_car(Pk_CarName,CarPrice,CarType)values('G80','58900000','SEDAN');
insert into tbl_car(Pk_CarName,CarPrice,CarType)values('G80 ELECTRIFIED','88210000','SEDAN');
insert into tbl_car(Pk_CarName,CarPrice,CarType)values('G70','43470000','SEDAN');
insert into tbl_car(Pk_CarName,CarPrice,CarType)values('G70 SHOOTING BRAKE','45450000','SEDAN');

insert into tbl_car(Pk_CarName,CarPrice,CarType)values('GV80','69300000','SUV');
insert into tbl_car(Pk_CarName,CarPrice,CarType)values('GV80 COUPE','82550000','SUV');
insert into tbl_car(Pk_CarName,CarPrice,CarType)values('GV70','53800000','SUV');
insert into tbl_car(Pk_CarName,CarPrice,CarType)values('GV70 ELECTRIFIED','77230000','SUV');
insert into tbl_car(Pk_CarName,CarPrice,CarType)values('GV60','67760000','SUV');

select *
from tbl_car;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 옵션_선택품목 테이블 (생성 완료)
create table tbl_Option 
(Pk_OptionCode   VARCHAR2(300)  not null -- 선택품목코드  
,Fk_CarName  VARCHAR2(20)       not null -- 차량이름
,Option_Img   VARCHAR2(300)   not null -- 품목 사진
,OptionDesc    VARCHAR2(300) -- 품목 설명
,OptionDetailDesc VARCHAR2(4000) -- 품목 상세설명
,OptionPrice    NUMBER default 0 -- 옵션가격
,constraint Pk_tbl_Option_Pk_OptionCode primary key(Pk_OptionCode)
,constraint Fk_tbl_Option_Fk_CarName foreign key(Fk_CarName) references tbl_car(Pk_CarName)
);

insert into tbl_Option(Pk_OptionCode,Fk_CarName,Option_Img,OptionDesc,OptionPrice,OptionDetailDesc) values('G90_Black_ChoiceOption_built-in-cam','G90 BLACK','G90_Black_ChoiceOption_built-in-cam.jpg','파노라마 선루프','2000000','탁 트인 개방감을 선사하여 채광과 환기 효과를 더하며, 선루프 무드조명을 추가하여 고급감 및 편의성을 향상시켰습니다.');
insert into tbl_Option(Pk_OptionCode,Fk_CarName,Option_Img,OptionDesc,OptionPrice,OptionDetailDesc) values('G90_Black_ChoiceOption_panorama','G90 BLACK','G90_Black_ChoiceOption_panorama.jpg','빌트인 캠 패키지','800000','차량의 트림을 제거할 필요 없이 빌트인 적용된 주행 중 영상기록장치로, AVN 화면을 통해 영상을 바로 확인할 수 있을 뿐만 아니라 스마트폰 앱 연동을 통해 영상 확인 및 SNS 공유가 가능합니다. 주행뿐만 아니라 주차 상황에서도 최대 12시간까지 녹화가 가능합니다.');
insert into tbl_Option(Pk_OptionCode,Fk_CarName,Option_Img,OptionDesc,OptionPrice,OptionDetailDesc) values('G90_Black_ChoiceOption_protection-film','G90 BLACK','G90_Black_ChoiceOption_protection-film.jpg','차량 보호 필름(제네시스 액세서리)','540000','카라이프 중 손상되기 쉬운 프론트 & 리어 범퍼등 8부위에 우레탄 계열의 투명한 보호필름을 부착하여 스톤칩으로 인한 페인트 손상 및 생활 스크래치를 예방하여 깨끗한 바디를 유지할 수 있도록 합니다. 또한 3년/6만km의 보증을 제공해드립니다.');

select *
from tbl_Option;

select *
from tbl_car;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 내 선택품목 테이블(생성 완료)
create table tbl_MyOption
(Pk_MyOptionSeq   NUMBER           -- 선택품목 시퀀스
,Fk_PaperSeq      NUMBER
,Fk_OptionCode    VARCHAR2(300)
,constraint  PK_tbl_MyOption primary key(Pk_MyOptionSeq)
,constraint  FK_tbl_MyOption_Fk_PaperSeq foreign key(Fk_PaperSeq) references tbl_Paper(Pk_PaperSeq)
,constraint  FK_tbl_MyOption_Fk_OptionCode foreign key(Fk_OptionCode) references tbl_Option(Pk_OptionCode)
);

-- 내 선택품목 시퀀스(생성 완료)
create sequence Pk_MyOptionSeq;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 파워트레인 테이블 (생성 완료)
create table tbl_power
(Pk_PowerCode         VARCHAR2(300)    
,Fk_CarName                VARCHAR2(20)      not null
,PowerMain_Img        VARCHAR2(200)     not null
,PowerIcon_Img        VARCHAR2(200)     not null
,PowerPrice           NUMBER     default 0
,PowerDesc            VARCHAR2(300)    
,constraint PK_tbl_power_Pk_PowerCode primary key(Pk_PowerCode)
,constraint FK_tbl_power_Fk_CarName foreign key(Fk_CarName) references tbl_car(Pk_CarName)
);

insert into tbl_power(Pk_PowerCode, Fk_CarName,PowerMain_Img,PowerIcon_Img,PowerDesc) values ('G90_BLACK_POWER','G90 BLACK','G90_BLACK_POWER.png','G90_BLACK_POWER_Icon.png','가솔린 3.5 터보 48V 일렉트릭 슈퍼차저');

insert into tbl_power(Pk_PowerCode, Fk_CarName,PowerMain_Img,PowerIcon_Img,PowerDesc,PowerPrice) values ('G90_PowerTrain_3.5t_48V_ET','G90','G90_PowerTrain_3.5t_48V_ET_Main.png','G90_PowerTrain_3.5t_48V_ET_Icon.png','가솔린 3.5 터보 48V 일렉트릭 슈퍼차저',6000000);
insert into tbl_power(Pk_PowerCode, Fk_CarName,PowerMain_Img,PowerIcon_Img,PowerDesc) values ('G90_PowerTrain_3.5T','G90','G90_PowerTrain_3.5T_main.png','G90_PowerTrain_3.5T_Icon.png','가솔린 3.5 터보');

select PowerPrice
from tbl_power
where powerdesc = '가솔린 3.5 터보 48V 일렉트릭 슈퍼차저' and fk_carname = 'G90';

commit;
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
 
-- FAQ 테이블 (생성 완료)
create table tbl_FAQ
(Pk_FAQSeq            NUMBER(5)          
,FAQTitle             VARCHAR2(150)      not null 
,FAQContent           VARCHAR2(3000)     not null
,constraint PK_tbl_FAQ_Pk_FAQSeq primary key(Pk_FAQSeq)
);


create sequence Pk_FAQSeq; -- Pk_FAQSeq 시퀀스 (생성 완료)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 옵션_내장디자인컬러 테이블 생성 (생성 완료)
create table tbl_InColor
(Pk_InColorCode          VARCHAR2(300)                  --내장디자인 코드  pk            
,Fk_CarName              VARCHAR2(20)  not null         --차량 이름       fk
,InColorIcon_Img         VARCHAR2(300) not null         --내장컬러 아이콘 사진
,InColorCar_Img          VARCHAR2(300) not null         --내장컬러별 차량 사진
,InColorPrice            NUMBER        default 0        --내장컬러 가격
,InColorDesc             VARCHAR2(300)
,constraint PK_tbl_InColor_InColorCode primary key(Pk_InColorCode)
,constraint FK_tbl_InColor_fk_CarName foreign key(Fk_CarName) references tbl_car(Pk_CarName) 
);

insert into tbl_incolor (Pk_InColorCode,Fk_CarName,InColorIcon_Img,InColorCar_Img,InColorPrice,InColorDesc) values('G90_inside_sds_beige_two_tone_Icon','G90','G90_inside_sds_beige_two_tone_Icon.jpg','',,'');
insert into tbl_incolor (Pk_InColorCode,Fk_CarName,InColorIcon_Img,InColorCar_Img,InColorPrice,InColorDesc) values('G90_inside_sds_black_mono_tone_Icon','G90','G90_inside_sds_black_mono_tone_Icon.jpg','',,'');
insert into tbl_incolor (Pk_InColorCode,Fk_CarName,InColorIcon_Img,InColorCar_Img,InColorPrice,InColorDesc) values('G90_inside_sds_brown_two_tone_Icon','G90','G90_inside_sds_brown_two_tone_Icon.jpg','',,'');
insert into tbl_incolor (Pk_InColorCode,Fk_CarName,InColorIcon_Img,InColorCar_Img,InColorPrice,InColorDesc) values('G90_inside_sds_gray_two_tone_Icon','G90','G90_inside_sds_gray_two_tone_Icon.jpg','',,'');
insert into tbl_incolor (Pk_InColorCode,Fk_CarName,InColorIcon_Img,InColorCar_Img,InColorPrice,InColorDesc) values('G90_inside_sds_white_two_tone_Icon','G90','G90_inside_sds_white_two_tone_Icon.jpg','',,'');
insert into tbl_incolor (Pk_InColorCode,Fk_CarName,InColorIcon_Img,InColorCar_Img,InColorPrice,InColorDesc) values('G90_inside_std_beige_two_tone_Icon','G90','G90_inside_std_beige_two_tone_Icon.jpg','',,'');
insert into tbl_incolor (Pk_InColorCode,Fk_CarName,InColorIcon_Img,InColorCar_Img,InColorPrice,InColorDesc) values('G90_Inside_std_black_Icon','G90','G90_Inside_std_black_Icon.jpg','',,'');
insert into tbl_incolor (Pk_InColorCode,Fk_CarName,InColorIcon_Img,InColorCar_Img,InColorPrice,InColorDesc) values('G90_Inside_std_brown_two_tone_Icon','G90','G90_Inside_std_brown_two_tone_Icon.jpg','',,'');
insert into tbl_incolor (Pk_InColorCode,Fk_CarName,InColorIcon_Img,InColorCar_Img,InColorPrice,InColorDesc) values('G90_inside_std_gray_two_tone_Icon','G90','G90_inside_std_gray_two_tone_Icon.jpg','',,'');
insert into tbl_incolor (Pk_InColorCode,Fk_CarName,InColorIcon_Img,InColorCar_Img,InColorPrice,InColorDesc) values('G90_Inside_std_white_two_tone_Icon','G90','G90_Inside_std_white_two_tone_Icon.jpg','',,'');


insert into tbl_incolor (Pk_InColorCode,Fk_CarName,InColorIcon_Img,InColorCar_Img) values('G90_Black_InColor','G90 BLACK','G90_Black_Inside_Black_icon.jpg','G90_Black_InSide_Black.jpg');
commit;
-- 커밋 완료.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 옵션_외장디자인컬러 테이블 생성 (생성 완료)
create table tbl_OutColor
(Pk_OutColorCode          VARCHAR2(300)             --외장디자인 코드  pk
,Fk_CarName               VARCHAR2(20)  not null    --차량 이름       fk
,OutColorIcon_Img         VARCHAR2(300) not null    --외장컬러 아이콘 사진
,OutColorCar_Img          VARCHAR2(300) not null    --외장컬러별 차량 사진
,OutColorPrice            NUMBER        default 0   --외장컬러 가격
,OutColorDesc             VARCHAR2(300)
,constraint PK_tbl_OutColor_OutColorCode primary key(Pk_OutColorCode)
,constraint FK_tbl_OutColor_fk_CarName foreign key(Fk_CarName) references tbl_car(Pk_CarName)
);

alter table tbl_OutColor add OutColorDesc VARCHAR2(300);
commit;

select pk_outcolorcode, fk_carname, outcoloricon_img, outcolorcar_img,outcolorprice,outcolordesc
from tbl_OutColor
where fk_carname = 'G90';

update tbl_OutColor set OutColorDesc='마우이 블랙 [HBK]' where pk_OutColorCode = 'G90_HBK';
update tbl_OutColor set OutColorDesc='한라산 그린 [MDY]' where pk_OutColorCode = 'G90_MDY';
update tbl_OutColor set OutColorDesc='마칼루 그레이 [NCM]' where pk_OutColorCode = 'G90_NCM';
update tbl_OutColor set OutColorDesc='카프리 블루 [NRB]' where pk_OutColorCode = 'G90_NRB';
update tbl_OutColor set OutColorDesc='비크 블랙 [PH3]' where pk_OutColorCode = 'G90_PH3';
update tbl_OutColor set OutColorDesc='세빌 실버 [SSS]' where pk_OutColorCode = 'G90_SSS';
update tbl_OutColor set OutColorDesc='태즈먼 블루 [URA]' where pk_OutColorCode = 'G90_URA';
update tbl_OutColor set OutColorDesc='우유니 화이트 [UYH]' where pk_OutColorCode = 'G90_UYH';
update tbl_OutColor set OutColorDesc='마칼루 그레이 [MPE]' where pk_OutColorCode = 'G90_MATT_MPE';
update tbl_OutColor set OutColorDesc='베르비에 화이트 [NA3]' where pk_OutColorCode = 'G90_MATT_NA3';

commit;

insert into tbl_OutColor(Pk_OutColorCode,Fk_CarName,OutColorIcon_Img,OutColorCar_Img,OutColorPrice)values ('G90_HBK','G90','G90_HBK_Icon.png','G90_HBK_Car.png',0);
insert into tbl_OutColor(Pk_OutColorCode,Fk_CarName,OutColorIcon_Img,OutColorCar_Img,OutColorPrice)values ('G90_MDY','G90','G90_MDY_Icon.png','G90_MDY_Car.png',0);
insert into tbl_OutColor(Pk_OutColorCode,Fk_CarName,OutColorIcon_Img,OutColorCar_Img,OutColorPrice)values ('G90_NCM','G90','G90_NCM_Icon.png','G90_NCM_Car.png',0);
insert into tbl_OutColor(Pk_OutColorCode,Fk_CarName,OutColorIcon_Img,OutColorCar_Img,OutColorPrice)values ('G90_NRB','G90','G90_NRB_Icon.png','G90_NRB_Car.png',0);
insert into tbl_OutColor(Pk_OutColorCode,Fk_CarName,OutColorIcon_Img,OutColorCar_Img,OutColorPrice)values ('G90_PH3','G90','G90_PH3_Icon.png','G90_PH3_Car.png',0);
insert into tbl_OutColor(Pk_OutColorCode,Fk_CarName,OutColorIcon_Img,OutColorCar_Img,OutColorPrice)values ('G90_SSS','G90','G90_SSS_Icon.png','G90_SSS_Car.png',0);
insert into tbl_OutColor(Pk_OutColorCode,Fk_CarName,OutColorIcon_Img,OutColorCar_Img,OutColorPrice)values ('G90_URA','G90','G90_URA_Icon.png','G90_URA_Car.png',0);
insert into tbl_OutColor(Pk_OutColorCode,Fk_CarName,OutColorIcon_Img,OutColorCar_Img,OutColorPrice)values ('G90_UYH','G90','G90_UYH_Icon.png','G90_UYH_Car.png',0);

insert into tbl_OutColor(Pk_OutColorCode,Fk_CarName,OutColorIcon_Img,OutColorCar_Img,OutColorPrice)values ('G90_MATT_MPE','G90','G90_MATT_MPE_Icon.png','G90_MATT_MPE_Car.png',800000);
insert into tbl_OutColor(Pk_OutColorCode,Fk_CarName,OutColorIcon_Img,OutColorCar_Img,OutColorPrice)values ('G90_MATT_NA3','G90','G90_MATT_NA3_Icon.png','G90_MATT_NA3_Car.png',800000);

insert into tbl_OutColor(Pk_OutColorCode,Fk_CarName,OutColorIcon_Img,OutColorCar_Img) values ('G90_BLACK_OutSideColor','G90 BLACK','G90_BLACK_OutSideColorIcon.png','G90_BLACK_OUTSIDECOLOR_BLACK.png');
commit;
-- 커밋 완료.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 내 견적서 생성 (생성 완료)
create table tbl_Paper
(Pk_PaperSeq                NUMBER                          --견적서 번호    pk
,Fk_UserId                  VARCHAR2(30)    not null        --유저아이디     fk
,Fk_CarName                 VARCHAR2(20)    not null        --차량 이름      fk
,Fk_InColorCode         VARCHAR2(20)    not null        --내장디자인 코드  fk
,Fk_PowerCode          VARCHAR2(300)   not null        --엔진코드        fk 
,Fk_OutColorCode        VARCHAR2(300)   not null        --외장디자인 코드  fk
,constraint PK_tbl_Paper_PaperSeq primary key(Pk_PaperSeq)
,constraint FK_tbl_Paper_fk_UserId foreign key(Fk_UserId) references tbl_User(Pk_UserId) 
,constraint FK_tbl_Paper_fk_CarName foreign key(Fk_CarName) references tbl_car(Pk_CarName) 
,constraint FK_tbl_Paper_fk_InColorCode foreign key(Fk_InColorCode) references tbl_InColor(Pk_InColorCode) 
,constraint FK_tbl_Paper_fk_PowerCode foreign key(Fk_PowerCode) references tbl_power(Pk_PowerCode) 
,constraint FK_tbl_Paper_fk_OutColorCode foreign key(Fk_OutColorCode) references tbl_OutColor(Pk_OutColorCode) 
);

-- 내 견적서 시퀀스 (생성 완료)
create sequence Pk_PaperSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 -- 로그인 기록 테이블 생성 (생성 완료)
 create table tbl_login_log 
 (PK_LoginSeq   NUMBER  not null
 , FK_Userid  VARCHAR2(30)    not null
 ,ipAddress VARCHAR2(40)    not null
 , LoginDate    DATE    not null
 ,constraint  PK_tbl_login_log_PK_LoginSeq primary key(Pk_LoginSeq)
,constraint  FK_tbl_login_log_FK_Userid foreign key(Fk_Userid) references tbl_user(Pk_Userid)
 );
 
 -- 로그인 기록 시퀀스 생성 (생성 완료)
create sequence PK_LoginSeq; 

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- QnA 테이블 생성 (생성 완료)
 create table tbl_QnA
 (Pk_QnASeq NUMBER  not null
 , FK_Userid  VARCHAR2(30)    not null
 ,QnAWriteDate DATE     not null
 , QnATitle VARCHAR2(150)   not null
 , QnAContent VARCHAR2(4000)   not null
 , QnAPwd VARCHAR2(20)   not null
  ,constraint  PK_tbl_QnA_Pk_QnASeq primary key(Pk_QnASeq)
,constraint  FK_tbl_QnA_FK_Userid foreign key(Fk_Userid) references tbl_user(Pk_Userid)
 );

 -- QnA 시퀀스 생성 (생성 완료)
 create sequence PK_QnASeq;
 
 
 
 