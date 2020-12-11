select * from tab;
select * from users;
drop table test1;

--primary key : unique + not null
create table users(
id varchar2(10) primary key,
pwd varchar2(10) not null,
name varchar2(20) not null,
point number(7,2));  

insert into users(id,pwd,name,point) values('admin','1111','어드민',35.34);
insert into users(id,pwd,name,point) values('abcd','1111','테스트',65.78);
commit

select * from test1 where id = 'admin@daum.com'

create table test1(
id varchar2(30) primary key,       
pw varchar2(20) NOT NULL,            
repw varchar2(20) NOT NULL,            
name varchar2(10) NOT NULL,           
nick varchar2(10) NOT NULL,            
birth varchar2(20) DEFAULT 0 NOT NULL       
);

commit


