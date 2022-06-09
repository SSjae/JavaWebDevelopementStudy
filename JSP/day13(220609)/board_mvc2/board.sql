use jsp;

create table test_board (
	boardnum int primary key auto_increment,
    boardtitle varchar(300),
    boardcontents varchar(4000),
    userid varchar(300),
    regdate datetime default now(),
    readcount int default 0,
    constraint board_user_fk foreign key(userid) references test_user(userid)
);

insert into test_board (boardtitle, boardcontents, userid) values("테스트 제목 1","테스트 내용 1",'apple');
insert into test_board (boardtitle, boardcontents, userid) values("테스트 제목 2","테스트 내용 2",'durian');
insert into test_board (boardtitle, boardcontents, userid) values("테스트 제목 3","테스트 내용 3",'ssjj04022');

select * from test_board;

select count(*) from test_board;

insert into test_board (boardtitle, boardcontents, userid) (select boardtitle, boardcontents, userid from test_board);

create table test_file (
	systemname varchar(2000),
    orgname varchar(2000),
    boardnum int
);

select * from test_file;