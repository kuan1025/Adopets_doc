Drop database `ADOPETS`;
CREATE DATABASE `ADOPETS`;

USE `ADOPETS`;

-- 會員
CREATE TABLE `MEMBER` (
  `memID` 	int auto_increment COMMENT '會員編號',
  `account` 	varchar(30) not null COMMENT 'email',
  `password` 	varchar(20) not null COMMENT '密碼',
  `name` 	varchar(30) not null COMMENT '姓名',
  `age` 		varchar(10) COMMENT '年齡',
  `phone`              varchar(10) COMMENT '手機',
  `address` 	varchar(50) COMMENT '地址',
  `personImg` 	longblob COMMENT '用戶照片',
  `createDate` 	datetime default(now()) COMMENT '建立日期',
  `changeDate` 	datetime default(now()) COMMENT '修改時間',
  `lastOLTime` 	datetime default(now()) COMMENT '最後上線時間',
  `creditCard` 	varchar(45) COMMENT '信用卡卡號',
  PRIMARY KEY (`memID`)
) COMMENT = '會員資料';

INSERT INTO
  `MEMBER`(`account`,`password`,`name`)
VALUES
  ('nick1111@gmail.com','nick1111','洪克偉'),('nick2222@gmail.com','nick2222','爵宇'),
  ('nick3333@gmail.com','nick3333','政言'),('nick4444@gmail.com','nick4444','宗德'),
  ('nick5555@gmail.com','nick5555','育寬');


 -- 訂單

CREATE TABLE `ORDERS` (
  `orderID` 	INT  AUTO_INCREMENT COMMENT '訂單編號',
  `memID`             INT NOT NULL COMMENT '買家編號',
   `createTime` 	TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL COMMENT '建立時間',
  `orderPrice` 	INT NOT NULL COMMENT '訂單價格',
  `orderStatus`      INT NOT NULL COMMENT '訂單狀態',
  `paymentType`   INT NOT NULL COMMENT '支付方式',
  `address` 	VARCHAR(50) NULL COMMENT '寄送地址',
  PRIMARY KEY (`orderID`),
  constraint FK_ORDERS_memID foreign key (memID)
  references MEMBER (memID)
  )COMMENT = '訂單';

 insert into ORDERS (memID,orderPrice,orderStatus,paymentType,address) values(1,800,1,1, '基隆市南榮路一段89號');
 insert into ORDERS (memID,orderPrice,orderStatus,paymentType,address) values(2,1000,2,2, '台北市松山區八德路三段77號');
 insert into ORDERS (memID,orderPrice,orderStatus,paymentType,address) values(3,5000,1,1, '高雄市小港區平津路一段102號');
 insert into ORDERS (memID,orderPrice,orderStatus,paymentType,address) values(4,2100,2,1, '宜蘭市礁溪區溫泉路二段5號');
 insert into ORDERS (memID,orderPrice,orderStatus,paymentType,address) values(1,1300,1,2, '台中市后里區凱達格蘭路五段55號');

-- 收容所
CREATE TABLE SHELTERINFO (
    shelterName  VARCHAR(30) COMMENT '收容所名字',
    shelterAddr  VARCHAR(50) COMMENT '收容所地址',
    shelterCity	 VARCHAR(10) COMMENT '收容所縣市',
    longitude	 VARCHAR(10) COMMENT '經度',
    latitude	 VARCHAR(10) COMMENT '緯度',
    PRIMARY KEY (shelterName)
);








-- --貓咪資訊

