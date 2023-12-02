--Function olusturma
--1. Example: İki parametre ile calisip bu parametreleri toplayarak return yapan bir fonksiyon olusturun

CREATE OR REPLACE FUNCTION toplamaF(x NUMERIC, y NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql
AS
$$
 BEGIN 

 RETURN x+y;

 END
$$

SELECT * FROM toplamaF(15,25) AS toplam;





