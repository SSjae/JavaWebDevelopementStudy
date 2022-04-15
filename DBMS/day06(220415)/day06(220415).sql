use web0315;
drop table product;
drop table user;

create table user (
	useridx int primary key auto_increment,
	userid varchar(300) unique,
    userpw varchar(300) not null,
    username varchar(300) not null,
    userage int,
    userphone varchar(300),
    useraddr varchar(1000)
);
create table product (
	prodnum int primary key auto_increment,
    prodname varchar(1000),
    prodprice int,
    prodamount int,
    prodinfo varchar(4000),
    likecnt int default 0,
    userid varchar(300),
    constraint user_product_fk foreign key(userid) references user(userid)
);

select * from user;
select * from product;