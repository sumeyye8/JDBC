CREATE TABLE workers
(
	id CHAR(9),
	name VARCHAR(50),
	state VARCHAR(50),
	salary SMALLINT,
	company VARCHAR(20)
);

INSERT INTO workers VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO workers VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO workers VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO workers VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO workers VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO workers VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO workers VALUES(123456710, 'Mark Stone', 'Pennslvania', 2500, 'IBM');

select * from workers;

-- Toplam salary degeri 2500 uzeri olan her bir calisan icin salary toplamini bulun

SELECT NAME, SUM(salary) AS "Total Salary"  --> çift tirnak sadece AS'den sonra kullanilir
FROM workers
GROUP BY name
HAVING SUM(salary) > 2500;  --> "Group By" ardindan "where" kullanilmaz


-- birden fazla calisani olan, her bir state icin calisan toplamlarini bulun

select state, count(state) AS number_of_employees
from workers
group by state
having count(state) > 1;  -- HAVİNG, GROUP BY ardindan filtreleme icin kullanilir


-- her bir state icin state degeri 3000'den az olan maximum salar degerlerini bulun

select state, max(salary)
from workers
group by state
having max(salary) < 3000;


--  her bir company icin degeri 2000'den fazla olan minimum salary degerlerini bulun

select company, min(salary) AS min_salary
from workers
group by company
having min(salary) > 2000;


--  Tekrarsiz isimleri cagirin

select distinct name		-- DISTINCT clause, cagrilan terimlerden tekrarli olanlarin sadece birincisini alir 
select * from workers;


-- Name degerlerini company kelime uzunluklarina gore siralayin

select name, company
from workers
ORDER BY LENGTH(company);


--  Tum name ve state degerlerini ayni sutunda cagirarak her bir sutun degerinin uzunluguna gore siralayin

--- 1. Yol
select CONCAT(name, ' ', state) AS name_and_state
from workers
ORDER BY LENGTH(CONCAT(name, state));   -- diger yol ; LENGTH(name) + LENGTH(state);


--- 2. Yol
select name || ' ' || state || ' ' || LENGTH(name) + LENGTH(state) AS "Name and States"
from workers
ORDER BY LENGTH(name) + LENGTH(state);

--- || name ve state'i toplamak, bir araya getirmek icin kullandik


/*
	UNION Operator:  1) Iki sorgu(query) sonucunu birlestirmek icin kullanilir 
					 2) Tekrarsiz(unique) recordlari verir
    				 3) Tek bir sutuna cok sutun koyabiliriz
                     4) Tek bir sutuna cok sütun koyarken mevcut data durumuna dikkat etmek gerekir	
	*/


-- salary degeri 3000'den yuksek olan state degerlerini ve salary degeri 2000'den kucuk olan name degerlerini tekrarsiz olarak bulun

SELECT state AS "Name and State", salary
FROM workers
WHERE salary > 3000

UNION

SELECT name, salary
FROM workers
WHERE salary < 2000;


-- salary degeri 3000'den yuksek olan state degerlerimi ve 2000'den kucuk olan name degerlerini tekrarli olarak bulun

SELECT state AS "Name and State", salary
FROM workers
WHERE salary > 3000

UNION ALL  --> UNION ile ayni isi yapar. Ancak tekrarli degerleri de verir

SELECT name, salary
FROM workers
WHERE salary < 2000;



/*
	INTERSECT Operator: Iki sorgu(query) sonucunun ortak(common) degerlerini verir.
						Unique(tekrarsiz) recordlari verir
*/


-- salary degeri 1000'den yuksek, 2000'den az olan "ortak" name degerlerini bulun

select name
from workers
where salary > 1000

INTERSECT 

select name
from workers
where salary < 2000;


-- salary degeri 2000'den az olan ve company dgeri IBM, APPLE ya da MICROSOFT olan ortak name degerlerini bulun

select name
from workers
where salary < 2000

INTERSECT

select name
from workers
where IN( 'IBM', 'APPLE', 'MICROSOFT');


/*

EXCEPT Operator: Bir sorgu sonucundan baska bir sorgu sonucunu cikarmak icin kullanilir
					Unique(tekrarsiz) recordlari verir
				
*/


-- salary degeri 3000'den az ve GOOGLE'da calismayan name degerlerini bulun

select name
from workers
where salary < 3000

EXCEPT

select name
from workers
where company = 'GOOGLE';



CREATE TABLE my_companies
(
	company_id CHAR(3),
	company_name VARCHAR(20)
	
);

INSERT INTO my_companies VALUES(100, 'IBM');
INSERT INTO my_companies VALUES(101, 'GOOGLE');
INSERT INTO my_companies VALUES(102, 'MICROSOFT');
INSERT INTO my_companies VALUES(103, 'APPLE');

select * from my_companies;






CREATE TABLE orders
(
	company_id CHAR(3),
	order_id CHAR(3),
	order_date DATE
	
);


INSERT INTO orders VALUES(101, 11, '17-Apr-2020');
INSERT INTO orders VALUES(102, 22, '18-Apr-2020');
INSERT INTO orders VALUES(103, 33, '19-Apr-2020');
INSERT INTO orders VALUES(104, 44, '20-Apr-2020');
INSERT INTO orders VALUES(105, 55, '21-Apr-2020');

select * from orders;



/*

JOINS:	1) INNER JOIN: Ortak (common) datayi verir  
		2) LEFT JOIN: Birinci table'in tum datasini verir
		3) RIGHT JOIN: Ikinci table'in tum datasini verir 
		4) FULL JOIN: Iki table'in da tum datasini verir
		5) SELF JOIN: Tek table uzerinde calisirken iki table varmis gibi calisilir 
*/



-- 1)INNER JOIN 

-- Ortak companyler icin company_name, order_id, order_id ve order_date degerlerini cagirin

SELECT mc.company_name, o.order_id, o.order_date
FROM my_companies mc INNER JOIN orders o
ON mc.company_id = o.company_id;

-- 2)LEFT JOIN

--- my_companies table'indaki companyler icin order_id ve order_date degerlerini girin

select mc.company_name, o.order_id, o.order_date
from my_companies mc LEFT JOIN orders o
ON mc.company_id = o.company_id;


-- 3)RIGHT JOIN

-- Orders table'indaki companyler icin company_name, company_id ve order_date degerlerini cagirin

SELECT mc.company_name, o.company_id, o.order_date
FROM my_companies mc RIGHT JOIN orders o
ON mc.company_id = o.company_id;


-- 4)FULL JOIN

-- Iki table'dan da company_name, order_id ve order_date degerlerini cagirin

SELECT mc.company_name, o.order_id, o.order_date
FROM orders o FULL JOIN my_companies mc
ON mc.company_id = o.company_id;


-- 5)SELF JOIN

CREATE TABLE workers
(
	id CHAR(2),
	name VARCHAR(20),
	title VARCHAR(60),
	manager_id CHAR(2)

);



INSERT INTO workers VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO workers VALUES(2, 'John Walker', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'QA Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);


SELECT * FROM workers;


-- workers tablosunu kullanarak calisanlarin yoneticilerini gosteren bir tablo hazirlayin

SELECT employee.name AS Employee, manager.name AS Manager
FROM workers employee FULL JOIN workers manager
ON emplyoyee.manager_id = manager.id;













