select * from tab;
select * from test1;
drop table test1;

create table test1(
id varchar2(30) primary key,    			----아이디   
pw varchar2(20) NOT NULL,            		----비밀번호
repw varchar2(20) NOT NULL,            		----비밀번호확인
name varchar2(10) NOT NULL,           		----이름
nick varchar2(10) NOT NULL,            		----닉네임
birth varchar2(20) DEFAULT 0 NOT NULL       ----생일
);

select * from test1;

insert into test1(id,pw,repw,name,nick,birth) values('admin','1111','1111','한동욱','다람쥐','1993-12-20');

commit


