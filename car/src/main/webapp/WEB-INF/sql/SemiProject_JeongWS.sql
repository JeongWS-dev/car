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

insert into tbl_Option(Pk_OptionCode,Fk_CarName,Option_Img,OptionDesc,OptionPrice,OptionDetailDesc) values('G90_options_panoramic_sunroof','G90','G90_options_panoramic_sunroof.jpg','파노라마 선루프',2000000,'탁 트인 개방감을 선사하여 채광과 환기 효과를 더하며, 선루프 무드조명을 추가하여 고급감 및 편의성을 향상시켰습니다.');
insert into tbl_Option(Pk_OptionCode,Fk_CarName,Option_Img,OptionDesc,OptionPrice,OptionDetailDesc) values('G90_options_rear_dual_monitor','G90','G90_options_rear_dual_monitor.jpg','전동식 뒷좌석 듀얼 모니터',2900000,'터치 방식의 10.2인치 대화면 모니터는 뒷좌석 좌우 승객이 독립적으로 사용가능하며, 시트 모드에 따라 각도가 연동됩니다. 목적지까지의 경로와 남은 시간 등도 확인할 수 있습니다.');
insert into tbl_Option(Pk_OptionCode,Fk_CarName,Option_Img,OptionDesc,OptionPrice) values('G90_bang_olufsen_sound_package','G90','G90_options_bang_olufsen_sound_system.jpg','뱅앤올룹슨 사운드 패키지',3900000);
insert into tbl_Option(Pk_OptionCode,Fk_CarName,Option_Img,OptionDesc,OptionPrice,OptionDetailDesc) values('G90_options_built_in_cam','G90','G90_options_built_in_cam.jpg','빌트인 캠 (보조배터리 포함)',800000,'차량의 트림을 제거할 필요 없이 빌트인 적용된 주행 중 영상기록장치로, AVN 화면을 통해 영상을 바로 확인할 수 있을 뿐만 아니라 스마트폰 앱 연동을 통해 영상 확인 및 SNS 공유가 가능합니다. 주행뿐만 아니라 주차 상황에서도 최대 12시간까지 녹화가 가능합니다.');
insert into tbl_Option(Pk_OptionCode,Fk_CarName,Option_Img,OptionDesc,OptionPrice,OptionDetailDesc) values('G90_options_driver_passanger_ergo_relaxing_seat','G90','G90_options_driver_passanger_ergo_relaxing_seat.jpg','운전석 / 동승석 에르고 릴렉싱 시트',2000000,'시트백 10개 포켓과 쿠션 2셀 구조를 활용하여 전신 모드 외 3가지의 마사지 모드를 제공하며 최적의 착좌감을 제공합니다.');
insert into tbl_Option(Pk_OptionCode,Fk_CarName,Option_Img,OptionDesc,OptionPrice,OptionDetailDesc) values('G90_options_easy_close_system','G90','G90_options_easy_close_system.jpg','이지 클로즈 시스템',1500000,'승차 후 손을 뻗어 도어를 당길 필요 없이 편안하게 앉은 상태에서 콘솔의 버튼을 누르면 도어가 부드럽게 닫힙니다. 하차할 때는 도어 트림의 버튼을 누르고 가볍게 미는 동작으로 도어가 손쉽게 열립니다.');
insert into tbl_Option(Pk_OptionCode,Fk_CarName,Option_Img,OptionDesc,OptionPrice) values('G90_back_comport_package_1','G90','G90_options_rear_seat.jpg','뒷좌석 컴포트 패키지I',3500000);
insert into tbl_Option(Pk_OptionCode,Fk_CarName,Option_Img,OptionDesc,OptionPrice) values('G90_back_comport_package_1+2','G90','G90_options_rear_seat.jpg','뒷좌석 컴포트 패키지I+II',6400000);
insert into tbl_Option(Pk_OptionCode,Fk_CarName,Option_Img,OptionDesc,OptionPrice) values('back_comport_package_1+2+front_comport','G90','G90_options_rear_seat.jpg','뒷좌석 컴포트 패키지I+II+운전석 / 동승석 에르고 릴렉싱 시트',7900000);
insert into tbl_Option(Pk_OptionCode,Fk_CarName,Option_Img,OptionDesc,OptionPrice) values('G90_hightech_package','G90','G90_options_head_up_display.jpg','하이테크 패키지',2000000);
insert into tbl_Option(Pk_OptionCode,Fk_CarName,Option_Img,OptionDesc,OptionPrice) values('G90_rws_airsuspension','G90','G90_options_rws.jpg','능동형 후륜 조향 (RWS) + 멀티챔버 에어 서스펜션',5000000);
insert into tbl_Option(Pk_OptionCode,Fk_CarName,Option_Img,OptionDesc,OptionPrice,OptionDetailDesc) values('G90_options_air_suspension','G90','G90_options_air_suspension.jpg','멀티챔버 에어 서스펜션',3500000,'차고 조절 기능 및 멀티 챔버 방식을 적용하여 부드러운 승차감과 함께 다이내믹한 핸들링 성능을 제공합니다. 방지턱 진입 전에는 차고 및 서스펜션 감쇠력을 조절해 승차감을 향상시키고, 경사로 주행 시에는 차고를 상향해 차체 하부 손상을 막아줍니다. 험로 인지 시에는 차고 상향으로 주행 안정감을 확보하고 고속도로에서는 고속주행 안정성을 향상시킵니다.');
insert into tbl_Option(Pk_OptionCode,Fk_CarName,Option_Img,OptionDesc,OptionPrice,OptionDetailDesc) values('G90_options_protection_film','G90','G90_options_protection_film.jpg','차량 보호 필름',540000,'카라이프 중 손상되기 쉬운 프론트 / 리어 범퍼등 8부위에 우레탄 계열의 투명한 보호필름을 부착하여 스톤칩으로 인한 페인트 손상 및 생활 스크래치를 예방하여 깨끗한 바디를 유지할 수 있도록 합니다. 또한 3년동안 6만km의 보증을 제공해드립니다.');
insert into tbl_Option(Pk_OptionCode,Fk_CarName,Option_Img,OptionDesc,OptionPrice,OptionDetailDesc) values('G90_options_wheel_cap','G90','G90_options_wheel_cap.jpg','플로팅 휠 캡 / 메탈 페달','200000','주행 시 엠블럼을 수평 상태로 유지 시켜주는 휠 캡과 메탈 소재 커버가 적용된 브레이크/엑셀 페달이 적용됩니다.');

