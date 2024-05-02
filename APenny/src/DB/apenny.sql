/* Drop Tables 

DROP TABLE admins CASCADE CONSTRAINTS;
DROP TABLE banner CASCADE CONSTRAINTS;
DROP TABLE bimages CASCADE CONSTRAINTS;
DROP TABLE cart CASCADE CONSTRAINTS;
DROP TABLE odetail CASCADE CONSTRAINTS;
DROP TABLE orders CASCADE CONSTRAINTS;
DROP TABLE members CASCADE CONSTRAINTS;
DROP TABLE membership CASCADE CONSTRAINTS;
DROP TABLE product CASCADE CONSTRAINTS;
DROP TABLE pcategory CASCADE CONSTRAINTS;
DROP TABLE temperature CASCADE CONSTRAINTS;
DROP TABLE payment CASCADE CONSTRAINTS;
*/


/* Drop Sequences 

DROP SEQUENCE banner_bseq;
DROP SEQUENCE bimages_biseq;
DROP SEQUENCE cart_cseq;
DROP SEQUENCE odetail_odseq;
DROP SEQUENCE orders_oseq;
DROP SEQUENCE membership_msseq;
DROP SEQUENCE pcategory_pcseq;
DROP SEQUENCE product_pseq;
DROP SEQUENCE temperature_tseq;
DROP SEQUENCE payment_pmseq;
*/



/* Create Sequences */

CREATE SEQUENCE banner_bseq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE bimages_biseq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE cart_cseq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE odetail_odseq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE orders_oseq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE membership_msseq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE pcategory_pcseq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE product_pseq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE temperature_tseq INCREMENT BY 1 START WITH 1;
CREATE SEQUENCE payment_pmseq INCREMENT BY 1 START WITH 1;



/* Create Tables */

CREATE TABLE admins
(
	adminid varchar2(30) NOT NULL,
	pwd varchar2(30) NOT NULL,
	aname varchar2(30) NOT NULL,
	tel varchar2(30) NOT NULL,
	email varchar2(30) NOT NULL,
	PRIMARY KEY (adminid)
);


CREATE TABLE banner
(
	bseq number NOT NULL,
	biseq number NOT NULL,
	priority number NOT NULL,
	useyn char(1) DEFAULT 'Y',
	PRIMARY KEY (bseq)
);


CREATE TABLE bimages
(
	biseq number NOT NULL,
	bname varchar2(50) NOT NULL,
	image varchar2(100) NOT NULL,
	PRIMARY KEY (biseq)
);


CREATE TABLE cart
(
	cseq number NOT NULL,
	tseq number NOT NULL,
	pseq number NOT NULL,
	qty number NOT NULL,
	PRIMARY KEY (cseq)
);
select * from cart;
select * from cview;
delete from cart;


CREATE TABLE members
(
	tel2 varchar2(20) NOT NULL,
	tel1 varchar2(5) DEFAULT '010' NOT NULL,
	nick varchar2(15) NOT NULL,
	b_year varchar2(4) NOT NULL,
	b_month varchar2(2) NOT NULL,
	b_date varchar2(2) NOT NULL,
	regdate varchar2(20) DEFAULT 'sysdate' NOT NULL,
	useyn char(1) DEFAULT 'Y',
	PRIMARY KEY (tel2)
);

CREATE TABLE membership(
	msseq number NOT NULL,
	tel2 varchar2(20) NOT NULL,
	point number DEFAULT 0 NOT NULL,
	PRIMARY KEY (msseq)
);


CREATE TABLE odetail
(
	odseq number NOT NULL,
	oseq number NOT NULL,
	pseq number NOT NULL,
	pmseq number NOT NULL,
	qty number NOT NULL,
	PRIMARY KEY (odseq)
);


CREATE TABLE orders
(
	oseq number NOT NULL,
	tel2 varchar2(10) NOT NULL,
	odate varchar2(30) DEFAULT 'sysdate' NOT NULL,
	state char(1) DEFAULT '1' NOT NULL,
	PRIMARY KEY (oseq)
);


CREATE TABLE pcategory
(
	pcseq number NOT NULL,
	pcname varchar2(50) NOT NULL,
	PRIMARY KEY (pcseq)
);


CREATE TABLE product
(
	pseq number NOT NULL,
	pcseq number NOT NULL,
	tseq number NOT NULL,
	pname varchar2(30) NOT NULL,
	descript varchar2(100) NOT NULL,
	image varchar2(100) NOT NULL,
	bestyn char(1) DEFAULT 'N',
	useyn char(1) DEFAULT 'Y',
	price1 number NOT NULL,
	price2 number NOT NULL,
	price3 number NOT NULL,
	PRIMARY KEY (pseq)
);


CREATE TABLE temperature
(
	tseq number NOT NULL,
	tname varchar2(20) NOT NULL,
	PRIMARY KEY (tseq)
);