CREATE TABLE CATINFO(
	catID        INT AUTO_INCREMENT COMMENT '貓咪ID',
    memID 		 INT COMMENT '認養人',
    shelterName	 VARCHAR(30) COMMENT'收容所名稱',
    catName 	 VARCHAR(30) COMMENT '貓咪名字',
    breed 		 VARCHAR(10) COMMENT '品種',
    age 	 	 TINYINT COMMENT '貓咪年齡',
    size 		 VARCHAR(10) COMMENT '體型',
    sex 		 VARCHAR(3) COMMENT '性別',
    coatColor 	 VARCHAR(20) COMMENT '毛色',
    eyecolor 	 VARCHAR(3) COMMENT '眼睛顏色',
    health 		 VARCHAR(100) COMMENT '健康狀況',
    adoptcost 	 INT COMMENT '認養金額',
    createDate   DATE COMMENT '建立日期',
    haveVaccine  TINYINT COMMENT '是否已經施打疫苗',
    adopt 		 TINYINT COMMENT '是否認養',
    CONSTRAINT FK_CATINFO_shelterName FOREIGN KEY (shelterName) REFERENCES SHELTERINFO (shelterName),
    CONSTRAINT FK_CATINFO_memID FOREIGN KEY (memID) REFERENCES MEMBER (memID),
    PRIMARY KEY (catID)
);

-- 認養明細TABLE

CREATE TABLE ADOPTSTATEMENT (
	adoptionID    INT AUTO_INCREMENT COMMENT '認養編號',
    memID 		  INT COMMENT '會員編號',
    catID		  INT COMMENT '貓咪編號',
    adoptionState TINYINT COMMENT '認養狀態',
	adoptionDate  TIMESTAMP COMMENT '認養日期',
    sal			  INT COMMENT '收入',
	haveOtherPet  TINYINT COMMENT '是否有其他寵物',
    comment		  VARCHAR(100) COMMENT '備註',
    CONSTRAINT FK_ADOPTSTATEMENT_memID FOREIGN KEY (memID) REFERENCES MEMBER(memID),
    CONSTRAINT FK_ADOPTSTATEMENT_catID FOREIGN KEY (catID) REFERENCES CATINFO(catID),
    PRIMARY KEY (adoptionID)
);







--  新增貓照片TABLE

CREATE TABLE CATPHOTOGALLERY (
	imgID 		INT AUTO_INCREMENT COMMENT '照片編號',
    catID 		INT COMMENT '貓咪編號',
    catImg 		longblob COMMENT '貓照片',
    photoDate 	TIMESTAMP COMMENT '拍攝日期',
	CONSTRAINT FK_CATPHOTOGALLERY_catID FOREIGN KEY (catID) REFERENCES CATINFO(catID),
    PRIMARY KEY (imgID)
);

-- 新增我的最愛TABLE
CREATE TABLE MYFAVORITE (
	memID INT COMMENT '會員編號',
    catID INT COMMENT '貓咪編號',
    createTime TIMESTAMP COMMENT '建立時間',
	CONSTRAINT FK_MYFAVORITE_memID FOREIGN KEY (memID) REFERENCES MEMBER(memID),
    CONSTRAINT FK_MYFAVORITE_catID FOREIGN KEY (catID) REFERENCES CATINFO(catID),
    PRIMARY KEY (memID, catID)
);





-- CATEGORY

create table CATEGORY(
ctgID int auto_increment primary key COMMENT '類型編號',
ctgName varchar(12) not null COMMENT '類型名稱'
)COMMENT = '商品類型';

-- SPU

create table SPU(
spuID int auto_increment primary key COMMENT '商品編號',
ctgID int not null COMMENT '類型編號',
spuName varchar(100) not null COMMENT '商品名稱',
descript varchar(100) not null COMMENT '商品描述',
constraint FK_SPU_ctgID foreign key (ctgID)
references CATEGORY (ctgID)
)COMMENT = '商品';

-- PIMG

create table PIMG(
imgID int auto_increment COMMENT '照片編號',
spuID int not null COMMENT '商品編號',
spuImg longblob not null COMMENT '商品照片',
mainImg boolean not null COMMENT '是非為主照片',
primary key(imgID),
constraint FK_PIMG_spuID foreign key (spuID)
references SPU (spuID)
)COMMENT = '商品照片';

-- SKU

