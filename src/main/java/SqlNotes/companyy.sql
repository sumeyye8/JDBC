-- 1. Example: companies tablosundan en yuksek ikinci number_of_employees degeri olan company ve number_of_employees degerlerini cagirin


-- 1.Yol OFFSET ve FETCH NEXT kullanarak 
SELECT company, number_of_employees
FROM companies
ORDER BY number_of_employees DESC
OFFSET 1 ROW -- bir sütun atla demek
FETCH NEXT 1 ROW ONLY

SELECT company, number_of_employees
FROM companies
WHERE number_of_employees = (SELECT MAX (number_of_employees)
							 FROM companies
							 WHERE number_of_employees < (SELECT MAX(number_of_employees)
							 FROM companies))


SELECT * FROM companies;