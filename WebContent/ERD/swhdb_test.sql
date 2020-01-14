-- 테이블 순서는 관계를 고려하여 한 번에 실행해도 에러가 발생하지 않게 정렬되었습니다.

-- SL_member Table Create SQL
CREATE TABLE SL_member
(
    `mb_uid`      INT            NOT NULL    AUTO_INCREMENT COMMENT '회원 고유 번호', 
    `mb_id`       VARCHAR(45)    NOT NULL    COMMENT '회원 로그인 id', 
    `mb_pw`       VARCHAR(45)    NOT NULL    COMMENT '회원 비밀번호', 
    `mb_name`     VARCHAR(45)    NOT NULL    COMMENT '회원 이름', 
    `mb_address`  VARCHAR(45)    NULL        COMMENT '회원 주소', 
    `mb_cell`     VARCHAR(45)    NOT NULL    COMMENT '회원 전화번호', 
    `mb_email`    VARCHAR(45)    NOT NULL    COMMENT '회원 이메일', 
    `mb_regdate`  DATETIME       NOT NULL    DEFAULT now() COMMENT '회원 등록일', 
    `mb_type`     INT            NOT NULL    DEFAULT 1 COMMENT '0: 대기중 1:일반 2:매장 2:판매 3:운영자', 
    PRIMARY KEY (mb_uid)
);

ALTER TABLE SL_member COMMENT '회원';

ALTER TABLE SL_member
    ADD CONSTRAINT UC_mb_id UNIQUE (mb_id);


-- SL_member Table Create SQL
CREATE TABLE SL_offstore
(
    `st_uid`          INT            NOT NULL    AUTO_INCREMENT COMMENT '매장 고유 번호', 
    `mb_uid`          INT            NOT NULL    COMMENT '회원 고유번호', 
    `st_name`         VARCHAR(45)    NOT NULL    COMMENT '매장 이름.', 
    `st_address`      TEXT           NOT NULL    COMMENT '매장 주소', 
    `st_contact`      VARCHAR(45)    NOT NULL    COMMENT '매장 연락처', 
    `st_hours`        TEXT           NOT NULL    COMMENT '매장 영업시간', 
    `st_description`  TEXT           NULL        COMMENT '매장 설명', 
    `st_rating`       DOUBLE         NOT NULL    DEFAULT 0 COMMENT '매장 평점', 
    `st_img`          VARCHAR(200)   NULL        COMMENT '매장 사진(원본파일명)', 
    `st_file`		  VARCHAR(200)   null		 COMMENT '저장파일명',
    `st_valid_key`    INT            NOT NULL    COMMENT '매장 사업자등록번호 번호', 
    `st_valid_img`    VARCHAR(200)   NOT NULL    COMMENT '매장 사업자등록증', 
    `st_valid_file`   VARCHAR(200)	 not null  	 COMMENT '매장 사업자 등록증 (원본파일)',
    `st_latitude`     VARCHAR(20)    NOT NULL    COMMENT '매장 위도', 
    `st_longitude`    VARCHAR(20)    NOT NULL    COMMENT '매장 경도', 
    PRIMARY KEY (st_uid)
);

ALTER TABLE SL_offstore COMMENT '매장 현황';

