-- 드라이빙 라운지 테이블 생성
create table tbl_DrivingLounge
(Pk_DLSeq               NUMBER                   --지역번호 seq pk                   
,Area                   VARCHAR2(50)  not null          --도
,City                   VARCHAR2(50)  not null          --시
,Place_Name             VARCHAR2(50)  not null          --장소 이름
,D_address              VARCHAR2(200)  not null          --장소 이름
,phone                  VARCHAR2(15)  not null          --장소 이름
,constraint PK_tbl_DrivingLounge_DLSeq primary key(Pk_DLSeq)
);

-- 시승신청기록 생성
create table tbl_DTApply
(Pk_ApplySeq                VARCHAR2(300)             --외장디자인 코드  pk
,Fk_CarName                 VARCHAR2(20)  not null    --차량 이름       fk
,Fk_DLSeq                   NUMBER       not null    --외장컬러 아이콘 사진
,Fk_UserId                  VARCHAR2(300) not null    --외장컬러별 차량 사진
,Schedule                   DATE                      --외장컬러 가격
,constraint PK_tbl_DTApply_ApplySeq primary key(Pk_ApplySeq)
,constraint FK_tbl_DTApply_fk_CarName foreign key(Fk_CarName) references tbl_car(Pk_CarName)
,constraint FK_tbl_DTApply_fk_DLSeq foreign key(Fk_DLSeq) references tbl_DrivingLounge(Pk_DLSeq)
,constraint FK_tbl_DTApply_fk_UserId foreign key(Fk_UserId) references tbl_User(Pk_UserId)
);

ALTER TABLE tbl_DTApply drop foreign key fk_carname FK_tbl_DTApply_fk_CarName;

-- 등록일자 컬럼 생성
ALTER TABLE tbl_DTApply
ADD registerday Date default sysdate;

-- 시승비 컬럼 생성
ALTER TABLE tbl_DTApply
ADD payFee VARCHAR2(20);

ALTER TABLE tbl_drivingLounge DROP COLUMN pk_dlseq;

-- 드라이빙라운지 시퀀스
create sequence Pk_DLSeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle;

rollback;

-- 시승신청기록 시퀀스
create sequence Pk_ApplySeq
start with 1
increment by 1
nomaxvalue
nominvalue
nocycle;

commit;

drop table tbl_DTApply purge;
drop table tbl_DrivingLounge purge;
    
commit;

insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('1','서울', '강남구', '드라이빙 라운지 강남', '서울특별시 강남구 영동대로 302 (대치동, 국민제1빌딩)','02-3452-7365');
insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('2','서울', '강북구', '드라이빙 라운지 미아', '서울특별시 강북구 도봉로 137 미아동, 시암빌딩','02-973-7365');
insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('3','서울', '강동구', '강동(EV스테이션)', '서울특별시 강동구 천호대로 1221 (길동)','02-6255-1967');
insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('4','서울', '성동구', '드라이빙 라운지 성수', '서울특별시 성동구 성수이로 132 (성수동2가)','02-3409-7365');
insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('5','서울', '영등포구', '드라이빙 라운지 영등포', '서울특별시 영등포구 당산로 42 (문래동3가, 홈플러스)','02-2644-7365');
insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('6','서울', '용산구', '드라이빙 라운지 용산', '서울특별시 용산구 한강대로 95 (한강로2가)','02-712-7365');
insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('7','경기', '고양시', '드라이빙 라운지 일산', '경기도 고양시 일산동구 백마로 494 (풍동)','031-908-7365');
insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('8','경기', '성남시', '드라이빙 라운지 분당', '경기도 성남시 분당구 황새울로240번길 3 (수내동, 현대오피스빌딩)','031-705-7365');
insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('9','경기', '수원시', '드라이빙 라운지 수원', '경기도 수원시 팔달구 경수대로 500 (인계동)','031-264-7365');
insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('10','경기', '안산시', '드라이빙 라운지 안산', '경기도 안산시 단원구 광덕대로 175 (고잔동, 삼성홈플러스)','031-405-7365');
insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('11','경기', '안양시', '드라이빙 라운지 안양', '경기도 안양시 동안구 시민대로327번길 12-6','031-466-7365');
insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('12','경기', '오산시', '드라이빙 라운지 오산', '경기도 오산시 경기대로 617 (내삼미동 )','031-366-7365');
insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('13','경기', '의정부시', '드라이빙 라운지 의정부', '경기도 의정부시 호국로 1412','031-872-7365');

insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('14','인천', '부평구', '드라이빙 라운지 인천동부', '인천광역시 부평구 장제로 329 (삼산동)','인천광역시 부평구 장제로 329 (삼산동)');insert into tbl_DrivingLounge(Area, City, Place_Name, D_address, phone) values('부산', '의정부시', '드라이빙 라운지 의정부', '경기도 의정부시 호국로 1412','031-872-7365');

insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('15','부산', '금정구', '드라이빙 라운지 부산동부', '부산광역시 금정구 중앙대로 1883 (구서동)','051-517-7365');
insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('16','부산', '동구', '드라이빙 라운지 부산중앙', '부산광역시 동구 중앙대로 360 (수정동)','051-465-7365');

insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('17','대전', '대덕구', '드라이빙 라운지 대전', '대전광역시 대덕구 한남로 118 (오정동 )','042-621-7365');
insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('18','대구', '달서구', '드라이빙 라운지 대구서부', '대구광역시 달서구 달구벌대로 1599(감삼동)','053-355-7365');
insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('19','대구', '수성구', '드라이빙 라운지 대구동부', '대구광역시 수성구 동대구로 37 (두산동)','053-525-7365');

insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('20','울산', '북구', '드라이빙 라운지 울산', '울산광역시 북구 진장유통1로 3 (진장동)','052-295-7365');
insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('21','광주', '북구', '드라이빙 라운지 광주', '광주광역시 북구 첨단연신로 100 (신용동 )','062-366-7365');
insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('22','강원', '원주시', '드라이빙 라운지 원주', '강원도 원주시 북원로 2541 (우산동)','033-745-7365');
insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('23','충북', '청주시', '드라이빙 라운지 청주', '충청북도 청주시 청원구 충청대로 229 (주중동 )','043-234-7365');
insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('24','충남', '천안시', '드라이빙 라운지 천안아산', '충청남도 천안시 서북구 월봉4로 8 (쌍용동, 현대자동차 천안중부지점)','041-573-7365');
insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('25','경북', '포항시', '드라이빙 라운지 포항', '경상북도 포항시 북구 새천년대로 1214 (장성동)','054-278-7365');
insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('26','경남', '창원시', '드라이빙 라운지 창원', '경상남도 창원시 성산구 봉양로 397','055-267-7365');
insert into tbl_DrivingLounge(Pk_DLSeq, Area, City, Place_Name, D_address, phone) values('27','전북', '전주시', '드라이빙 라운지 전주', '전라북도 전주시 완산구 효자로 22 (효자동3가 )','063-282-7365');

commit;

select *
from tbl_user
;

select area
from tbl_drivingLounge
group by area
order by area;

select city
from tbl_drivingLounge
where area = '서울'
group by city
;


select *
from tbl_drivingLounge
where area = '서울'
;

select place_name,d_address,phone,lat,lng
from tbl_drivingLounge
where area = '서울' and city ='성동구'
order by place_name
;


ALTER TABLE tbl_drivingLounge
ADD lng NUMBER;

-- 위도
UPDATE tbl_drivingLounge
SET lat = '35.8201170158222'
WHERE place_name = '드라이빙 라운지 전주';


-- 경도
UPDATE tbl_drivingLounge
SET lng = '127.088382377251'
WHERE place_name = '드라이빙 라운지 전주';

commit;

select *
from tbl_DTApply
;

insert into tbl_DTApply(PK_APPLYSEQ, fk_carname, fk_dlseq, fk_userid, schedule, payfee) values(1,'G90', '14', 'kimdh', '2024-07-01', '10원');
commit;

