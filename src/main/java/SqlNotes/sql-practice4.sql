CREATE TABLE calisanlar
(
id int,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);


INSERT INTO calisanlar VALUES(123456789, 'Ali Seker', 'Istanbul' ,2500, 'Vakko');
INSERT INTO calisanlar VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

CREATE TABLE markalar
(

marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);


INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

select * from calisanlar;
select * from markalar;

-- 1) Calisan sayisi 15.000'den cok olan markalarin isimlerini ve bu 
-- markada calisanlarin isimlerini ve maaslarini listeleyin

select isim, maas, isyeri from calisanlar
where isyeri 
in(select marka_isim from markalar where calisan_sayisi>15000)		-- baglanti noktasi
--in ile iki sorguyu bagladik burada
--in kullanacaksak parantez icine aldigimiz sorgu birden fazla deger dondurmelidir.


select * from calisanlar;  -- tablosu icin birlesme isyeri sutunu
select * from markalar;    -- tablosu icin birlesme yeri marka_isim sutunu



-- 2) marka_id'si 101'den buyuk olan marka calisanlarinin isim, maas ve sehirlerini listeleyin
















