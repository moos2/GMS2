--SEQUENCE
CREATE SEQUENCE seq
START WITH 2000
INCREMENT BY 1
NOCACHE
NOCYCLE;

--***************************************************
--[1]MAJOR_TAB
--[2]SUBJECT_TAB
--[3]MEMBER_TAB
--[4]PROF_TAB
--[5]STUDENT_TAB
--[6]GRADE_TAB
--[7]BOARD_TAB



--[1]MAJOR_TAB
--2017.08.02
--article_seq,id,title
--content,hitcount,regdate
--*************************************************
--DDL
CREATE TABLE MAJOR(
	major_id VARCHAR2(10),
	title VARCHAR2(10),
	PRIMARY KEY(major_id)
);
--DML
INSERT INTO Major(major_id,title)
VALUES('','');
--******************************************************




--[2]SUBJECT_TAB
--2017.08.02
select * from subject;
CREATE TABLE Subject(
	subj_id VARCHAR2(10),
);
--
--*************************************************





--[3]MEMBER_TAB
--2017.08.02
--회원관리 테이블
--member_id,name,password,ssn,regdate,major_id,phone,email,profile
--member_id,salary
--*************************************************
CREATE TABLE Member(
	member_id VARCHAR2(10),
	name VARCHAR2(10),
	password VARCHAR2(10),
	ssn VARCHAR2(15),
	regdate DATE,
	major_id VARCHAR2(10),
	phone VARCHAR2(20),
	email VARCHAR2(20),
	profile VARCHAR2(20),
	PRIMARY KEY(member_id),
	FOREIGN KEY(major_id) REFERENCES Major(major_id)
	ON DELETE CASCADE
);

SELECT * FROM Member WHERE name="김철수";
SELECT * FROM Member WHERE id='hong';
INSERT INTO member(member_id,name,password,ssn,regdate,major_id,phone,email,profile)
VALUES('gosling','고슬링','1','584578-4578548',SYSDATE,'computer','010-1234-5648','gosling@java.com','defaultimg.jpg');
INSERT INTO prof(member_id,salary)
VALUES('gosling','13000');
SELECT COUNT(*) AS count FROM Member;
UPDATE Member SET password='2' WHERE id='hong';
DELETE FROM Member WHERE id ='choi';
--*************************************************




--[4]PROF_TAB
--2017.08.02
--member_id,salary
--DDL
CREATE TABLE Prof(
	member_id VARCHAR2(10),
	salary VARCHAR2(10),
	PRIMARY KEY(member_id),
	FOREIGN KEY(member_id) REFERENCES Member(member_id)
	ON DELETE CASCADE
);

ALTER TABLE Prof Modify salary VARCHAR2(10);

--DML
insert into prof(member_id,salary) values('hang','7000');
select * from prof;
--*************************************************


--[5]STUDENT_TAB
--2017.08.02
CREATE TABLE Student(
	member_id VARCHAR2(10),
	stu_no VARCHAR2(8),
	PRIMARY KEY(member_id),
	FOREIGN KEY(member_id) REFERENCES Member(member_id)
	ON DELETE CASCADE
);
--
--*************************************************



--[6]GRADE_TAB
--2017.08.02
CREATE TABLE Grade(
	grade_seq NUMBER,
	score VARCHAR2(3),
	exam_date VARCHAR2(12),
	subj_id VARCHAR2(10),
	member_id VARCHAR2(10),
	PRIMARY KEY (grade_seq),
	FOREIGN KEY (member_id) REFERENCES Member(member_id)
	ON DELETE CASCADE,
	FOREIGN KEY (subj_id) REFERENCES Subject(subj_id)
	ON DELETE CASCADE
);

RENAME COLUMN id TO member_id;
--DML
INSERT INTO Grade(grade_seq,score,exam_date,subj_id,member_id)
VALUES(seq.nextval,'90','2017-03','java','hang');
SELECT * FROM Grade;

--5개 테이블 조인
select distinct
m.member_id, m.name, mj.title as major,
g.score, sj.title as subject, g.exam_date
from member m, student s,grade g,subject sj,major mj
where
m.member_id=s.member_id
and m.member_id = g.member_id
and sj.MAJOR_ID=mj.MAJOR_ID
and sj.SUBJ_ID=g.SUBJ_ID
order by m.MEMBER_ID, g.EXAM_DATE;
select * from tab;
--SUB QUERY
--member_id를 입력하면 평균점수를 반환하는 SQL 1
select avg(score)
from (select distinct
m.member_id as id, m.name, mj.title as major,
g.score, sj.title as subject, g.exam_date
from member m, student s,grade g,subject sj,major mj
where
m.member_id=s.member_id
and m.member_id = g.member_id
and sj.MAJOR_ID=mj.MAJOR_ID
and sj.SUBJ_ID=g.SUBJ_ID) t
where t.id='garbage';

--member_id를 입력하면 평균점수를 반환하는 SQL 2  INNER JOIN
select avg(score)
from (select distinct
		m.member_id id, m.name, 
		g.score score, g.exam_date exam_date
	from Grade g
		inner join Subject s on g.subj_id=s.subj_id
		inner join Member m on m.member_id=g.member_id
) t
where t.id='garbage';

-- GROUP BY HAVING
select t.id id, avg(score) avg
from (select distinct
		m.member_id id, m.name, 
		g.score score, g.exam_date exam_date
	from Grade g
		inner join Subject s on g.subj_id=s.subj_id
		inner join Member m on m.member_id=g.member_id
) t
group by t.id
having avg(score)>70
order by avg(score) desc;

--join
select m.seq No, m.name 남편, f.name 부인
from female f
full outer join male m on m.seq=f.seq;
--DDL
DROP TABLE Grade;
--*************************************************

select *     --  inline view
from emp e     --  sub query
where e.seq in    --  중첩 query
(select d.seq seq
from dep d
join emp e on d.seq=e.seq)
;
--[7]BOARD_TAB
--2017.08.02
--article_seq,id,title,content,hitcount,regdate
CREATE TABLE Board(
	article_seq NUMBER,
);
INSERT INTO Board(article_seq,id,title,content,hitcount,regdate)
VALUES(seq.nextval,'hong','홍길라임','호나우도요타',0,SYSDATE);
select * from Board;
--*************************************************

--44 고용일 입력
insert into professor
(profno,name,userid,position,sal,hiredate,comm,deptno)
values(9008,'팀','tim','전임강사',260,
    to_date('2015/0101','yyyy/MM/dd'),null,101);
    
    
    
