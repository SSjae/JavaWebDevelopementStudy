drop database delivery;
create database delivery;
use delivery;

create table user (
	userid varchar(300) primary key,
    userpw varchar(300),
    username varchar(300),
    usernickname varchar(300),
    useremail varchar(300),
    userphone varchar(300),
    zipcode varchar(300),
    addr varchar(1000),
    addrdetail varchar(1000),
    addretc varchar(300),
    grade int default 1,
    ordercnt int default 0
);

create table store (
	storenum int primary key auto_increment,
	storename varchar(300),
	storephone varchar(300),
	theme varchar(1000),
	ownername varchar(300),
	storedetail varchar(2000),
	storetime varchar(300),
	zipcode varchar(300),
	addr varchar(1000),
	addrdetail varchar(1000),
	addretc varchar(300),
	deliverok varchar(1000),
	deliverprice int not null,
    minprice int,
	likecnt int default 0,
	starcnt decimal(10,1) default 0
);

create table storefile(
	systemname varchar(1000),
	orgname varchar(300),
    storenum int,
    constraint storenum_fk foreign key(storenum)  references store(storenum)
);

create table food(
	foodnum int primary key auto_increment,
	foodname varchar(300),
	foodprice int ,
	foodtheme varchar(300),
	ordercnt int default 0,
    storenum int,
    constraint storenum_fk2 foreign key(storenum) references store(storenum)
);

create table foodfile(
	systemname varchar(4000),
	orgname varchar(4000),
    foodnum int,
     constraint foodnum_fk1 foreign key(foodnum) references food(foodnum)
);

create table foodoption(
	optionnum int primary key auto_increment,
    foodoption varchar(1000),
	optionname varchar(300),
	optionprice int ,
	isoverlap boolean,
    foodnum int,
    constraint foodnum_fk21 foreign key(foodnum) references food(foodnum)
);

create table baeminorder (
	ordernum int primary key auto_increment,
    ownercall varchar(300),
	ridercall varchar(300),
	regdate datetime default now(),
    totalprice int,
	userid varchar(300),
    constraint userid_fk foreign key(userid) references user(userid),
	storenum int,
    constraint storenum_fk3 foreign key(storenum) references store(storenum),
	foodnum varchar(300),
    optionnum varchar(300),
    foodamount varchar(300),
    foodhow varchar(100),
    foodtotalprice varchar(300)
);



create table likestore(
	likestorenum int primary key auto_increment,
	userid varchar(300),
    constraint id_fk2 foreign key(userid) references user(userid),
	storenum int,
    constraint storenum_fk4 foreign key(storenum) references store(storenum)
    );
    