create table SKU(
skuID int auto_increment primary key COMMENT '規格編號',
spuID int not null COMMENT '商品編號',
skuPrice int not null COMMENT '規格價格',
stock int not null COMMENT '規格庫存',
specAttr json not null COMMENT '規格屬性',
status int not null COMMENT '商品狀態',
addedTime timestamp not null COMMENT '上架時間',
constraint FK_SKU_spuID foreign key (spuID)
references SPU (spuID)
)COMMENT = '商品規格';

--  Attributes

create table ATTRIBUTES(
attrID int auto_increment primary key COMMENT '屬性編號',
ctgID int not null COMMENT '類型編號',
attrName varchar(12) not null COMMENT '類型名稱',
constraint FK_ATTRIBUTES_ctgID foreign key (ctgID)
references CATEGORY (ctgID)
)COMMENT = '類型屬性';

-- value

create table VALUE(
valueID int primary key auto_increment COMMENT '屬性值編號',
attrID int not null COMMENT '屬性編號',
value varchar(12) COMMENT '屬性值',
constraint FK_VALUE_attrID foreign key (attrID)
references ATTRIBUTES (attrID)
)COMMENT = '類型屬性值';

	  -- 商品類型
insert into CATEGORY (ctgName) values('貓罐頭');
insert into ADOPETS.CATEGORY (ctgName) values('貓乾糧');
insert into ADOPETS.CATEGORY (ctgName) values('寵物玩具');
insert into ADOPETS.CATEGORY (ctgName) values('胸帶/項圈');
insert into ADOPETS.CATEGORY (ctgName) values('外出用品');
-- 商品屬性
insert into ATTRIBUTES (ctgID, attrName) values(1,'口味');
insert into ATTRIBUTES (ctgID, attrName) values(1,'規格');
insert into ATTRIBUTES (ctgID, attrName) values(2,'口味');
insert into ATTRIBUTES (ctgID, attrName) values(2,'份量');
insert into ATTRIBUTES (ctgID, attrName) values(3,'貓齡');
insert into ATTRIBUTES (ctgID, attrName) values(4,'尺寸');
insert into ATTRIBUTES (ctgID, attrName) values(4,'顏色');
-- 商品value
insert into ADOPETS.VALUE (attrID, value) values(1,'鮭魚');
insert into ADOPETS.VALUE (attrID, value) values(1,'鮪魚');
insert into ADOPETS.VALUE (attrID, value) values(1,'鯖魚');
insert into ADOPETS.VALUE (attrID, value) values(2,'6罐裝');
insert into ADOPETS.VALUE (attrID, value) values(2,'12罐裝');
insert into ADOPETS.VALUE (attrID, value) values(2,'18罐裝');
insert into ADOPETS.VALUE (attrID, value) values(3,'鮭魚');
insert into ADOPETS.VALUE (attrID, value) values(3,'鱈魚');
insert into ADOPETS.VALUE (attrID, value) values(3,'雞肉');
insert into ADOPETS.VALUE (attrID, value) values(4,'5kg');
insert into ADOPETS.VALUE (attrID, value) values(4,'10kg');
insert into ADOPETS.VALUE (attrID, value) values(4,'12kg');
insert into ADOPETS.VALUE (attrID, value) values(5,'幼貓');
insert into ADOPETS.VALUE (attrID, value) values(5,'成貓');
insert into ADOPETS.VALUE (attrID, value) values(5,'老貓');
insert into ADOPETS.VALUE (attrID, value) values(6,'S');
insert into ADOPETS.VALUE (attrID, value) values(6,'M');
insert into ADOPETS.VALUE (attrID, value) values(6,'L');
insert into ADOPETS.VALUE (attrID, value) values(7,'藍');
insert into ADOPETS.VALUE (attrID, value) values(7,'灰');
insert into ADOPETS.VALUE (attrID, value) values(7,'綠');


























