select * from tab;
drop table board purge;
select * from board;

CREATE TABLE board(
     seq NUMBER NOT NULL,                --글번호
     id VARCHAR2(20) NOT NULL,           --아이디
     name VARCHAR2(40) NOT NULL,         --이름
     email VARCHAR2(40),                 --이메일
     subject VARCHAR2(255) NOT NULL,     --제목
     content VARCHAR2(4000) NOT NULL,    --내용 

     ref NUMBER NOT NULL,                --그룹번호
     lev NUMBER DEFAULT 0 NOT NULL,      --단계
     step NUMBER DEFAULT 0 NOT NULL,     --글순서
     pseq NUMBER DEFAULT 0 NOT NULL,     --원글번호
     reply NUMBER DEFAULT 0 NOT NULL,    --답변수

     hit NUMBER DEFAULT 0,               --조회수
     logtime DATE DEFAULT SYSDATE
 );

select * from board;

--☆ 시퀀스 객체 작성
create sequence 시퀀스객체명
create sequence seq_board nocache nocycle;

--☆ 시퀀스 객체 삭제
drop   sequence 시퀀스객체명
drop   sequence seq_board

--☆ 자동으로 1씩 증가하는 값을 얻어오기
select seq_board.nextval from dual

select * from board;

-- ----------------------------------------------------------------
[뷰 - Top N분석]
  Top N분석 : 조건에 맞는 최상위(최하위) 레코드를 N개 식별해야 하는 경우에 사용
   예) 최상위 소득자3명
       최근 6개월동안 가장 많이 팔린 제품3가지
       실적이 가장 좋은 영업사원 5명
   
   오라클에서 Top N분석원리
      - 원하는 순서대로 정렬
      - rownum 이라는 가상의 컬럼을 이용하여 순서대로 순번부여
      - 부여된 순번을 이용하여 필요한수 만큼 식별
      - rownum값으로 특정행을 선택할수 없음
        (단, Result Set  1st  행(rownum=1)은 선택가능)
        
--ex10) Top N분석
--급여를 가장 많이 받는 사원3명의 이름,급여를 표시하시오
select last_name, salary, rownum
from (select last_name, salary from employees order by 2 desc) --인라인
where rownum<=3;

--ex11) 최고급여를 받는 사원1명을 구하시오
select last_name, salary, rownum
from (select last_name, salary from employees order by 2 desc) 
where rownum=1;   -- rownum=1(O), rownum=2(X)

--ex12) 급여의 순위를 내림차순정렬했을때, 3개씩 묶어서 2번째 그룹을 출력하시오
--      (4,5,6 순위의 사원출력  ==> 페이징처리기법) 
select employee_id,first_name,salary, page
from(select  tt.*, ceil(rownum/3) as page
	 from (select * from employees order by salary desc) tt)
where page=2; 
















