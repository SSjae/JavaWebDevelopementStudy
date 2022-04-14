# auto_increment
use web0315;
create table product(
		prodnum int primary key auto_increment,
		prodname varchar(300) not null,
        prodprice int not null,
		regdate datetime
);
insert into product(prodname, prodprice)
values ('구찌 지우개', 100000);
insert into product(prodname, prodprice)
values ('구찌 연필', 100000);

# date, datetime 타입
insert into product(prodname, prodprice, regdate)
values ('구찌 공책', 300000, '2022-04-13 19:25:37');
insert into product(prodname, prodprice, regdate)
values ('구찌 필통', 250000, now());
select * from product;

# Like 조건식
select * from product where prodname like('%구찌%');
select * from product where prodname like('%필%');

# 단일행 함수
# 문자함수
# 문자열 연결, 문자열 길이
select concat('He', 'llo'), length('flower') from dual;
# 숫자함수
# 올림, 버림, 반올림
select ceil(3.14), floor(3.14), round(3.141592, 3) from dual;
# 널처리 함수
select ifnull(regdate,'등록날짜 없음') "등록시간" from product where prodname = '구찌 지우개';

use world;
select * from country;
select count(Population) from country;
select count(IndepYear) from country;
select count(ifnull(IndepYear,'????')) from country;
select sum(Population), avg(Population), max(Population), min(Population) from country;

# 대륙별 총 인구수
select Continent 대륙, sum(Population) "총 인구수" from country group by Continent;
# 대륙별, 지역별 총 인구수
select Continent 대륙, Region 지역, sum(Population) "총 인구수"
from country group by Continent, Region
having sum(Population) > 100000000 order by 1, 2 desc;

# limit
select * from country order by name limit 10;
select * from country order by name limit 5, 5;

select * from country;
#대륙별로 평균 gnp 검색
select continent 대륙, avg(gnp) 평균GNP from country group by continent;
#gnp 평균이 100000 이상인 지역들의 지역명, gnp 최대값, gnp 최소값, gnp 평균 검색
select region 지역명, max(gnp) gnp최대값, min(gnp) gnp최소값, avg(gnp) gnp평균 from country group by region having avg(gnp) > 100000;
#대륙별 평균 인구를 출력하되 15000000명을 넘는 대륙만 검색
select continent 대륙, avg(population) 평균인구 from country group by continent having 평균인구 > 15000000;
#인구수가 2000만명을 넘는 나라들의 평균 넓이가 2000000 제곱km를 넘는 대륙들만 검색
select name 나라, population 인구수, avg(surfacearea) 평균넓이 from country where population > 20000000 group by name having 평균넓이 > 2000000;
#대륙별, 그리고 지역별로 나라들의 평균 수명 검색
select continent 대륙, region 지역, avg(lifeexpectancy) 평균수명 from country group by continent, region;
#아시아, 유럽에 속한 나라들 중에 정치제도별로 정치제도, 나라수, 평균수명, 평균gnp 검색
select governmentform  정치제도, count(*) 나라수, avg(lifeexpectancy) 평균수명, avg(gnp) 평균gnp
from country where continent in ('Asia', 'Europe') group by governmentform;