create table review(
	reviewnum int primary key auto_increment,
	reviewcontents varchar(4000),
	regdate datetime default now(),
	starcnt int,
    userid varchar(300),
    constraint id_fk3 foreign key(userid) references user(userid),
	storenum int,
    constraint storenum_fk5 foreign key(storenum) references store(storenum)
); 

	 insert into store (storenum, storename, storephone, theme, ownername, storedetail,storetime, zipcode, addr, addrdetail, addretc, deliverok, deliverprice, minprice, likecnt, starcnt)
    values('1','밀포유(육회왕자 연어공주)','010-3752-2201','돈까스_회_일식','박대표','매일 아침 신선한 야채와 소고기를 겹겹히 겹쳐 정성스레 만든 밀푀유 나베',
			'평일-17:00 ~ 2:00,휴무일-월요일', '05663', '서울시 송파구 송파동','138-15','1층','송파구전지역','2000','13500','0','0');
	insert into store 
    values ('2','필라멘','010-4455-6452','돈까스_회_일식','신나라','국산 돈사골을 푹 끓여서 만든 라멘',
			'매일-11:00 ~ 20:20, 연중무휴','05718','서울시 송파구 가락동 80',' 102-119','성원상떼빌','송파구전지역','3000','13000','0','0');
    insert into store
    values ('3','돈까스마켙','010-2323-5784','돈까스_회_일식','윤하늘','최상급 국내산 돼지와 특별한 반죽과 빵가루의 조화 바삭함을 담아가세요~',
			'평일, 토요일-밤 12:00 ~ 오후 1:00, 매주 일요일 휴무','05756','서울시 송파구 마천동','126-5','1층','송파구전지역','3500','12000','0','0');
    insert into store
    values ('4','미스터 혼밥왕','010-2323-4520','1인분','박하영','혼자서도 맛있게 식사할 수 있는 혼밥왕 으로 오세요~',
			'평일-오전 10:30 ~ 오후 9:00, 매주 일요일 휴무','05759','서울시 송파구 마천동','308-5','1층','송파구전지역','4000','9900','0','0');
	insert into store
    values ('5','몽키스 돈가스','010-2546-1201','1인분','장신동','두툼한, 바삭한, 촉촉한, 고소한, 맛있는 돈가스로 만나요~',
			'평일,토요일-오전 8:50 ~ 오후 10:30, 매주 일요일 휴무','05782','서울 송파구 가락동','188-10','오금로46길 37','송파구전지역','3500','8000','0','0');
    insert into store
    values ('6','그날의 샐러드(카페블라썸)','010-7856-2597','1인분','정다솔','고객님들이 만족할 수 있도록 항상 신선한 야채를 위생적으로 관리하여 제공해드리는 그날의 샐러드가 되도록 노력하겠습니다',
			'평일,토요일-오전 10:00 ~ 오후 6:00, 매주 일요일 휴무','05740','서울시 송파구 오금로','49길 31','지번:오금동 155-8','송파구전지역','3000','8500','0','0');
    insert into store
    values ('7','이디야커피','010-2497-2657','카페_디저트','김주영','시원한 음료 한잔으로 잠시 쉬었다 가세요~',
			'매일-오전 11:00 ~ 오후 11:00, 연중무휴','05744','서울시 강남구 거여동','26-2','오금로 497','송파구전지역','3200', '12000','0','0');
	
	insert into storefile(systemname, orgname, storenum)
    values ('밀포유.jpg','밀포유.jpg','1');
    insert into storefile
    values ('필라멘.jpg','필라멘.jpg','2');
    insert into storefile
    values ('돈카츠마켙.jpg','돈카츠마켙.jpg','3');
    insert into storefile
    values ('미스터혼밥왕.jpg','미스터 혼밥왕.jpg','4');
    insert into storefile
    values ('몽돈.jpg','몽돈.jpg','5');
    insert into storefile
    values ('그날의 샐러드.jpg','그날의 샐러드.jpg','6');
    insert into storefile
    values ('이디야커피.jpg','이디야커피.jpg','7');
    
    insert into food (foodnum, foodname, foodprice, foodtheme, ordercnt, storenum)
    values ('1','오리지널 밀푀유나베','10500','요리류','0','1');
    insert into food
    values ('2','매운 밀푀칼죽','13000','요리류','0','1');
    insert into food
    values ('3','돈코츠라멘','9000','라멘','0','2');
    insert into food
    values ('4','오꼬노미야끼','13000','요리류','0','2');
    insert into food
    values ('5','가라아게','5000','요리류','0','2');
    insert into food
    values ('6','등심카츠 정식','9300','돈까스','0','3');
    insert into food
    values ('7','치즈롤카츠 정식','9800','돈까스','0','3');
    insert into food
    values ('8','냉모밀','6500','면류','0','3');
    insert into food
    values ('9','오징어볶음 도시락','10900','도시락','0','4');
    insert into food
    values ('10','소불고기 볶음','10900','볶음류','0','4');
    insert into food
    values ('11','고추장제육볶음 도시락','9900','도시락','0','4');
    insert into food
    values ('12','프리미엄 치즈폭포까스','10500','돈까스','0','5');
    insert into food
    values ('13','고추와사비돈까스','10900','돈까스','0','5');
    insert into food
    values ('14','돈부리돈까스덮밥','9000','덮밥','0','5');
    insert into food
    values ('15','카프레제 샐러드','9500','샐러드','0','6');
    insert into food
    values ('16','수비드닭가슴살 샐러드','8500','샐러드','0','6');
    insert into food
    values ('17','햄치즈 샌드위치','6500','샌드위치','0','6');
    insert into food
    values ('18','자몽주스','6000','주스','0','6');
    insert into food
    values ('19','카페 아메리카노','3200','커피','0','7');
    insert into food
    values ('20','생과일 수박주스','4900','주스','0','7');
    insert into food
    values ('21','팥인절미 1인빙수','5900','빙수','0','7');

    
    insert into foodfile(systemname, orgname, foodnum)
    values('오리지널 밀푀유나베.jpg','오리지널 밀푀유나베.jpg','1');
    insert into foodfile
    values('매운 밀푀칼죽.jpg','매운 밀푀칼죽.jpg','2');
    insert into foodfile
    values('돈코츠라멘.jpg','돈코츠라멘.jpg','3');
    insert into foodfile
    values('오꼬노미야끼.jpg','오꼬노미야끼.jpg','4');
    insert into foodfile
    values('가라아게.jpg','가라아게.jpg','5');
    insert into foodfile
    values('등심카츠 정식.jpg','등심카츠 정식.jpg','6');
    insert into foodfile
    values('치즈롤카츠 정식.jpg','치즈롤카츠 정식.jpg','7');
    insert into foodfile
    values('냉모밀.jpg','냉모밀.jpg','8');
    insert into foodfile
    values('오징어볶음 도시락.jpg','오징어볶음 도시락.jpg','9');
    insert into foodfile
    values('소불고기 볶음.jpg','소불고기 볶음.jpg','10');
    insert into foodfile
    values('고추장제육볶음 도시락.jpg','고추장제육볶음 도시락.jpg','11');
    insert into foodfile
    values('프리미엄치즈폭포까스.jpg','프리미엄치즈폭포까스.jpg','12');
    insert into foodfile
    values('고추와사비 돈까스.jpg','고추와사비 돈까스.jpg','13');
    insert into foodfile
    values('돈부리돈까스덮밥.jpg','돈부리돈까스덮밥.jpg','14');
    insert into foodfile
    values('카프레제 샐러드.jpg','카프레제 샐러드.jpg','15');
    insert into foodfile
    values('수비드닭가슴살 샐러드.jpg','수비드닭가슴살 샐러드.jpg','16');
    insert into foodfile
    values('햄치즈 샌드위치.jpg','햄치즈 샌드위치.jpg','17');
    insert into foodfile
    values('자몽주스.jpg','자몽주스.jpg','18');
    insert into foodfile
    values('카페 아메리카노.jpg','카페 아메리카노.jpg','19');
    insert into foodfile
    values('생과일 수박주스.jpg','생과일 수박주스.jpg','20');
    insert into foodfile
    values('팥인절미 1인빙수.jpg','팥인절미 1인빙수.jpg','21');
    
    insert into foodoption
    values('1','인분 선택','1~2인분','10500',false,'1');
    insert into foodoption
    values('2','인분 선택','2~3인분','31000',false,'1');
    insert into foodoption
    values('3','인분 선택','1~2인분','13000',false,'2');
    insert into foodoption
    values('4','인분 선택','2~3인분','26000',false,'2');
    insert into foodoption
    values('5','매운맛 선택','0단계','0',false,'3');
    insert into foodoption
    values('6','매운맛 선택','1단계','0',false,'3');
    insert into foodoption
    values('7','매운맛 선택','2단계','0',false,'3');
    insert into foodoption
    values('8','매운맛 선택','3단계','0',false,'3');
    insert into foodoption
    values('9','매운맛 선택','4단계','0',false,'3');
    insert into foodoption
    values('10','라멘 추가 선택','면 추가','3000',true,'3');
    insert into foodoption
    values('11','라멘 추가 선택','숙주 추가','1000',true,'3');
    insert into foodoption
    values('12','라멘 추가 선택','차슈 추가','3500',true,'3');
    insert into foodoption
    values('13','수량 선택','6pcs','5000',false,'5');
    insert into foodoption
    values('14','수량 선택','10pcs','10000',false, '5');
    insert into foodoption
    values('15','공기밥 추가','1개','1000',true,'9');
    insert into foodoption
    values('16','공기밥 추가','2개','2000',true,'9');
    insert into foodoption
    values('17','공기밥 추가','3개','3000',true,'9');
    insert into foodoption
    values('18','공기밥 추가','1개','1000',true,'10');
    insert into foodoption
    values('19','공기밥 추가','2개','2000',true,'10');
    insert into foodoption
    values('20','공기밥 추가','3개','3000',true,'10');
    insert into foodoption
    values('21','공기밥 추가','1개','1000',true,'11');
    insert into foodoption
    values('22','공기밥 추가','2개','2000',true,'11');
    insert into foodoption
    values('23','공기밥 추가','3개','3000',true,'11');
    insert into foodoption
    values('24','드레싱 선택','갈릭오리엔탈','0',false,'15');
    insert into foodoption
    values('25','드레싱 선택','매콤갈릭오리엔탈','0',false,'15');
    insert into foodoption
    values('26','드레싱 선택','발사믹','0',false,'15');
    insert into foodoption
    values('27','드레싱 선택','시저','0',false,'15');
    insert into foodoption
    values('28','드레싱 선택','흑임자','0',false,'15');
    insert into foodoption
    values('29','드레싱 선택','레몬허브오일','0',false,'15');
    insert into foodoption
    values('30','드레싱 선택','애플어니언','0',false,'15');
    insert into foodoption
    values('31','드레싱 선택','소스없음','0',false,'15');
    insert into foodoption
    values('32','드레싱 선택','갈릭오리엔탈','0',false,'16');
    insert into foodoption
    values('33','드레싱 선택','매콤갈릭오리엔탈','0',false,'16');
    insert into foodoption
    values('34','드레싱 선택','발사믹','0',false,'16');
    insert into foodoption
    values('35','드레싱 선택','시저','0',false,'16');
    insert into foodoption
    values('36','드레싱 선택','흑임자','0',false,'16');
    insert into foodoption
    values('37','드레싱 선택','레몬허브오일','0',false,'16');
    insert into foodoption
    values('38','드레싱 선택','애플어니언','0',false,'16');
    insert into foodoption
    values('39','드레싱 선택','소스없음','0',false,'16');
    insert into foodoption
    values('40','추가 선택','에스프레소 샷 추가','500',true,'19');
    insert into foodoption
    values('41','추가 선택','(시럽) 헤이즐넛 추가','300',true,'19');
    insert into foodoption
    values('42','추가 선택','(시럽) 카라멜 추가','300',true,'19');
    insert into foodoption
    values('43','추가 선택','(시럽) 바닐라 추가','300',true,'19');
    
    select * from user;
    insert into user (userid, userpw, username, usernickname, useremail, userphone, zipcode, addr, addrdetail, addretc)
    values('banana', 'a', '반하나', '넌내게반하나', 'banana@ba.ba', '01012345678', '04419', '서울 용산구 독서당로 111', '1101동 1101호', '(한남동, 한남더힐)');
	insert into user (userid, userpw, username, usernickname, useremail, userphone, zipcode, addr, addrdetail, addretc)
    values('cherry', 'kkTT@@0947', '이체리', '카드값줘체리', 'cheerydebt@give.me', '01059598282', '04401', '서울 용산구 한남대로 91', '113동 2302호', '(한남동, 나인원 한남)');
	insert into user (userid, userpw, username, usernickname, useremail, userphone, zipcode, addr, addrdetail, addretc)
    values('durian', 'kkTT@@0947', '차두리', '살찐건간때문이야', 'playsoccer@well.com', '01082154242', '05551', '서울 송파구 올림픽로 300', '8906호', '(신천동)');
    insert into user (userid, userpw, username, usernickname, useremail, userphone, zipcode, addr, addrdetail, addretc)
    values('ichigo', 'a', '이치고', '조보아씨내려와요', 'joboa@quick.com', '01082276948', '05820', '서울 송파구 동남로 225', '109동 1302호', '(가락동, 래미안파크팰리스)');
   
   drop table baeminorder;
   select * from baeminorder;
   insert into baeminorder(ordernum, ownercall, ridercall, totalprice, userid, storenum, foodnum, optionnum, foodamount, foodhow, foodtotalprice)
   values(1, '맵지 않게 해주세요', '문 앞에 놓고 문자 주세요', '33500', 'cherry', '1', '1', '1', '3', '배달', '31500');
   insert into baeminorder(ordernum, ownercall, ridercall, totalprice, userid, storenum, foodnum, optionnum, foodamount, foodhow, foodtotalprice)
   values(2, '', '요청 사항 없음', '40000', 'cherry', '2', '3,5', '11,12,14', '2,1', '포장', '27000,10000');
   insert into baeminorder(ordernum, ownercall, ridercall, totalprice, userid, storenum, foodnum, optionnum, foodamount, foodhow, foodtotalprice)
   values(3, '리뷰 참여요 콜라 주세요', '조심히 안전하게 와주세요 :)', '27800', 'banana', '4', '10', '18', '2', '배달', '23800');
   insert into baeminorder(ordernum, ownercall, ridercall, totalprice, userid, storenum, foodnum, optionnum, foodamount, foodhow, foodtotalprice)
   values(4, '맛있게 부탁드립니다', '벨 누르지 말고 노크해주세요', '57500', 'banana', '2', '3,5', '9,10,11,12,13', '3,1', '매장', '49500,5000');
   insert into baeminorder(ordernum, ownercall, ridercall, totalprice, userid, storenum, foodnum, optionnum, foodamount, foodhow, foodtotalprice)
   values(5, '많이 힘들겠지만 고생하시죠', '문 앞에 두고 문자주세요', '177500', 'durian', '4', '9,10,11', '15,18,21', '5,5,5', '배달', '59500,59500,54500');
   insert into baeminorder(ordernum, ownercall, ridercall, totalprice, userid, storenum, foodnum, optionnum, foodamount, foodhow, foodtotalprice)
   values(6, '커피 연하게 부탁드립니다', '1층 오시면 전화주세요', '100200', 'durian', '7', '19,20', '', '15,10', '배달', '48000,49000');
   insert into baeminorder(ordernum, ownercall, ridercall, totalprice, userid, storenum, foodnum, optionnum, foodamount, foodhow, foodtotalprice)
   values(7, '시럽 많이 주세요', '요청 사항 없음', '19200', 'ichigo', '7', '19,19', '40,42', '2,2', '배달', '8000,8000');
   insert into baeminorder(ordernum, ownercall, ridercall, totalprice, userid, storenum, foodnum, optionnum, foodamount, foodhow, foodtotalprice)
   values(8, '맵지 않게 주세요', '조심히 안전하게 와주세요 :)', '24500', 'ichigo', '6', '16,17', '', '1,2', '포장', '8500,13000');
   insert into baeminorder(ordernum, ownercall, ridercall, totalprice, userid, storenum, foodnum, optionnum, foodamount, foodhow, foodtotalprice)
   values(9, '', '요청 사항 없음', '40000', 'cherry', '2', '3,5', '11,12,14', '2,1', '포장', '27000,10000');
    insert into baeminorder(ordernum, ownercall, ridercall, totalprice, userid, storenum, foodnum, optionnum, foodamount, foodhow, foodtotalprice)
   values(10, '맛있게 부탁드립니다', '벨 누르지 말고 노크해주세요', '57500', 'banana', '2', '3,5', '9,10,11,12,13', '3,1', '매장', '49500,5000');
   
   update food set ordercnt = ordercnt + 1 where foodnum = 1;
   update food set ordercnt = ordercnt + 3 where foodnum = 3;
   update food set ordercnt = ordercnt + 3 where foodnum = 5;
   update food set ordercnt = ordercnt + 1 where foodnum = 9;
   update food set ordercnt = ordercnt + 2 where foodnum = 10;
   update food set ordercnt = ordercnt + 1 where foodnum = 11;
   update food set ordercnt = ordercnt + 1 where foodnum = 17;
   update food set ordercnt = ordercnt + 3 where foodnum = 19;
   update food set ordercnt = ordercnt + 1 where foodnum = 20;

    select * from likestore;
    insert into likestore
    values(1, 'banana', 4);
    insert into likestore
    values(2, 'banana', 2);
    insert into likestore
    values(3, 'cherry', 1);
    insert into likestore
    values(4, 'durian', 4);
    insert into likestore
    values(5, 'durian', 7);
    insert into likestore
    values(6, 'ichigo', 6);
    
    
    select * from review;
    insert into review(reviewnum, reviewcontents, starcnt, userid, storenum)
    values(1, '여기 진짜 맛있어요 ㅠㅠㅠ 사장님 돈쭐나세요', 5, 'banana', 4);
    insert into review(reviewnum, reviewcontents, starcnt, userid, storenum)
    values(2, '너무 맛있어요 ㅎㅎㅎ 아들이 좋아하네요', 4, 'banana', 2);
    insert into review(reviewnum, reviewcontents, starcnt, userid, storenum)
    values(3, '음식에서 머리카락 나왔어요;;', 1, 'cherry', 1);
    insert into review(reviewnum, reviewcontents, starcnt, userid, storenum)
    values(4, '음식은 맛있는데 밀린 카드값 주셔야죠 사장님?', 3, 'cherry', 2);
    insert into review(reviewnum, reviewcontents, starcnt, userid, storenum)
    values(5, '괜찮네요 ㅎㅎ', 4, 'durian', 4);
    insert into review(reviewnum, reviewcontents, starcnt, userid, storenum)
    values(6, '자주 시켜먹을게요~', 5, 'durian', 7);
    insert into review(reviewnum, reviewcontents, starcnt, userid, storenum)
    values(7, '맛있게 잘 먹었습니다', 5, 'ichigo', 6);
    insert into review(reviewnum, reviewcontents, starcnt, userid, storenum)
    values(8, '', 5, 'ichigo', 7);
	insert into review(reviewnum, reviewcontents, starcnt, userid, storenum)
    values(9, '이런 맛은 처음이에요~~', 5, 'banana', 2); 
    insert into review(reviewnum, reviewcontents, starcnt, userid, storenum)
    values(10, '아.... 이건 좀 너무한거 아니냐고', 1, 'cherry', 2);

    
    
    select * from user;
    update user set ordercnt = ordercnt + 2 where userid = 'banana';
    update user set ordercnt = 6, grade = 2 where userid = 'cherry';
    update user set ordercnt = 11, grade = 3 where userid = 'durian';
    update user set ordercnt = ordercnt + 2 where userid = 'ichigo';
    
    select * from store;
	update store set likecnt = 1 where storenum = '1';
	update store set likecnt = 1 where storenum = '2';
	update store set likecnt = 0 where storenum = '3';
	update store set likecnt = 2 where storenum = '4';
	update store set likecnt = 0 where storenum = '5';
	update store set likecnt = 1 where storenum = '6';
	update store set likecnt = 1 where storenum = '7';



	select * from store;
	update store set starcnt = 1.0 where storenum = '1';
	update store set starcnt = 3.3 where storenum = '2';
	update store set starcnt = 0.0 where storenum = '3';
	update store set starcnt = 4.5 where storenum = '4';
	update store set starcnt = 0.0 where storenum = '5';
	update store set starcnt = 5.0 where storenum = '6';
	update store set starcnt = 5.0 where storenum = '7';