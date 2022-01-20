--DATABASE
create database helperland
use helperland
Go
--USER TABLE
create table user_tbl(
	user_ID int not null primary key,
	First_name varchar(50) not null,
	Last_name varchar(50) not null,
	Email_id varchar(50) not null Unique,
	DOB date not null,
	Mobile_no varchar(10) not null,
	CONSTRAINT chk_Mobile_no CHECK (Mobile_no NOT LIKE '%[^0-9]%'),
	Nationality varchar(20) not null,
	Address_ID int FOREIGN KEY REFERENCES address_tbl(Address_ID)
)
alter table user_tbl add Gender varchar(20) not null
select * from user_tbl

--ADDRESS TABLE
create table address_tbl(
	Address_ID int not null primary key,
	House_no varchar(10) not null,
	Society_name varchar(30) not null,
	Area varchar(30) not null,
	Postalcode varchar(30) not null,
	City varchar(30) not null,
	Phone_no varchar(10) not null,
	CONSTRAINT chk_Phone_no CHECK (Phone_no NOT LIKE '%[^0-9]%'),
	) 
select * from address_tbl


--SERVICE PROVIDER
create table service_provider(
	service_provider_ID int not null primary key,
	First_name varchar(50) not null,
	Last_name varchar(50) not null,
	Email_id varchar(50) not null Unique,
	DOB date not null,
	Contact_no varchar(10) not null,
	CONSTRAINT chk_Contact_no CHECK (Contact_no NOT LIKE '%[^0-9]%'),
	Gender varchar(20) not null,
	Address_ID int FOREIGN KEY REFERENCES address_tbl(Address_ID)
)
select * from service_provider

--BOOK SERVICE
create table book_service(
	book_service_ID int not null primary key,
	Service_date date not null,
	Starting_time time not null,
	Time_Duration varchar(20) not null,
	Address_Id int FOREIGN KEY REFERENCES address_tbl(Address_ID),
	Inside_cabinets bit default 0,
	Inside_fridge bit default 0,
	Inside_own bit default 0,
	Laundry_wash bit default 0,
	Comment varchar(100) ,
	Payment float ,
	Request_ID int not null FOREIGN KEY REFERENCES user_tbl(user_ID),
	Accept_ID int not null FOREIGN KEY REFERENCES service_provider(service_provider_ID)
)
select *from book_service
drop table book_service

--RATING
create table rating(
	rating_ID int not null primary key,
	service_provider_ID int not null FOREIGN KEY REFERENCES service_provider(service_provider_ID),
	user_ID inT not null FOREIGN KEY REFERENCES user_tbl(user_ID),
	Rating_date date not null,
	Rating_time time not null,
	Poor_rating bit default 0,
	Better_rating bit default 0,
	Good_rating bit default 0,
	Verygood_rating bit default 0,
	Excillent_rating bit default 0
)
select * from rating

-- BLOCK(PROVIDER)
create table block_provider(
	block_ID int  not null primary key,
	block_helper_provider_ID int not null FOREIGN KEY REFERENCES service_provider(service_provider_ID),
	blocker_ID int not null FOREIGN KEY REFERENCES user_tbl(user_ID),
)
select * from block_provider
--FAVORITE(PROVIDER)
create table favorite_provider(
	favorite_ID int  not null primary key,
	favorite_helper_provider_ID int not null FOREIGN KEY REFERENCES service_provider(service_provider_ID),
	user_ID int not null FOREIGN KEY REFERENCES user_tbl(user_ID),
)
select * from favorite_provider