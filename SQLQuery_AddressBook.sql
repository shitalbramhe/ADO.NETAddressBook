--UC1
create database AddressBookServiceDB
use AddressBookServiceDB

--UC2
create table AddressBookTable
(
id int identity (1,1) primary key, 
firstname varchar(150),
lastname varchar(150),
address varchar(150),
city varchar(150),
state varchar(150),
zip Bigint,
phonenumber bigint,
email varchar(150)
);


--UC3
insert into AddressBookTable(firstname,lastname,address,city,state,zip,phonenumber,email)
values('Sagar','Raut','78 Nandanvan','Nagpur','Maharashtra',440034,9842905050,'sagar@gmail.com'),
('Prafull','Bajait','83 Heritage Rd','Chennai','Tamil Nadu',134002,98402000,'prafull@gmail.com'),
('Jaya','Bramhe','19 Itwari','Lucknow','Uttar Pradesh',113201,87210505053,'jayahjk@gmail.com'),
('Megha','Maske','35 Civillines','Bangalore','Karnataka',243001,9842905050,'meghadsd@gmail.com'),
('Aniket','Shende','34 Manewada','Nagpur','Maharashtra',440024,7089805050,'aniket@gmail.com'),
('Prajakta','Nihare','92 Mahalgi','Nagpur','Maharashtra',440034,9842905050,'praju@gmail.com');


select * from AddressBookTable


--UC4
update AddressBookTable set email= 'sagarraut1234@gmail.com' where firstname='Sagar'


--UC5
delete from AddressBookTable where firstname='Jaya';

--UC6
select * from AddressBookTable where city='Nagpur' or state='Maharashtra'


--UC7
select Count(*) as count, state from AddressBookTable Group by state
select Count(*) as count, city from AddressBookTable Group by city

--UC8
select * from AddressBookTable where city='Nagpur' order by firstname 

--UC9
alter table AddressBookTable add name varchar(150), type varchar(150)
update AddressBookTable set name ='friendname', type = 'Friend' where firstname ='Sagar'
update AddressBookTable set name ='Sister', type = 'Family' where firstname ='Prajakta'
update AddressBookTable set name ='Manager', type = 'Profession' where firstname ='Aniket'

--UC10
select Count(*) type from AddressBookTable group by type