commit;

select *
from tbl_option
where fk_carname = 'G90';

-- 선택품목 상세 테이블(생성 완료)
create table tbl_option_detail
(option_detail_code NUMBER(30)
,Fk_OptionCode      VARCHAR2(300)           -- 선택품목 시퀀스
,Fk_CarName         VARCHAR2(20)
,OptionName         VARCHAR2(300)
,OptionDESC         VARCHAR2(300)
,OptionImg          VARCHAR2(100)
,constraint  PK_tbl_option_detail primary key(option_detail_code)
,constraint  tbl_option_detail_OptionCode foreign key(Fk_OptionCode) references tbl_Option(Pk_OptionCode)
,constraint  tbl_option_detail_Fk_CarName foreign key(Fk_CarName) references tbl_car(Pk_CarName)
);

create sequence tbl_option_detail_seq;
commit;

insert into tbl_option_detail(option_detail_code,fk_optioncode,fk_carname, optionname,optiondesc, optionImg) VALUES (tbl_option_detail_seq.nextval,'G90_bang_olufsen_sound_package','G90','뱅앤올룹슨 프리미어 3D 사운드 시스템','헤드레스트와 헤드라이닝, 전동 팝업 트위터 등을 포함한 총 23개의 스피커가 섬세하고 풍부한 사운드를 제공합니다.','G90_options_bang_olufsen_sound_system.jpg');
insert into tbl_option_detail(option_detail_code,fk_optioncode,fk_carname, optionname,optiondesc, optionImg) VALUES (tbl_option_detail_seq.nextval,'G90_bang_olufsen_sound_package','G90','버츄얼 베뉴','버추얼 베뉴는 가상의 3D 서라운드 음향으로 유명 공연장과 홈사운드의 음장 특성을 재현해 현장감 넘치는 사운드 공간을 완성합니다.','G90_options_virtual_venue.jpg');
commit;

