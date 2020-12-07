create table pet(
petid varchar2(100) primary key,  -------펫고유아이디
classify1 char(2),          -------강아지 : 1, 고양이 : 2
classify2 varchar2(100),     -------A1 업체분양 , A2 개인분양, A3 유기분양
dogkortpye varchar2(100),    -------ex)비숑, 비글, 요크셔테리어..
dogengtype varchar2(100),    -------ex)bishong, biggle..
gender    char(2),          -------수컷이면  M, 암컷이면 F
age       varchar2(100),     -------나이(개월수) 
price     varchar2(100),      -------가격 
heartcount char(2));       -------하트 카운트

create sequence seq_petid increment by 1 start with 1 nocycle nocache;
insert into pet(petid,classify1,classify2,dogkortpye,dogengtype,gender,age,price,heartcount) values(SEQ_PETID.NEXTVAL,'1','A1','시바견','shibainu', 'M', '1', '300000', '0');
insert into pet(petid,classify1,classify2,dogkortpye,dogengtype,gender,age,price,heartcount) values(SEQ_PETID.NEXTVAL,'1','A1','말티즈','maltiz', 'F', '3', '500000', '0');

select * from pet;
drop table pet;