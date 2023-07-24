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

create table emp77(
empno number(38),
ename varchar(50) constraint emp77_ename_nn not null,
job varchar2(50),
deptno number(38),
constraint emp77_empno_pk primary key(empno),
constraint emp77_job_uk unique(job),
constraint emp77_deptno_fk foreign key(deptno) references dept71(deptno)
);

create table member01(
id varchar2(20),
name varchar2(50),
addr varchar2(200),
phone varchar2(30),
constraint member01_idphone_pk primary key(id,phone)
);

select owner,constraint_name,table_name,column_name from user_cons_columns where table_name = 'member01';

--===================================================================

create table dept91(
deptno number(38) constraint dept91_deptno_pk primary key,
dname varchar2(50),
LOC varchar2(50)
);

insert into dept91 values(10,'경리부','서울');
insert into dept91 values(20,'영업부','부산');

select * from dept91 order by deptno;

create table emp91(
empno number(38) constraint emp91_empno_pk primary key,
ename varchar2(50) constraint emp91_ename_nn not null,
job varchar2(50),
deptno number(38) constraint emp91_deptno_fk references dept91(deptno)
);

insert into emp91 values(11,'홍길동','경리부장',10);
insert into emp91 values(12,'이순신','영업부장',20);

select * from emp91;

delete from dept91 where deptno=10;

alter table emp91 disable constraint emp91_deptno_fk;

select constraint_name, status from user_constraints where table_name='EMP91';

delete from dept91 where deptno=10;

select * from dept91;

alter table emp91 enable constraint emp91_deptno_fk;

insert into dept91 values(10,'경리부','서울');

commit;