CREATE TABLE `ADMIN` (
	`adminID`  int auto_increment COMMENT '管理員編號',
	`account`  varchar(30) not null COMMENT 'email',
	`password` 	varchar(20) not null COMMENT '密碼',
	`name` 		varchar(30) not null COMMENT '管理員姓名',
	`personImg` longblob COMMENT '員工照片',
	`accStatus` boolean COMMENT '使用狀態',
 	 `validateCode` int COMMENT '啟用碼',
	`createDate` 	timestamp default(now()) COMMENT  '建立日期',
    `expiredDate` 	timestamp COMMENT '過期時間',
    PRIMARY KEY (`adminID`)

) COMMENT = '管理員';

INSERT INTO ADMIN (account,password,name,personImg,accStatus) VALUES ('root@yahoo.com.tw','a12345678','root',null,true);
INSERT INTO ADMIN (account,password,name,personImg,accStatus) VALUES ('st9360606@yahoo.com.tw','a12345678','吳政言',null,true);
INSERT INTO ADMIN (account,password,name,personImg,accStatus) VALUES ('zack871025@gmail.com','a12345678','林育寬',null,true);
INSERT INTO ADMIN (account,password,name,personImg,accStatus) VALUES ('nick790308@gmail.com','a12345678','Nick',null,true);
INSERT INTO ADMIN (account,password,name,personImg,accStatus) VALUES ('splat131468@gmail.com','a12345678','阿德',null,true);
INSERT INTO ADMIN (account,password,name,personImg,accStatus) VALUES ('famousoneman@gmail.com','a12345678','烏賊',null,true);




CREATE TABLE `DONATE` (
  `donateID` int auto_increment COMMENT '捐款編號',
  `memID` 	int COMMENT '會員編號',
  `catID` 	int COMMENT '貓咪編號',
  `shelterName` varchar(30) COMMENT '收容所名稱',
  `donateName` 	varchar(30) COMMENT '捐款人姓名',
  `donateEmail`  varchar(30) not null COMMENT 'email',
  `phone`       varchar(10)  not null COMMENT '手機',
  `donateAddr` 	varchar(200) COMMENT '捐款人地址',
  `donateAmo` 	int not null COMMENT '金額',
  `donateStatus` 	int COMMENT '捐款狀態',
  `donateMes` 	varchar(200) COMMENT '捐款留言',
  `donateDate` 	timestamp default(now()) COMMENT  '捐款日期',
  PRIMARY KEY (`donateID`),
  constraint FK_DONATE_memID foreign key (memID)
  references MEMBER (memID),
  
  constraint FK_DONATE_catID foreign key (catID)
  references CATINFO (catID),
  
  constraint FK_DONATE_shelterName foreign key (shelterName)
  references SHELTERINFO (shelterName)

) COMMENT = '捐款';


INSERT INTO DONATE (memID,catID,shelterName,donateName,donateEmail,phone,
			donateAddr,donateAmo,donateStatus,donateMes,donateDate) VALUES
            (null, null, null, "POJO", "POJO@gmail.com", 0909897281, "台北市文化路一段90號", 5000, 1, "好好生活", now());






CREATE TABLE `AUTH` (
    `authID`  int auto_increment COMMENT '權限編號',
    `authName` varchar(30) COMMENT '權限名稱',
    PRIMARY KEY (`authID`)

) COMMENT = '權限';

INSERT INTO AUTH (authName) VALUES ('會員管理');
INSERT INTO AUTH (authName) VALUES ('商品管理');
INSERT INTO AUTH (authName) VALUES ('訂單管理');
INSERT INTO AUTH (authName) VALUES ('貓咪管理');
INSERT INTO AUTH (authName) VALUES ('捐款管理');
INSERT INTO AUTH (authName) VALUES ('使用者管理');
INSERT INTO AUTH (authName) VALUES ('權限管理');




CREATE TABLE `AUTHCONFIGURE` (
	`adminID`  int COMMENT '管理員編號',
    `authID`  int COMMENT '權限編號',
    
    constraint PK_AUTHCONFIGURE_adminID_authID PRIMARY KEY (adminID,authID),
    constraint FK_AUTHCONFIGURE_adminID foreign key (adminID) references ADMIN (adminID),
	constraint FK_AUTHCONFIGURE_authID foreign key (authID) references AUTH (authID)
) COMMENT = '權限配置';