insert into tbl_option_detail(option_detail_code,fk_optioncode,fk_carname, optionname,optiondesc, optionImg) VALUES (tbl_option_detail_seq.nextval,'G90_back_comport_package_1','G90','뒷좌석 전동 시트 / 통풍 시트','전/후 방향 조절로 원하는 시트 각도를 설정할 수 있는 뒷좌석 전동 시트는 히터/통풍 기능을 통해 사계절 내내 쾌적한 승차감을 제공합니다.','G90_options_rear_seat.jpg');
insert into tbl_option_detail(option_detail_code,fk_optioncode,fk_carname, optionname,optiondesc, optionImg) VALUES (tbl_option_detail_seq.nextval,'G90_back_comport_package_1','G90','VIP 좌석 레그레스트','세단에 적용되는 레그레스트로, 2열 우측 좌석에만 적용되며 더욱 편안한 착좌감을 제공합니다.','G90_options_leg_foot_rest.jpg');
insert into tbl_option_detail(option_detail_code,fk_optioncode,fk_carname, optionname,optiondesc, optionImg) VALUES (tbl_option_detail_seq.nextval,'G90_back_comport_package_1','G90','어드밴스드 3존 공조 (B필러 에어벤트)','2열 센터콘솔에 뒷좌석의 온도를 조절할 수 있는 LCD 공조창을 적용하여 운전석, 조수석과는 별도로 개별 온도 제어가 가능하여 쾌적한 실내공간을 제공합니다.','G90_options_advanced_3zone.jpg');
insert into tbl_option_detail(option_detail_code,fk_optioncode,fk_carname, optionname,optiondesc, optionImg) VALUES (tbl_option_detail_seq.nextval,'G90_back_comport_package_1','G90','뒷좌석 목베개 / 윙아웃 헤드레스트','뒷좌석 목베개와 윙아웃 헤드레스트는 머리를 지지하여 편안한 릴렉스 자세를 취할 수 있도록 도와줍니다.','G90_options_rear_neck_head_rest.jpg');
insert into tbl_option_detail(option_detail_code,fk_optioncode,fk_carname, optionname,optiondesc, optionImg) VALUES (tbl_option_detail_seq.nextval,'G90_back_comport_package_1','G90','뒷좌석 스마트폰 무선 충전','뒷좌석에 무선 충전 패드가 마련되어 별도의 케이블 없이도 손쉽게 스마트폰을 충전할 수 있습니다.','G90_options_smart_phone_charger.jpg');
insert into tbl_option_detail(option_detail_code,fk_optioncode,fk_carname, optionname,optiondesc, optionImg) VALUES (tbl_option_detail_seq.nextval,'G90_back_comport_package_1','G90','뒷좌석 자세 메모리 시스템','간단한 버튼 조작으로 좌석을 제어하여 설정된 위치까지 자동으로 조절하는 장치입니다.','G90_options_ims.jpg');
commit;

