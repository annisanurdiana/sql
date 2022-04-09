CREATE DATABASE MidExam_DB;
USE MidExam_DB;

CREATE TABLE member
(id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(100) NOT NULL,
 age INT,
 gender VARCHAR(100),
 address VARCHAR(100),
 member_since INT
) ENGINE = InnoDB;

INSERT INTO member (id, name, age, gender, address, member_since)
VALUES('','Andre',23,'Male','Cikarang',2010),
	('','Andriana',21,'Female','Jakarta',2020),
	('','Tedy',25,'Male','Cikarang',2020),
	('','Anwar',19,'Male','Bandung',2013),
	('','Jeni',27,'Female','Jakarta',2020);


CREATE TABLE benefit
(id INT PRIMARY KEY AUTO_INCREMENT,
 product_of_benefit VARCHAR(100) NOT NULL,
 type_of_benefit VARCHAR(100),
 how_long INT
)ENGINE = InnoDB;

INSERT INTO benefit (id, product_of_benefit, type_of_benefit, how_long)
VALUES('','Memberships','Discount',2),
	('','Sport Stadium','Discount',5),
	('','Parking Voucher','Free',1),
	('','Game Tickets','Big discount',5);


CREATE TABLE usage_of_benefit
(id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
 year INT,
 id_member INT NOT NULL,
 id_product_of_benefit INT,
 status VARCHAR(100),
 CONSTRAINT fk_usage_of_benefit_member
	FOREIGN KEY(id_member) REFERENCES member (id)
)ENGINE = InnoDB;

INSERT INTO usage_of_benefit(id, year, id_member, id_product_of_benefit, status)
VALUES('',2014,1,2,'Expired'),
	('',2020,2,1,'Valid'), 
	('',2020,2,2,'Valid'),
	('',2021,3,3,'Valid'), 
	('',2020,3,4,'Valid');




