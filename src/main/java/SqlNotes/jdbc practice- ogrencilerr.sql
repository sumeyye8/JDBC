create table ogrencilerr (
okul_no int primary key,
ogrenci_ismi varchar(50),
sinif varchar(10),
cinsiyet char
);

insert into ogrencilerr values(100, 'Mustafa Bal', 9, 'E');
insert into ogrencilerr values(101, 'Derya Soylu', 9, 'K');
insert into ogrencilerr values(102, 'Enes Boz', 9, 'E');
insert into ogrencilerr values(103, 'Nil Naz', 9, 'K');
insert into ogrencilerr values(104, 'Ali Can', 9, 'E');
insert into ogrencilerr values(105, 'Yusuf Cengiz', 10, 'E');
insert into ogrencilerr values(106, 'Ahmet Aslan', 10, 'E');
insert into ogrencilerr values(107, 'Mehmet Aslan', 10, 'E');
insert into ogrencilerr values(108, 'Sena Yavuz', 10, 'K');
insert into ogrencilerr values(109, 'Zehra Amber', 10, 'K');
insert into ogrencilerr values(110, 'Fatma Nur', 11, 'K');
insert into ogrencilerr values(111, 'Mustafa Bay', 11, 'E');
insert into ogrencilerr values(112, 'Murat Kerem', 11, 'E');
insert into ogrencilerr values(113, 'Sinan Ay', 11, 'E');
insert into ogrencilerr values(114, 'Figen Bal', 12, 'K');
insert into ogrencilerr values(115, 'Serkan Bayram', 12, 'E');
insert into ogrencilerr values(116, 'Hakan Bacak', 12, 'E');
insert into ogrencilerr values(117, 'Zafer Yanak', 12, 'E');
insert into ogrencilerr values(118, 'Birol Kara', 12, 'E');
insert into ogrencilerr values(119, 'Ayten Tan', 12, 'K');
insert into ogrencilerr values(120, 'Mustafa Tan', 12, 'E');

select * from ogrencilerr;