insert into tbl_option_detail(option_detail_code,fk_optioncode,fk_carname, optionname,optiondesc, optionImg) VALUES (tbl_option_detail_seq.nextval,'G90_back_comport_package_1_2_front_comport','G90','뒷좌석 전동 시트 / 통풍 시트','전/후 방향 조절로 원하는 시트 각도를 설정할 수 있는 뒷좌석 전동 시트는 히터/통풍 기능을 통해 사계절 내내 쾌적한 승차감을 제공합니다.','G90_options_rear_seat.jpg');
insert into tbl_option_detail(option_detail_code,fk_optioncode,fk_carname, optionname,optiondesc, optionImg) VALUES (tbl_option_detail_seq.nextval,'G90_back_comport_package_1_2_front_comport','G90','VIP 좌석 레그레스트','세단에 적용되는 레그레스트로, 2열 우측 좌석에만 적용되며 더욱 편안한 착좌감을 제공합니다.','G90_options_leg_foot_rest.jpg');
insert into tbl_option_detail(option_detail_code,fk_optioncode,fk_carname, optionname,optiondesc, optionImg) VALUES (tbl_option_detail_seq.nextval,'G90_back_comport_package_1_2_front_comport','G90','어드밴스드 3존 공조 (B필러 에어벤트)','2열 센터콘솔에 뒷좌석의 온도를 조절할 수 있는 LCD 공조창을 적용하여 운전석, 조수석과는 별도로 개별 온도 제어가 가능하여 쾌적한 실내공간을 제공합니다.','G90_options_advanced_3zone.jpg');
insert into tbl_option_detail(option_detail_code,fk_optioncode,fk_carname, optionname,optiondesc, optionImg) VALUES (tbl_option_detail_seq.nextval,'G90_back_comport_package_1_2_front_comport','G90','뒷좌석 목베개 / 윙아웃 헤드레스트','뒷좌석 목베개와 윙아웃 헤드레스트는 머리를 지지하여 편안한 릴렉스 자세를 취할 수 있도록 도와줍니다.','G90_options_rear_neck_head_rest.jpg');
insert into tbl_option_detail(option_detail_code,fk_optioncode,fk_carname, optionname,optiondesc, optionImg) VALUES (tbl_option_detail_seq.nextval,'G90_back_comport_package_1_2_front_comport','G90','뒷좌석 스마트폰 무선 충전','뒷좌석에 무선 충전 패드가 마련되어 별도의 케이블 없이도 손쉽게 스마트폰을 충전할 수 있습니다.','G90_options_smart_phone_charger.jpg');
insert into tbl_option_detail(option_detail_code,fk_optioncode,fk_carname, optionname,optiondesc, optionImg) VALUES (tbl_option_detail_seq.nextval,'G90_back_comport_package_1_2_front_comport','G90','뒷좌석 자세 메모리 시스템','간단한 버튼 조작으로 좌석을 제어하여 설정된 위치까지 자동으로 조절하는 장치입니다.','G90_options_ims.jpg');
insert into tbl_option_detail(option_detail_code,fk_optioncode,fk_carname, optionname,optiondesc, optionImg) VALUES (tbl_option_detail_seq.nextval,'G90_back_comport_package_1_2_front_comport','G90','뒷좌석 에르고 릴렉싱 시트 (뒷좌석 마사지, VIP 좌석 발 마사지)','10개의 포켓을 내장한 시트백과 2셀 구조의 쿠션이 총 4가지 모드의 마사지 기능을 제공합니다. 에어셀 공기의 흡/배기를 승하차, 드라이브 모드와 차속, 뒷좌석 원스텝 특화 모드 등과 연동하여 최적의 착좌감을 제공합니다.','G90_options_rear_ergo_seat.jpg');
insert into tbl_option_detail(option_detail_code,fk_optioncode,fk_carname, optionname,optiondesc, optionImg) VALUES (tbl_option_detail_seq.nextval,'G90_back_comport_package_1_2_front_comport','G90','VIP 좌석 풋레스트','세단에 적용되는 풋레스트로, 2열 우측 좌석에만 적용됩니다. 마시지 기능과 히팅 기능이 적용된 풋레스트는 사계절 내내 쾌적한 온도에서 발의 피로를 풀어줍니다.','G90_options_foot_rest.jpg');
insert into tbl_option_detail(option_detail_code,fk_optioncode,fk_carname, optionname,optiondesc, optionImg) VALUES (tbl_option_detail_seq.nextval,'G90_back_comport_package_1_2_front_comport','G90','뒷좌석 프라이버시 글라스','차량 내부에서 밖을 볼 때 어두워지는 것은 최소화하고, 밖에서 차량 내부는 거의 보이지 않게 처리된 글라스로 편리함과 안락함을 제공합니다.','G90_options_privacy_glass.jpg');
insert into tbl_option_detail(option_detail_code,fk_optioncode,fk_carname, optionname,optiondesc, optionImg) VALUES (tbl_option_detail_seq.nextval,'G90_back_comport_package_1_2_front_comport','G90','운전석 / 동승석 에르고 릴렉싱 시트','시트백 10개 포켓과 쿠션 2셀 구조를 활용하여 전신 모드 외 3가지의 마사지 모드를 제공하며 최적의 착좌감을 제공합니다.','G90_options_driver_passanger_ergo_relaxing_seat.jpg');