INSERT INTO AUTHCONFIGURE (adminID,authID) VALUES (1, 1);
INSERT INTO AUTHCONFIGURE (adminID,authID) VALUES (1, 2);
INSERT INTO AUTHCONFIGURE (adminID,authID) VALUES (1, 3);
INSERT INTO AUTHCONFIGURE (adminID,authID) VALUES (1, 4);
INSERT INTO AUTHCONFIGURE (adminID,authID) VALUES (1, 5);
INSERT INTO AUTHCONFIGURE (adminID,authID) VALUES (1, 6);
INSERT INTO AUTHCONFIGURE (adminID,authID) VALUES (1, 7);


  
  CREATE TABLE ORDERDETAIL (
  orderDetailID  INT  AUTO_INCREMENT COMMENT '明細編號',
  orderID    INT NOT NULL COMMENT '訂單編號',
  skuID          INT NOT NULL COMMENT '規格編號',
  prodName      VARCHAR(50) NOT NULL COMMENT '商品名稱',
  prodNum         INT NOT NULL COMMENT '商品數量',
  prodPrice       INT NOT NULL COMMENT '商品單價',
  PRIMARY KEY (`orderDetailID`),
  constraint FK_ORDERDETAIL_orderID foreign key (orderID)
  references ORDERS (orderID),
   constraint FK_ORDERDETAIL_skuID foreign key (skuID)
  references SKU (skuID)
  )COMMENT = '訂單明細';

-- insert into ORDERDETAIL (orderID,skuID,prodName,prodNum,prodPrice) values(1,1,"貓罐頭",1, 80);
-- insert into ORDERDETAIL (orderID,skuID,prodName,prodNum,prodPrice) values(2,2,"貓乾糧",2, 100);
-- insert into ORDERDETAIL (orderID,skuID,prodName,prodNum,prodPrice) values(2,2,"寵物玩具",5, 50);
-- insert into ORDERDETAIL (orderID,skuID,prodName,prodNum,prodPrice) values(3,3,"胸帶/項圈",1, 200);
-- insert into ORDERDETAIL (orderID,skuID,prodName,prodNum,prodPrice) values(4,4,"寵物玩具",1, 5000);

  
   CREATE TABLE RULE (
  ruleID    INT  AUTO_INCREMENT COMMENT '規則編號',
  ruleName   VARCHAR(50) NOT NULL COMMENT '規則名稱',
  ruleDesc    VARCHAR(100) NOT NULL COMMENT '規則描述',
  PRIMARY KEY (`ruleID`)
  )COMMENT = '活動規則';
  
  
  
  
  CREATE TABLE EVENT (
  eventID   INT  AUTO_INCREMENT COMMENT '活動編號',
  ctgID    INT NOT NULL COMMENT '商品類型',
  ruleID    INT NOT NULL COMMENT '規格編號',
  startTime       timeStamp NOT NULL COMMENT '開始時間',
  endTime         timeStamp NOT NULL COMMENT '結束時間',
  para        DOUBLE NOT NULL COMMENT '參數',
  PRIMARY KEY (`eventID`),
  constraint FK_EVENT_ctgID foreign key (ctgID)
  references Category (ctgID),
   constraint FK_EVENT_ruleID foreign key (ruleID)
  references RULE (ruleID)
  )COMMENT = '活動';






CREATE TABLE `PUSHSTATEMENT` (
`memID` 	 INT COMMENT '會員名稱',
`catID` 	 INT COMMENT '貓咪編號',
`pushStatus` TINYINT COMMENT '推播狀態',
constraint PK_PUSHSTATEMENT_memID PRIMARY KEY (memID,catID),
constraint FK_PUSHSTATEMENT_memID FOREIGN KEY (memID)
references MEMBER (memID),
constraint FK_PUSHSTATEMENT_catID FOREIGN KEY (catID)
references CATINFO (catID)
)COMMENT = '推播';