ALTER TABLE SL_offstore
    ADD CONSTRAINT FK_SL_offstore_mb_uid_SL_member_mb_uid FOREIGN KEY (mb_uid)
        REFERENCES SL_member (mb_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE SL_offstore
    ADD CONSTRAINT UC_mb_uid UNIQUE (mb_uid);


-- SL_member Table Create SQL
CREATE TABLE SL_market
(
    `mk_uid`    INT            NOT NULL    AUTO_INCREMENT COMMENT '마켓 고유 아이디', 
    `mk_name`   VARCHAR(45)    NOT NULL    COMMENT '마켓 이름', 
    `mk_insta`  VARCHAR(45)    NULL        COMMENT '마켓 인스타', 
    `mk_logo`   VARCHAR(200)   NULL        COMMENT '마켓 로고(원본파일명)', 
    `mk_file`	VARCHAR(200)   null		   COMMENT '저장파일명',
    PRIMARY KEY (mk_uid)
);

ALTER TABLE SL_market COMMENT '입점마켓';

ALTER TABLE SL_market
    ADD CONSTRAINT UC_mk_name UNIQUE (mk_name);

ALTER TABLE SL_market
    ADD CONSTRAINT UC_mk_insta UNIQUE (mk_insta);


-- SL_member Table Create SQL
CREATE TABLE SL_product
(
    `pd_uid`          INT            NOT NULL    AUTO_INCREMENT COMMENT '제품 고유 번호', 
    `pd_name`         VARCHAR(45)    NOT NULL    COMMENT '제품 명', 
    `pd_description`  text           NULL        COMMENT '제품 설명', 
    `pd_img`          VARCHAR(200)   NULL        COMMENT '제품 사진(원본파일명)', 
    `pd_file`		  VARCHAR(200)   null		 COMMENT '저장파일명',
    `mk_uid`          INT            NOT NULL    COMMENT '제작자', 
    PRIMARY KEY (pd_uid)
);

ALTER TABLE SL_product COMMENT '제품';

ALTER TABLE SL_product
    ADD CONSTRAINT FK_SL_product_mk_uid_SL_market_mk_uid FOREIGN KEY (mk_uid)
        REFERENCES SL_market (mk_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- SL_member Table Create SQL
CREATE TABLE SL_inventory
(
    `inv_uid`       INT    NOT NULL    AUTO_INCREMENT COMMENT '재고 고유번호', 
    `st_uid`        INT    NOT NULL    COMMENT '매장 고유 번호', 
    `pd_uid`        INT    NOT NULL    COMMENT '제품 고유 번호', 
    `inv_quantity`  INT    NOT NULL    DEFAULT 0 COMMENT '재고', 
    `inv_price`     INT    NOT NULL    DEFAULT 0 COMMENT '판매가', 
    `inv_volume`    INT    NOT NULL    DEFAULT 0 COMMENT '제품 용량', 
    PRIMARY KEY (inv_uid)
);

ALTER TABLE SL_inventory COMMENT '매장별 재고 보유 현황';

ALTER TABLE SL_inventory
    ADD CONSTRAINT FK_SL_inventory_st_uid_SL_offstore_st_uid FOREIGN KEY (st_uid)
        REFERENCES SL_offstore (st_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE SL_inventory
    ADD CONSTRAINT FK_SL_inventory_pd_uid_SL_product_pd_uid FOREIGN KEY (pd_uid)
        REFERENCES SL_product (pd_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;
alter table sl_inventory
add unique key `unique_set` (`st_uid`, `pd_uid`);


-- SL_member Table Create SQL
CREATE TABLE SL_review
(
    `re_uid`      INT            NOT NULL    AUTO_INCREMENT COMMENT '후기 uid', 
    `wr_uid`      INT            NOT NULL    COMMENT '작성자', 
    `re_subject`  VARCHAR(45)    NOT NULL    COMMENT '후기 제목', 
    `re_content`  text           NOT NULL    COMMENT '후기 내용', 
    `re_views`    INT            NOT NULL    DEFAULT 0 COMMENT '후기 조회수', 
    `re_regdate`  DATETIME       NOT NULL    DEFAULT now() COMMENT '후기 등록일', 
    `st_uid`      INT            NOT NULL    COMMENT '매장 고유 번호', 
    PRIMARY KEY (re_uid)
);

ALTER TABLE SL_review COMMENT '후기';

ALTER TABLE SL_review
    ADD CONSTRAINT FK_SL_review_wr_uid_SL_member_mb_uid FOREIGN KEY (wr_uid)
        REFERENCES SL_member (mb_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE SL_review
    ADD CONSTRAINT FK_SL_review_st_uid_SL_offstore_st_uid FOREIGN KEY (st_uid)
        REFERENCES SL_offstore (st_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- SL_member Table Create SQL
CREATE TABLE SL_event
(
    `ev_uid`         INT            NOT NULL    AUTO_INCREMENT COMMENT '이벤트 uid', 
    `ev_start_date`  DATETIME       NOT NULL    DEFAULT now() COMMENT '이벤트 시작', 
    `ev_end_date`    DATETIME       NOT NULL    COMMENT '이벤트 종료', 
    `ev_subject`     VARCHAR(45)    NOT NULL    COMMENT '이벤트 제목', 
    `ev_content`     text           NOT NULL    COMMENT '이벤트 내용', 
    `st_uid`         INT            NOT NULL    COMMENT '매장 고유 번호', 
    PRIMARY KEY (ev_uid)
);

ALTER TABLE SL_event
    ADD CONSTRAINT FK_SL_event_st_uid_SL_offstore_st_uid FOREIGN KEY (st_uid)
        REFERENCES SL_offstore (st_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- SL_member Table Create SQL
CREATE TABLE SL_favorite
(
    `fv_uid`   INT    NOT NULL    AUTO_INCREMENT COMMENT 'fv uid', 
    `inv_uid`  INT    NOT NULL    COMMENT '재고 고유번호', 
    `mb_uid`   INT    NOT NULL    COMMENT '맴버 고유번호', 
    PRIMARY KEY (fv_uid)
);

ALTER TABLE SL_favorite COMMENT '즐겨찾기';

ALTER TABLE SL_favorite
    ADD CONSTRAINT FK_SL_favorite_mb_uid_SL_member_mb_uid FOREIGN KEY (mb_uid)
        REFERENCES SL_member (mb_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE SL_favorite
    ADD CONSTRAINT FK_SL_favorite_inv_uid_SL_inventory_inv_uid FOREIGN KEY (inv_uid)
        REFERENCES SL_inventory (inv_uid) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- ------------------실험용 데이터--------------------------------------------------------------------
-- SL_member 회원 테이블
insert into SL_member (mb_uid, mb_id, mb_pw, mb_name, mb_address, mb_cell, mb_email, mb_type)
values
(101, 'mimisglove', '1234', '미미즈그로브', '서울특별시 성동구', '01044445555', 'mimisglove@gmail.com', 2),
(102, 'slimecook', '1234', '슬라임쿡', '서울특별시 마포구', '01055556666', 'slimecook@gmail.com', 2),
(103, 'gelsshowroom', '1234', '젤시스쇼룸', '서울특별시 강남구', '01066667777', 'gelsshowroom@gmail.com', 2),
(104, 'jeonpo', '1234', '전포동제과점', '부산광역시 부산진구', '01077778888', 'jeonpo@gmail.com', 2),
(105, 'slimeStore', '1234', '슬라임가게', '대전광역시 중구', '01088889999', 'slimeStore@gmail.com', 2);
insert into SL_member (mb_uid, mb_id, mb_pw, mb_name, mb_address, mb_cell, mb_email, mb_type)
values
(106, 'bluegenius12', '1234', '김진석', '경기도 고양시 일산동구 강촌로12번길', '01034564378', 'bluegenius12@gmail.com', 1),
(107, 'slim01', '4567', '이준일', '경기도 광주시 경안로25번길', '01068431098', 'slime01@gmail.com', 1),
(108, 'cantona10', 'qwer123', '한도경', '경기도 성남시 분당구 구미로174번길', '010-5674-7234', 'cantona10@gmail.com', 1);
insert into SL_member (mb_uid, mb_id, mb_pw, mb_name, mb_address, mb_cell, mb_email, mb_type)
values
(109, 'jongil', '1234', '박종일', '서울', '01034564379', 'plm3790@naver.com', 1);
-- SL_offstore 매장 테이블 (Foreign Key: 연동시킬 SL_member의 mb_uid 입력하세요)
insert into SL_offstore (st_uid, mb_uid, st_name, st_address, st_contact, st_hours, st_rating, st_valid_key, st_valid_img, st_valid_file, st_latitude, st_longitude, st_file, st_img)
VALUES
(1101, 101, '미미즈그로브', '서울시 성동구 행당로11길 5-2 1층', '0507-1331-8029', '12:00-20:00', 3, 123456789, '123456789', '123456789', '37.558603', '127.030525', 'mimisgrove.jpg', 'mimisgrove.jpg'),
(1102, 102, '슬라임쿡', '서울시 마포구 와우산로29바길 11-3 1층', '0507-1328-5992', '13:00-21:00', 4, 223456789, '223456789', '223456789', '37.555993', '126.926290', 'slimecook_offline.jpg', 'slimecook_offline.jpg'),
(1103, 103, '젤시스쇼룸', '서울 강남구 강남대로94길 27 101호', '02-552-1917', '11:00-21:00', 5, 323456789, '323456789', '323456789', '37.500046', '127.029555', 'jellsis.jpg', 'jellsis.jpg'), 
(1104, 104, '전포동제과점', '부산광역시 부산진구 전포대로232, 2층', '카카오플러스 친구 전포동제과점', '화~목 14:00-20:00, 금~일 11:00-21:00', 4, 423456789, '423456789', '423456789', '35.157565', '129.065718', 'jeonpodong.jpg', 'jeonpodong.jpg'),
(1105, 105, '슬라임가게', '대전광역시 중구 은행동 169-9번지', '070-4466-9790', '13:00-20:00', 5, 523456789, '523456789', '523456789', '36.327665', '127.427989', 'slimegage.jpg', 'slimegage.jpg'); 

select * from sl_offstore so;
-- SL_market 입점마켓
insert into SL_market (mk_uid, mk_name, mk_insta, mk_file, mk_logo)
values
(1, '슬라임쿡', 'slime.cook__', 'slimecook_market.jpg', 'slimecook_market.jpg'),
(2, '미미네슬라임', 'mi_mi__0815', 'mimine.jpg', 'mimine.jpg'),
(3, '빈짱슬라임', 'vinzzang_slime', 'vinzzang.jpg', 'vinzzang.jpg'),
(4, '미디슬라임', 'midi_slime', 'midi.jpg', 'midi.jpg'),
(5, '다나슬라임', 'danaa_slime', 'danaa.jpg', 'danaa.jpg');

-- SL_product 제품 (Foreign Key: 연동시킬 SL_market의 mk_uid 입력하세요)
insert into SL_product (pd_uid, pd_name, mk_uid, pd_file, pd_img, pd_description)
values
(1, '비비디바비디부', 1, 'bibidibabidiboo.jpg', 'bibidibabidiboo.jpg', '시원한 향수향'),
(2, '스위트콘크림', 1, 'sweetcorncream.jpg', 'sweetcorncream.jpg', '찰옥수수 아이스크림향'),
(3, '올라프눈뭉치', 1, 'olaf.jpg', 'olaf.jpg', '쿨워터향'),
(4, '꼬끄빙수', 2, 'ggoggubingsu.jpg', 'ggoggubingsu.jpg', '키위 스트로베리향'),
(5, '절규디폼', 2, 'jeolgyu.jpg', 'jeolgyu.jpg', '페어 + 베리향'),
(6, '밀빠송', 2, 'milkbbasong.jpg', 'milkbbasong.jpg', '슈가쿠키 + 브라우니 + 핫 초코향'),
(7, '바나나초코볼', 3, 'banana.jpg', 'banana.jpg', '바나나 쿠키향'),
(8, '불고기크림빠네', 3, 'bulgogi.jpg', 'bulgogi.jpg', '비스킷향'),
(9, '생딸기라떼', 3, 'strawberrylatte.jpg', 'strawberrylatte.jpg', '청포도향'),
(10, '라자냐', 4, 'lazyanya.jpg', 'lazyanya.jpg', '미디 치즈 + 콘향'),
(11, '부드러', 4, 'boodru.jpg', 'boodru.jpg', '섬유 향수 향'),
(12, '피자치즈', 4, 'pizzachees.jpg', 'pizzachees.jpg', '미디치즈향'),
(13, '아보카동', 5, 'abocadong.jpg', 'abocadong.jpg', '메론향'),
(14, '팝핀깡냉이', 5, 'poppin.jpg', 'poppin.jpg', '콘향'),
(15, '크림바삭', 5, 'creambasak.jpg', 'creambasak.jpg', '우유향');

-- SL_inventory 재고 보유 현황 (Foreign Key: st_uid, pd_uid 입력하세요)
insert into SL_inventory (st_uid, pd_uid, inv_quantity, inv_price, inv_volume)
values
(1101, 1, 13, 10000, 150),
(1102, 1, 14, 10000, 150),
(1103, 1, 123, 11000, 150),
(1104, 1, 14, 10000, 150),
(1105, 1, 1, 10000, 150),
(1101, 2, 13, 5000, 150),
(1102, 2, 23, 5000, 150),
(1103, 2, 54, 5500, 150),
(1104, 2, 123, 5000, 150),
(1105, 2, 4, 5000, 150),
(1101, 3, 12, 5000, 150),
(1102, 3, 123, 5500, 150),
(1103, 3, 6, 5000, 150),
(1104, 3, 4, 5000, 150),
(1105, 3, 6, 6000, 150),
(1101, 4, 2, 12345, 150),
(1102, 4, 3, 12345, 150),
(1103, 4, 4, 12345, 150),
(1104, 4, 5, 12345, 150),
(1105, 4, 1, 12345, 150),
(1101, 5, 1, 9999, 150),
(1102, 5, 2, 9999, 150),
(1103, 5, 3, 9999, 150),
(1104, 5, 4, 9999, 150),
(1105, 5, 5, 9000, 150),
(1101, 11, 6, 1000, 150),
(1102, 13, 7, 1231, 150),
(1103, 14, 87, 13333, 150),
(1104, 11, 8, 13333, 150),
(1105, 11, 1, 13333, 150),
(1101, 7, 1, 33333, 150),
(1102, 7, 2, 33333, 150),
(1103, 7, 3, 33333, 150),
(1104, 7, 4, 33333, 150),
(1105, 8, 5, 33333, 150);

select * from sl_member;
select * from sl_offstore;
select * from sl_market order by mk_uid;
select * from sl_product order by mk_uid;
select * from sl_inventory;

insert into sl_inventory (st_uid, pd_uid, inv_quantity, inv_price, inv_volume)
values (1101, 1, 333, 333, 333)
on duplicate key
update inv_quantity = 333,
	inv_price = 333,
	inv_volume = 333;

SELECT i.st_uid, i.inv_uid, i.inv_price, i.inv_quantity, i.inv_volume, 
p.pd_uid, p.pd_description, p.pd_img, p.pd_name, 
m.mk_uid, m.mk_logo, m.mk_insta, m.mk_name 
FROM sl_inventory i 
JOIN sl_product p ON i.pd_uid = p.pd_uid 
JOIN sl_market m ON p.mk_uid = m.mk_uid 
ORDER BY m.mk_name ASC, p.pd_name asc;

SELECT
p.pd_uid, p.pd_description, p.pd_img, p.pd_file, p.pd_name, 
m.mk_uid, m.mk_logo, m.mk_file, m.mk_insta, m.mk_name 
FROM sl_product p 
JOIN sl_market m ON p.mk_uid = m.mk_uid 
ORDER BY m.mk_name ASC, p.pd_name asc;

UPDATE sl_member SET mb_pw = '2345' WHERE mb_id = 'jongil' AND mb_email = 'plm3790@naver.com';
