use web0315;

# 테이블 삭제
drop table car;

# 테이블 수정
# unique 제약조건 : 고유한 값만 삽입될 수 있도록 하는 제약조건
# not null 제약조건 : 비어있을 수 없도록 하는 제약조건
create table user(
	userid varchar(300) unique,
    userpw varchar(300) not null,
    username varchar(300)
);

# 테이블 명 변경
alter table user rename to userinfo;
alter table userinfo rename to user;

# 컬럼추가
alter table user add (useridx int primary key);
# 칼럼수정
alter table user modify useridx bigint;
# 칼럼삭제
alter table user drop username;

# 부모 테이블
create table owner(
	id varchar(300) primary key,
	name varchar(300),
    phone varchar(300),
    age int,
    addr varchar(1000)
);

# 자식 테이블
create table car(
	carnum varchar(300) primary key,
	brand varchar(300),
    color varchar(300),
    price int,
    id varchar(300),
    constraint car_owner_fk foreign key(id) references owner(id)
);


# 수강신청
# 학생정보, 과목정보, ...
/*
한 과목이 여러 강의로 되기 때문에 따로 시간표 테이블을 만들어준다.

	학생정보			시간표			과목정보			리스트
	-----------------------------------------------------
	학번(PK)			수업코드(PK)		과목코드(PK)		수업코드(FK)
    학생명			과목코드(FK)		과목명			학번(FK)
    소속학과			담당교수			학과	
    학년				정원				
	핸드폰번호			강의실
					시작시간
					...
*/