insert into tbl_option_detail(option_detail_code,fk_optioncode,fk_carname, optionname,optiondesc, optionImg) VALUES (tbl_option_detail_seq.nextval,'G90_hightech_package','G90','헤드업 디스플레이','내비게이션과의 콘텐츠 연동을 통해 속도나 내비게이션 정보 외에도 첨단 운전자 보조 시스템, 전화, 음성인식, 미디어 정보 등까지 표시합니다.','G90_options_head_up_display.jpg');
insert into tbl_option_detail(option_detail_code,fk_optioncode,fk_carname, optionname,optiondesc, optionImg) VALUES (tbl_option_detail_seq.nextval,'G90_hightech_package','G90','지능형 헤드램프','상시 상향등 주행으로 운전자의 전방 시야를 안전하게 확보하며 마주 오는 전방 차량 영역의 빛을 부분적으로 차단해 상대차 운전자의 눈부심을 막아줍니다. 별도로 헤드램프를 조작할 필요가 없어 야간 운전이 수월해집니다.','G90_options_head_lamp.jpg');

insert into tbl_option_detail(option_detail_code,fk_optioncode,fk_carname, optionname,optiondesc, optionImg) VALUES (tbl_option_detail_seq.nextval,'G90_rws_airsuspension','G90','능동형 후륜 조향 (RWS)','차량의 주행 상황에 따라 전륜 조향과 연동하여 후륜의 조향각을 능동적으로 가변 제어합니다. 저속 선회 시에는 전륜과 반대 방향 으로 조향하여 회전 반경을 줄이고, 중고속 선회 시에는 전륜과 같은 방향 으로 조향해 차체 미끄러짐을 줄입니다.','G90_options_rws.jpg');
insert into tbl_option_detail(option_detail_code,fk_optioncode,fk_carname, optionname,optiondesc, optionImg) VALUES (tbl_option_detail_seq.nextval,'G90_rws_airsuspension','G90','멀티챔버 에어 서스펜션','차고 조절 기능 및 멀티 챔버 방식을 적용하여 부드러운 승차감과 함께 다이내믹한 핸들링 성능을 제공합니다. ','G90_options_air_suspension.jpg');

commit;

update tbl_option set pk_optioncode = 'G90_back_comport_package_1_2' where optiondesc = '뒷좌석 컴포트 패키지I+II';
update tbl_option set pk_optioncode = 'G90_back_comport_package_1_2_front_comport' where optiondesc = '뒷좌석 컴포트 패키지I+II+운전석 / 동승석 에르고 릴렉싱 시트';


select pk_optioncode, option_img, optiondesc, optionprice, optiondetaildesc
from tbl_option
where fk_carname = 'G90';

select fk_carname, optionname, optiondesc, optionimg
from tbl_option_detail
where fk_optioncode = 'G90_bang_olufsen_sound_package' and fk_carname = 'G90';

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
 
 
 
 