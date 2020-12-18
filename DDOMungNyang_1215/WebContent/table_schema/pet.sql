[펫DB]
create table pet(
petid varchar2(100) primary key,  -------펫고유아이디
classify1 varchar2(100),          -------강아지 : 1, 고양이 : 2
classify2 varchar2(100),     ------- 업체분양 : A1 , 개인분양 : A2, 유기분양 :A3
dogkortype varchar2(100),    -------ex)비숑, 비글, 요크셔테리어..
dogengtype varchar2(100),    -------ex)bishong, biggle..
gender varchar2(100),          -------수컷이면  M, 암컷이면 F
age varchar2(100),     -------나이(개월수) 
price varchar2(100),      -------가격 
jusa varchar2(100),     --------접종여부(O,X)
pic varchar2(100),
heart int
)     


create sequence seq_petid increment by 1 start with 1 nocycle nocache;
insert into pet(petid,classify1,classify2,dogkortype,dogengtype,gender,age,price,jusa,pic) values(SEQ_PETID.NEXTVAL,'1','A1','시바견','shibainu', 'M', '1', '300000', '0','sibal.jpg');

select * from pet;
drop table pet;
drop sequence seq_petid