CREATE TABLE payment(
	pmseq number NOT NULL,
	pmname varchar2(20) NOT NULL,
	pmimage varchar2(20) NOT NULL,
	PRIMARY KEY (pmseq)
);



/* Create Foreign Keys */

ALTER TABLE banner
	ADD FOREIGN KEY (biseq)
	REFERENCES bimages (biseq)
;


ALTER TABLE orders
	ADD FOREIGN KEY (tel2)
	REFERENCES members (tel2)
;


ALTER TABLE odetail
	ADD FOREIGN KEY (oseq)
	REFERENCES orders (oseq)
;


ALTER TABLE product
	ADD FOREIGN KEY (pcseq)
	REFERENCES pcategory (pcseq)
;


ALTER TABLE cart
	ADD FOREIGN KEY (pseq)
	REFERENCES product (pseq)
;

ALTER TABLE cart
	ADD FOREIGN KEY (tseq)
	REFERENCES temperature (tseq)
;


ALTER TABLE odetail
	ADD FOREIGN KEY (pseq)
	REFERENCES product (pseq)
;

ALTER TABLE odetail
	ADD FOREIGN KEY (pmseq)
	REFERENCES payment (pmseq)
;

ALTER TABLE product
	ADD FOREIGN KEY (tseq)
	REFERENCES temperature (tseq)
;

ALTER TABLE membership
	ADD FOREIGN KEY (tel2)
	REFERENCES members (tel2)
;




/* Create View */
CREATE OR REPLACE VIEW pview AS
SELECT p.pseq, t.tseq, t.tname, pc.pcseq, pc.pcname, p.pname, p.descript,
p.image, p.price1, p.price2, p.price3
FROM product p, temperature t, pcategory pc
WHERE p.tseq = t.tseq AND p.pcseq = pc.pcseq;
select * from pview;



CREATE OR REPLACE VIEW bview AS
SELECT b.bseq, b.useyn, b.priority, bi.biseq, bi.bname, bi.image
FROM banner b, bimages bi
WHERE b.biseq = bi.biseq;
select * from bview;



CREATE OR REPLACE VIEW cview AS
SELECT c.cseq, c.pseq, t.tname, p.pname, c.qty, p.price2, p.image
FROM cart c, product p, temperature t
WHERE c.pseq = p.pseq and c.tseq = t.tseq;
select * from cview;




/* Insert Data */
INSERT INTO members (userid, pwd, name, gender, tel1, tel2, tel3, b_year, b_month, b_date)
VALUES('kim', '1234', '김일번', 'F', '010', '1111', '1111', '2000', '11', '15' );


INSERT INTO pcategory (pcseq, pcname) VALUES(pcategory_pcseq.nextval, '커피/에스프레소');
INSERT INTO pcategory (pcseq, pcname) VALUES(pcategory_pcseq.nextval, '라떼/밀크티');
INSERT INTO pcategory (pcseq, pcname) VALUES(pcategory_pcseq.nextval, '에이드/주스');
INSERT INTO pcategory (pcseq, pcname) VALUES(pcategory_pcseq.nextval, '스무디');
INSERT INTO pcategory (pcseq, pcname) VALUES(pcategory_pcseq.nextval, '디저트');


INSERT INTO temperature (tseq, tname) VALUES(temperature_tseq.nextval, 'HOT/따뜻한');
INSERT INTO temperature (tseq, tname) VALUES(temperature_tseq.nextval, 'ICED/차가운');
INSERT INTO temperature (tseq, tname) VALUES(temperature_tseq.nextval, 'ONLY HOT');
INSERT INTO temperature (tseq, tname) VALUES(temperature_tseq.nextval, 'ONLY ICED');


INSERT INTO product (pseq, pcseq, tseq, pname, descript, image, price1, price2, price3)
VALUES(product_pseq.nextval, 1, 1, '아메리카노', '따뜻한 아메리카노입니다', 'hotAmericano.jpg', 1000, 4500, 3500);
INSERT INTO product (pseq, pcseq, tseq, pname, descript, image, price1, price2, price3)
VALUES(product_pseq.nextval, 1, 2, '아메리카노', '차가운 아메리카노입니다', 'iceAmericano.jpg', 1000, 4500, 3500);
INSERT INTO product (pseq, pcseq, tseq, pname, descript, image, price1, price2, price3)
VALUES(product_pseq.nextval, 2, 1, '민트초코라떼', '따뜻한 민트초코라떼입니다', 'hotMintChoco.jpg', 2000, 5500, 3500);
INSERT INTO product (pseq, pcseq, tseq, pname, descript, image, price1, price2, price3)
VALUES(product_pseq.nextval, 2, 2, '민트초코라떼', '차가운 민트초코라떼입니다', 'iceMintChoco.jpg', 2000, 5500, 3500);
INSERT INTO product (pseq, pcseq, tseq, pname, descript, image, price1, price2, price3)
VALUES(product_pseq.nextval, 3, 4, '매직에이드', '마법같은 에이드입니다', 'magicAde.jpg', 1500, 5500, 4000);
INSERT INTO product (pseq, pcseq, tseq, pname, descript, image, price1, price2, price3)
VALUES(product_pseq.nextval, 4, 4, '유니콘 프라페', '유니콘을 닮은 프라페입니다', 'unicornFrappe.jpg', 2500, 6500, 4000);


