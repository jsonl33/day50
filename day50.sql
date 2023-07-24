create table depart71(
deptcode varchar2(10) constraint depart71_deptcode_pk primary key,
deptname varchar2(50) constraint depart71_deptname_nn not null
);

insert into depart71 values('a001','영어교육학과');
insert into depart71 values('a002','컴퓨터공학과');

select * from depart71 order by deptcode asc;

create table student71(
sno number(38) constraint student71_sno_pk primary key,
sname varchar2(50) constraint student71_sname_nn not null,
gender varchar2(10) constraint student71_gender_nn not null,
addr varchar2(300),
deptcode varchar2(10) constraint student_deptcode_fk references depart71(deptcode)
);

insert into student71 values(101,'홍길동','남','서울시','a001');
insert into student71 values(102,'이순신','남','서울시','a002');

select * from student71 order by sno asc;

select d.deptname, s.sno, s.sname, s.gender, s.addr, s.deptcode 
from depart71 d, student71 s where d.deptcode = s.deptcode;

select table_name, constraint_type, constraint_name, r_constraint_name from user_constraints
where table_name in ('DEPART71','STUDENT71');

create table emp73 (
empno number(38) constraint emp73_emono_pk primary key,
ename varchar2(50) constraint emp73_ename_nn not null,
sal number(38) constraint emp73_sal_ck check(sal between 500 and 5000),
gender varchar2(6) constraint emp73_gender_ck check(gender in ('M','F'))
);

insert into emp73 values(1101,'홍길동',8000,'M');
insert into emp73 values(1102,'신사임당',3000,'C');

select * from emp73 order by empno;

create table dept73(
deptno number(38) primary key,
dname varchar2(50),
LOC varchar(50) default '서울'
);

insert into dept73(deptno, dname) values(10,'개발부');

select * from dept73;