use web0315;

select * from owner;
select * from car;

# JOIN
# 회원명 핸드폰번호 자동차번호 브랜드 가격
select 
	o.name, o.phone,
    c.carnum, c.brand, c.price
from owner o
	join car c on o.id = c.id;

# sub query
select avg(price) from car;
select * from car where price > 12480;
select * from car where price > 
	(select avg(price) from car);

# apple의 자동차 중에서 가장 비싼 자동차 가격
select * from car where id = 'apple';
select max(price) from
	(select * from car where id = 'apple') r;

# 스칼라나 (where절에서 부등호로 비교하기 위한 것)이라면
# 무조건적으로 값이 하나가 나와야 한다.

# 차번호, 브랜드, 가격, 자동차 평균가격
select carnum, brand, price, 12480 from car;
select carnum, brand, price, 
	(select avg(price) from car) 펼균가격
from car;


create table test (
	intdata int primary key auto_increment,
    strdata varchar(1000),
    timedata datetime
);

insert into test(strdata, timedata) values ('첫번째 문자열', now());
insert into test(strdata, timedata) values ('두번째 문자열', now());

select * from test;

use sakila;
#film, language / MODEL FISH 영화의 언어 검색
select f.title 제목, l.name 언어
		from film f
		join language l on f.language_id = l.language_id
		where f.title = "MODEL FISH";
#customer, address / MELISSA KING 회원의 주소와 핸드폰번호 검색
select concat(c.first_name," " , c.last_name) 이름, a.address 주소, a.phone 핸드폰번호
		from customer 
		join address a on c.address_id = a.address_id
		where c.first_name = 'MELISSA' and c.last_name = 'KING';
#city,country / A로 시작하는 도시들이 속한 나라의 이름 검색
select ci.city 도시 , co.country 나라
		from city ci
        join country co on ci.country_id = co.country_id
        where city like 'A%';
#film_actor, film, actor / MODEL FISH에 출연한 배우들의 이름 검색
select f.title 제목, concat(a.first_name," " , a.last_name) 이름
		from film_actor fa
		join film f on fa.film_id = f.film_id
		join actor a on fa.actor_id = a.actor_id 
        where f.title = "MODEL FISH";
#inventory, customer, film / MODEL FISH 영화를 빌려간 회원들의 이름 검색
select f.title 제목, concat(c.first_name," " , c.last_name) 빌려간회원이름
		from inventory i
		join customer c on i.store_id = c.store_id
        join film f on i.film_id = f.film_id 
        where f.title = "MODEL FISH";
#film_actor, film, actor / JANE JACKMAN이 출연한 영화제목들 검색
select concat(a.first_name," " , a.last_name) 이름, f.title 제목
		from film_actor fa
		join film f on fa.film_id = f.film_id
		join actor a on fa.actor_id = a.actor_id 
        where a.first_name = 'JANE' and a.last_name = 'JACKMAN';
#customer, address, city / JUDITH COX가 사는 도시의 이름 검색
select concat(cu.first_name," " , cu.last_name) 이름, ci.city 도시이름
		from customer cu
		join address a on cu.address_id = a.address_id
        join city ci on a.city_id = ci.city_id 
        where cu.first_name = 'JUDITH' and cu.last_name = 'COX';