INSERT INTO bimages (biseq, bname, image) VALUES(bimages_biseq.nextval, 'season', 'winter1.jpg');
INSERT INTO bimages (biseq, bname, image) VALUES(bimages_biseq.nextval, 'season', 'winter2.jpg');

INSERT INTO banner (bseq, biseq, priority) VALUES(banner_bseq.nextval, 1, 1);
INSERT INTO banner (bseq, biseq, priority) VALUES(banner_bseq.nextval, 2, 2);

INSERT INTO payment (pmseq, pmname, pmimage) VALUES (payment_pmseq.nextval, '신용카드', 'creditcard.png' );
INSERT INTO payment (pmseq, pmname, pmimage) VALUES (payment_pmseq.nextval, '모바일쿠폰', 'giftcon.png' );
INSERT INTO payment (pmseq, pmname, pmimage) VALUES (payment_pmseq.nextval, '기프트카드', 'giftcard.png' );
INSERT INTO payment (pmseq, pmname, pmimage) VALUES (payment_pmseq.nextval, '카카오페이', 'kakaopay.png' );
INSERT INTO payment (pmseq, pmname, pmimage) VALUES (payment_pmseq.nextval, '포인트 결제', 'point.png');





















/* Drop Triggers 

DROP TRIGGER TRI_banner_bseq;
DROP TRIGGER TRI_bimages_biseq;
DROP TRIGGER TRI_cart_cseq;
DROP TRIGGER TRI_odetail_odseq;
DROP TRIGGER TRI_orders_oseq;
DROP TRIGGER TRI_pcategory_pcseq;
DROP TRIGGER TRI_pdeail_pdseq;
DROP TRIGGER TRI_pdetail_pdseq;
DROP TRIGGER TRI_pkind_pkseq;
DROP TRIGGER TRI_product_category_pcseq;
DROP TRIGGER TRI_product_category_pdseq;
DROP TRIGGER TRI_product_pseq;
DROP TRIGGER TRI_temperature_tseq;
*/




/* Create Triggers 

CREATE OR REPLACE TRIGGER TRI_banner_bseq BEFORE INSERT ON banner
FOR EACH ROW
BEGIN
	SELECT SEQ_banner_bseq.nextval
	INTO :new.bseq
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_bimages_biseq BEFORE INSERT ON bimages
FOR EACH ROW
BEGIN
	SELECT SEQ_bimages_biseq.nextval
	INTO :new.biseq
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_cart_cseq BEFORE INSERT ON cart
FOR EACH ROW
BEGIN
	SELECT SEQ_cart_cseq.nextval
	INTO :new.cseq
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_odetail_odseq BEFORE INSERT ON odetail
FOR EACH ROW
BEGIN
	SELECT SEQ_odetail_odseq.nextval
	INTO :new.odseq
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_orders_oseq BEFORE INSERT ON orders
FOR EACH ROW
BEGIN
	SELECT SEQ_orders_oseq.nextval
	INTO :new.oseq
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_pcategory_pcseq BEFORE INSERT ON pcategory
FOR EACH ROW
BEGIN
	SELECT SEQ_pcategory_pcseq.nextval
	INTO :new.pcseq
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_pdeail_pdseq BEFORE INSERT ON pdeail
FOR EACH ROW
BEGIN
	SELECT SEQ_pdeail_pdseq.nextval
	INTO :new.pdseq
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_pdetail_pdseq BEFORE INSERT ON pdetail
FOR EACH ROW
BEGIN
	SELECT SEQ_pdetail_pdseq.nextval
	INTO :new.pdseq
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_pkind_pkseq BEFORE INSERT ON pkind
FOR EACH ROW
BEGIN
	SELECT SEQ_pkind_pkseq.nextval
	INTO :new.pkseq
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_product_category_pcseq BEFORE INSERT ON product_category
FOR EACH ROW
BEGIN
	SELECT SEQ_product_category_pcseq.nextval
	INTO :new.pcseq
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_product_category_pdseq BEFORE INSERT ON product_category
FOR EACH ROW
BEGIN
	SELECT SEQ_product_category_pdseq.nextval
	INTO :new.pdseq
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_product_pseq BEFORE INSERT ON product
FOR EACH ROW
BEGIN
	SELECT SEQ_product_pseq.nextval
	INTO :new.pseq
	FROM dual;
END;

/

CREATE OR REPLACE TRIGGER TRI_temperature_tseq BEFORE INSERT ON temperature
FOR EACH ROW
BEGIN
	SELECT SEQ_temperature_tseq.nextval
	INTO :new.tseq
	FROM dual;
END;

/
*/



