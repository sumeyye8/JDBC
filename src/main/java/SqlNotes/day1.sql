--Personel isminde bir tablo olusturalim
CREATE table personel(
pers_id int,
isim varchar(30),
sehir varchar(30),
maas int,
sirket varchar(20),
adres varchar(50)
);
-- Var olan personel tablosundan per_id,sehir,adres fieldelarina sahip personel_adres adinda yeni bir tablo olusturalim
create table personel_adres(
as
select pers_id, sehir, adres from personel;








)




















