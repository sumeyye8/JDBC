--sql_practice 1

create table personel(

id serial primary key ,	 -- serial id 'yi auto increment gibi otomatik artirir
isim varchar(20),
yas int,
maas int,
email varchar(30)
);


-- auto_increment kullandigimizda otomatik olarak id'ler 1' den baslayacaktir
insert into personel (isim, yas, maas, email) values ('Ali', 39, 12500, 'ali@gmail.com');
insert into personel (isim, yas, maas, email) values ('Derya', 28, 15000, 'derya@yahoo.com');
insert into personel (isim, yas, maas, email) values ('Sevim', 24, 25000, 'sevim@hotmail.com');
insert into personel (isim, yas, maas, email) values ('Yusuf', 32, 18000, 'yusuf@gmail.com');
insert into personel (isim, yas, maas, email) values ('Halil', 48, 22000, 'halil@gmail.com');
insert into personel (isim, yas, maas, email) values ('Ece', 54, 21000, 'ece@gmail.com');
insert into personel (isim, yas, maas, email) values ('Can', 38, 19000, 'can@gmail.com');
insert into personel (isim, yas, maas, email) values ('Elif', 27, 14000, 'elif@gmail.com');
insert into personel (isim, yas, maas, email) values  ('Ezgi', 38, 21000, 'ezgi@gmail.com');
insert into personel (isim, yas, maas, email) values ('Sena', 25, 11000, NULL);



-- 1) Tablo bilgilerini listeleyiniz
select * from personel;

-- 2) isim, yas ve maas bilgilerini listeleyiniz
select isim, yas, maas from personel;

-- 3) id'si 8 olan personel bilgilerini listeleyiniz

select * from personel where id=8;

-- 4) id'si 5 olan personelin isim, yas, maas, email bilgilerini listeleyiniz
select isim, id, yas, maas, email from personel where id=5;

-- 5) 30 yasindan buyuk personel bilgilerini listeleyiniz
select * from personel where yas>30;

-- 6) maasi 21000 olmayan personel bilgilerini listeleyiniz
select * from personel where maas <>21000;

-- 7) ismi a harfi ile baslayan personel bilgilerini listeleyiniz
select * from personel where isim ilike 'A%' ; 	-- % isareti ne ile devam ederse etsin demek

-- 8) ismi n harfi ile biten personel bilgilerini listeleyiniz
select * from personel where isim  ilike '%n' ;

-- 9) email adresi gmail olan personel bilgilerini listeleyiniz
select * from personel where email like '%@gmail.com';

-- 10) email adresi gmail olmayan personel bilgilerini listeleyiniz
select * from personel where email not like '%@gmail.com';     -- % ile arama yaptiimiz icin NULL gelmez

-- 11)  id'si 3, 5, 7 ve 9 olan personel bilgilerini listeleyiniz
select * from personel where id in(3,5,7,9);

-- 12) yasi 39,48 ve 54 olmayan personel bilgilerini listeleyiniz
select * from personel where yas not in (39, 48,54);

-- 13) yasi 30 ve 40 arasinda olmayan personel bilgilerini listeleyiniz
select * from personel where yas between 30 and 40; 

-- 14) yasi 30 ve 40 arasinda olmayan personel bilgilerini listeleyeniz
select * from personel where yas not between 30 and 40;

-- 15) emaili null olan personel bilgilerini listeleyeniz
select * from personel where  email is null;

-- 16) personel bilgilerini yasa gore siralayiniz
select * from personel order by yas;  -- dogal siralamasi kucukten buyuge  asc

-- 17) personel bilgilerini maasa gore siralayiniz
select * from personel order by maas;

-- 18) personelin yaslarini buyukten kucuge dogru siralayiniz
select * from personel order by yas desc;  --buyukten kucuge sıralar desc

-- 19) personelin maaslarini buyukten kucuge dogru siralayiniz
select * from personel order by maas desc;

-- 20) en yuksek maas olan ilk 3 personel bilgilerini siralayiniz
select * from personel order by maas desc limit 3; -- ilk üçü aldık, sondan üçü almak istersek desc yazmadan alabiliriz

-- 21)













