use jsp;
drop table test_user;

create table test_user (
	userid varchar(300) primary key,
    userpw varchar(300) not null,
    username varchar(300),
    usergender varchar(300),
    zipcode varchar(300),
    addr varchar(1000),
    addrdetail varchar(1000),
    addretc varchar(300),
    userhobby varchar(1000)
);

select * from test_user;