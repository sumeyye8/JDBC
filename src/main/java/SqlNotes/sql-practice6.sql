create table films(

	film_id int,
	film_name varchar(30),
	category varchar(30)

);

insert into films values(1, 'Assassins Creed: Embers', 'Animations');
insert into films values(2, 'Real Steel(2012)', 'Animations');
insert into films values(3, 'Alvin and the Chipmunks', 'Animations');
insert into films values(4, 'The Adventures of Tin Tin', 'Animations');
insert into films values(5, 'Safe(2012)', 'Action');
insert into films values(6, 'Safe House(2012)', 'Action');
insert into films values(7, 'Marle and me', 'Romance');


create table actors(

	id int,
	actor_name VARCHAR(30),
	film_id int
);

insert into actors values(1, 'Adam Smith', 1);
insert into actors values(2, 'Ravi Kumar', 2);
insert into actors values(3, 'Susan Davidson', 5);
insert into actors values(4, 'Lee Pong', 6);
insert into actors values(5, 'Bruce Lee', NULL);



-- 1) Tum filmleri, film turlerini ve filmlerde oynayan actorleri listeleyin

-- left ile cozum

select a.film_name , a.category , b.actor_name from films AS a
left join actors AS b
on b.film_id = a.film_id;
















