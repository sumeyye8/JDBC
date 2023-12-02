CREATE TABLE workers (

	id int,
	name varchar(20),
	title varchar(60),
	manager_id int
);

INSERT INTO workers VALUES (1, 'Ali Can', 'Dev', 2);
INSERT INTO workers VALUES (2, 'John Davis', 'A', 3);
INSERT INTO workers VALUES (3, 'Angie Star', 'Dev Lead', 4);
INSERT INTO workers VALUES (4, 'Amy Sky', 'CEO', 5);

select * from workers;

--1) Tabloya company_industr isminde sütun ekleyin
alter table workers add company_industry varchar(20);


--2) Tabloya worker_address sütunu ve default olarak da 'Miami, FL, USA' adresini ekleyin
alter table workers add worker_address varchar(100) default 'Miami,FL,USA';

--3) Tablodaki worker_address sütununu silin
alter table workers drop column worker_address;

--4) ablodaki company_industry sütununu, company_profession olarak degistirin
alter table workers rename column company_industry to company_profession;

--5) Tablonun ismini employees olarak degistirin
alter table workers rename to employees;
select * from employees;

--6) Tablodaki title sütununa data tipini VARCHAR(50) olarak degistirin
alter table employees alter column title type Varchar(50);

--7) Tablodaki title sütununa "UNİQUE" kisitlamasi ekleyin
alter table employees add constraint title unique (title);	 -- olmayacak cunku CEO'dan iki tane var




