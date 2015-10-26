set echo on
spool D:\IS380SQL\Project\Due1\setup.txt
-- Minh Le
-- IS380
-- First Deliverable


-- create table Product
create table Product(
	Prod_num varchar2(10),
	Pname varchar2(10),
	UnitPrice number(10, 2),
	primary key(Prod_num));

-- insert data to Product
insert into Product values('P1', 'Pencil 1', 1.00);
insert into Product values('P2', 'Pencil 2', 2.00);  
insert into Product values('P3', 'Pencil 3', 3.00);
insert into Product values('P4', 'Pencil 4', 4.00);
insert into Product values('P5', 'Pencil 5', 5.00);
insert into Product values('P6', 'Pencil 6', 6.00);

-- create table Code
create table Code(
	Code_num varchar2(3),
	C_discription varchar2(30),
	primary key(Code_num));

-- insert data to Code
insert into Code values('C1', 'Defective');
insert into Code values('C2', 'Dislike Styling');
insert into Code values('C3', 'Dislike Color');
insert into Code values('C4', 'Expected Better Quality');
insert into Code values('C5', 'Changed Mind');
insert into Code values('C6', 'Not As Described');
insert into Code values('C7', 'Not As Expected');
insert into Code values('C8', 'Wrong Item Shipped');
insert into Code values('C9', 'Recieved Damaged');
insert into Code values('C10', 'Canceled Order');

-- create table Customer
create table Customer(
	Cust_num varchar2(10),
	Firstname varchar2(20),
	Lastname varchar2(20),
	Address# varchar2(100),
	City varchar2(20),
	StateName varchar2(2),
	Zipcode number(10),
	Phone varchar2(10),
	primary key(Cust_num));

-- insert data to Customer
insert into Customer values('101', 'Andy', 'Drew', '123 Andy Street', 'Long Beach', 'CA', 90815, '7144566787');
insert into Customer values('102', 'Betty', 'Tran', '234 Betty Street', 'Westminster', 'CA', 92834, '7142563956');
insert into Customer values('103', 'Cindy', 'Lee', '321 Cindy Street', 'Fountain Valley', 'CA', 90817, '5623658564');
insert into Customer values('104', 'David', 'Nguyen', '741 David Street', 'Cerritos', 'CA', 90818, '3032563254');
insert into Customer values('105', 'Ellen', 'Hoang', '123 Ellen Street', 'Lakewood', 'CA', 90820, '5623568456');
insert into Customer values('106', 'Fiona', 'Ngo', '123 Fiona Street', 'San Pedro', 'CA', 91187, '5621450239');
insert into Customer values('107', 'George', 'Nguyen', '123 George Street', 'Garden Grove', 'CA', 97672, '7145203690');

-- create table RA
create table RA(
	RA# number(10),
	RAdateOpen date,
	RAdateClose date,
	Cust_num varchar2(10),
	Prod_num varchar2(10),
	Code_num varchar2(10),		
	UnitPrice number(10, 2),
	RequestQty number(10),
	RequestAmt_$ number(10, 2),
	ActReturnQty number(10),
	ActReturnAmt_$ number(10, 2),
	RA_Status varchar2(10),
	primary key(RA#),
	constraint fk_RA_Cust_num foreign key(Cust_num) references Customer(Cust_num),
	constraint fk_RA_Code_num foreign key(Code_num) references Code(Code_num),
	constraint fk_RA_Prod_num foreign key(Prod_num) references Product(Prod_num)); 

-- create table counter
create table counter(
	max_num number(5));
-- insert the start number of the counter
insert into counter values(1000);

set echo off
	
spool off
	