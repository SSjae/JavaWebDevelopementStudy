use web0315;

# 데이터 삽입
insert into car (carnum, brand, color)
values ('123가4567', 'Ferrari', 'Red');
insert into owner
values ('apple', '김사과', '01012341234', 20, '서울시 송파구 잠실동');
# foreign key는 비어있게 넣을 수는 있지만, 참조값이 없는 경우에는 삼입 불가능
# 부모인 owner에 banana가 없기 때문에 참조 불가능 --> 오류
# insert into car
# values ('135다7961', 'K8', 'White', 40000000, 'banana');

insert into car
values ('135다7961', 'K8', 'White', 40000000, 'apple');

# 간단하게 테이블의 데이터 확인하기
select * from car;
select * from owner;

# 데이터 삭제
delete from car where carnum = '135다7961';
insert into car values ('135다7961', 'K8', 'White', 40000000, 'apple');
insert into car values ('246다2468', 'Porsche', 'Yellow', 150000000, 'apple');
delete from car where id = 'apple';

insert into car values ('135다7961', 'K8', 'White', 40000000, 'apple');
insert into car values ('246다2468', 'Porsche', 'Yellow', 150000000, 'apple');

# 데이터 수정
# null 비교는 is(컬럼 is null / 컬럼 is not null)
update car set id = 'apple' where id is null;
update car set price = 650000000 where carnum = '123가4567';

# 데이터 검색
select carnum, price, id from car;
select price from car where carnum = '123가4567';

select * from car where price > 100000000;

# 별칭(ALIAS)
select carnum 차번호, price 가격 from car where price > 100000000;
# dual : 간단한 값이나 연산의 결과를 검색하기 위한 한 행짜리 내장 테이블
# 별칭이 키워드거나 띄어쓰기가 포함된 경우에는 쌍따옴표로 묶어준다.
select 1+1+123*124 "계산된 결과", 7*23 result from dual;

select * from car where brand = 'Ferrari' or brand = 'Porsche';
# 컬럼 in (값1, 값2, ...) : 컬럼에 존재하는 값이 뒤에 따라오는 값들 중에 있다면 참
select * from car where brand in ('Ferrari', 'Porsche');

select * from car where price >= 100000000 and price <= 200000000;
# 컬럼 between 값1 and 값2 : 컬럼의 값이 값1 이상 값2 이하 이면 참 
select * from car where price between 100000000 and 200000000;

# 문자열 대소비교 가능(사전순으로 뒤에 있는 값이 더 큰값)
select * from car where brand > 'Lemon';


#---------------------------------------------------------------------------------------------
# 실습
use world;
select * from country;
select * from city;
select * from countrylanguage;

# database : web0315
use web0315;
# owner에 두명 더 추가하기(banana, cherry)
insert into owner values('banana', '이바나나', '01078945612', '22', '서울시 동대문구');
insert into owner values('cherry', '박체리', '01045661234', '24', '서울시 마포구');
# car에 3대 더 추가하기(cherry의 2000만원 이하짜리 필수, banana의 4000이상 1억이하 필수)
insert into car values('789바4567', 'sonata', 'black', '15000000', 'cherry');
insert into car values('456바9832', 'ray', 'blue', '11000000', 'cherry');
insert into car values('796바4567', 'benz-CLS', 'black', '160000000', 'banana');
insert into car values('752바4567', 'benz-E', 'yellow', '90000000', 'banana');
# car에서 banana의 자동차 중 4000만원 이상 1억원 이하의 자동차만 색깔을 Gold로 바꾸기
update car set color = 'Gold' where id = 'banana' and price between 40000000 and 100000000; 
# car에서 cherry의 자동차 중 2000만원 이하의 자동차 삭제하기
delete from car where id = 'cherry' and price <= 20000000;

# database : world
use world;
#country 테이블
#소속 대륙(Continent)이 Asia인 나라 검색
select * from country where Continent = 'Asia';
#소속 대륙(Continent)이 Europe이 아닌 나라 검색
select * from country where Continent != 'Europe';
#인구수(Population)가 1000만 이하인 나라 검색
select * from country where Population <= 10000000;
#인구수(Population)가 7000만 이상인 나라 검색
select * from country where Population >= 70000000;
#인구수(Population)는 4500만 이상이면서 넓이(SurfaceArea)가 10만제곱km이하인 나라 검색
select * from country where Population >= 45000000 and SurfaceArea <= 100000;
#소속 대륙(Continent)은 Asia 이고 건국 연도(IndepYear)가 1948인 나라 검색
select * from country where Continent = 'Asia' and IndepYear = 1948;
#지역(Region)이 동아프리카(Eastern Africa) 이고 건국 연도 가 1970~1980인 나라 검색
select * from country where Region = 'Eastern Africa' and IndepYear between 1970 and 1980;
