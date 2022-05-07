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
