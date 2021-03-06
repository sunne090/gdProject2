/*
drop table patient cascade constraints;
drop table qna cascade constraints;
drop table reservation cascade constraints;
drop table doctor cascade constraints;
drop table comments cascade constraints;
drop table manager cascade constraints;
drop table subject cascade constraints;
drop table approval cascade constraints;
drop table notice cascade constraints;
drop table rest cascade constraints;
drop table files cascade constraints;
*/ 
/* 환자 회원 */
CREATE TABLE patient (
	pcode NUMBER NOT NULL, /* 회원 코드 */
	id VARCHAR(20), /* 아이디 */
	pw VARCHAR(20), /* 비밀번호 */
	nickname VARCHAR(20), /* 닉네임 */
	name VARCHAR(50), /* 이름 */
	tel VARCHAR(30), /* 연락처 */
	birth DATE, /* 생년월일 */
	gender VARCHAR(10), /* 성별 */
	email VARCHAR(40), /* 이메일 */
	postcode NUMBER, /* 우편번호 */
	address VARCHAR(255), /* 주소 */
	address2 VARCHAR(255) /* 상세주소 */
);

CREATE UNIQUE INDEX PK_patient
	ON patient (
		pcode ASC
	);

ALTER TABLE patient
	ADD
		CONSTRAINT PK_patient
		PRIMARY KEY (
			pcode
		);

/* 예약 */
CREATE TABLE reservation (
	rcode NUMBER NOT NULL, /* 예약 번호 */
	pcode NUMBER NOT NULL, /* 회원 코드 */
	dcode NUMBER NOT NULL, /* 의사 코드 */
	rsvdate DATE /* 예약 일자 */
);

CREATE UNIQUE INDEX PK_reservation
	ON reservation (
		rcode ASC
	);

ALTER TABLE reservation
	ADD
		CONSTRAINT PK_reservation
		PRIMARY KEY (
			rcode
		);

/* 소통 정보 */
CREATE TABLE qna (
	qno NUMBER NOT NULL, /* 게시글 번호 */
	pcode NUMBER NOT NULL, /* 회원 코드 */
	title VARCHAR(90), /* 제목 */
	content VARCHAR(900), /* 내용 */
	writedate DATE, /* 작성일자 */
	img VARCHAR(100), /* 사진 */
	cnt NUMBER /* 조회수 */
);

CREATE UNIQUE INDEX PK_qna
	ON qna (
		qno ASC
	);

ALTER TABLE qna
	ADD
		CONSTRAINT PK_qna
		PRIMARY KEY (
			qno
		);

/* 의사 */
CREATE TABLE doctor (
	dcode NUMBER NOT NULL, /* 의사 코드 */
	scode NUMBER NOT NULL, /* 과목 코드 */
	id VARCHAR(20), /* 아이디 */
	pw VARCHAR(20), /* 비밀번호 */
	name VARCHAR(50), /* 이름 */
	birth DATE, /* 생년월일 */
	licenseno NUMBER, /* 면허번호 */
	postcode NUMBER, /* 우편번호 */
	address VARCHAR(255), /* 주소 */
	address2 VARCHAR(255), /* 상세주소 */
	career VARCHAR(900), /* 경력사항 */
	tel VARCHAR(30), /* 연락처 */
	email VARCHAR(40) /* 이메일 */
);

CREATE UNIQUE INDEX PK_doctor
	ON doctor (
		dcode ASC
	);

ALTER TABLE doctor
	ADD
		CONSTRAINT PK_doctor
		PRIMARY KEY (
			dcode
		);

/* 진료 과목 */
CREATE TABLE subject (
	scode NUMBER NOT NULL, /* 과목 코드 */
	name VARCHAR(50), /* 과목 이름 */
	description VARCHAR(900), /* 과목 설명 */
	tel VARCHAR(30) /* 전화번호 */
);

CREATE UNIQUE INDEX PK_subject
	ON subject (
		scode ASC
	);

ALTER TABLE subject
	ADD
		CONSTRAINT PK_subject
		PRIMARY KEY (
			scode
		);

/* 관리자 */
CREATE TABLE manager (
	mcode NUMBER NOT NULL, /* 관리자 코드 */
	name VARCHAR(50), /* 관리자명 */
	id VARCHAR(20), /* 아이디 */
	pw VARCHAR(20) /* 비밀번호 */
);

CREATE UNIQUE INDEX PK_manager
	ON manager (
		mcode ASC
	);

ALTER TABLE manager
	ADD
		CONSTRAINT PK_manager
		PRIMARY KEY (
			mcode
		);

/* 공지사항 */
CREATE TABLE notice (
	ncode NUMBER NOT NULL, /* 게시글 번호 */
	mcode NUMBER NOT NULL, /* 관리자 코드 */
	title VARCHAR(90), /* 제목 */
	content VARCHAR(900), /* 내용 */
	writedate DATE, /* 작성일자 */
	cnt NUMBER /* 조회수 */
);

CREATE UNIQUE INDEX PK_notice
	ON notice (
		ncode ASC
	);

ALTER TABLE notice
	ADD
		CONSTRAINT PK_notice
		PRIMARY KEY (
			ncode
		);

/* 댓글 */
CREATE TABLE comments (
	qno NUMBER NOT NULL, /* 게시글 번호 */
	mcode NUMBER NOT NULL, /* 관리자 코드 */
	writedate DATE, /* 작성 일자 */
	content VARCHAR(150) /* 댓글 내용 */
);

CREATE UNIQUE INDEX PK_comments
	ON comments (
		qno ASC,
		mcode ASC
	);

ALTER TABLE comments
	ADD
		CONSTRAINT PK_comments
		PRIMARY KEY (
			qno,
			mcode
		);

/* 휴진 */
CREATE TABLE rest (
	rcode NUMBER NOT NULL, /* 휴진 번호 */
	acode NUMBER NOT NULL, /* 관리 번호 */
	restdate DATE, /* 휴진 날짜 */
	day VARCHAR(10) /* 휴진 요일 */
);

CREATE UNIQUE INDEX PK_rest
	ON rest (
		rcode ASC
	);

ALTER TABLE rest
	ADD
		CONSTRAINT PK_rest
		PRIMARY KEY (
			rcode
		);

/* 승인 신청 */
CREATE TABLE approval (
	acode NUMBER NOT NULL, /* 관리 번호 */
	dcode NUMBER NOT NULL, /* 의사 코드 */
	approvedate DATE, /* 신청 일자 */
	approved VARCHAR(10), /* 승인 여부 */
	reason VARCHAR(100) /* 휴진 사유 */
);

CREATE UNIQUE INDEX PK_approval
	ON approval (
		acode ASC
	);

ALTER TABLE approval
	ADD
		CONSTRAINT PK_approval
		PRIMARY KEY (
			acode
		);

/* 새 테이블2 */
CREATE TABLE files (
	fcode NUMBER NOT NULL, /* 새 컬럼 */
	ncode NUMBER NOT NULL, /* 게시글 번호 */
	uploaddate DATE, /* 새 컬럼3 */
	name VARCHAR(100), /* 새 컬럼4 */
	beforename VARCHAR(100), /* 새 컬럼5 */
	filesize NUMBER /* 새 컬럼6 */
);

CREATE UNIQUE INDEX PK_files
	ON files (
		fcode ASC
	);

ALTER TABLE files
	ADD
		CONSTRAINT PK_files
		PRIMARY KEY (
			fcode
		);

ALTER TABLE reservation
	ADD
		CONSTRAINT FK_patient_TO_reservation
		FOREIGN KEY (
			pcode
		)
		REFERENCES patient (
			pcode
		);
		

ALTER TABLE reservation
	ADD
		CONSTRAINT FK_doctor_TO_reservation
		FOREIGN KEY (
			dcode
		)
		REFERENCES doctor (
			dcode
		);

ALTER TABLE qna
	ADD
		CONSTRAINT FK_patient_TO_qna
		FOREIGN KEY (
			pcode
		)
		REFERENCES patient (
			pcode
		);

		
ALTER TABLE doctor
	ADD
		CONSTRAINT FK_subject_TO_doctor
		FOREIGN KEY (
			scode
		)
		REFERENCES subject (
			scode
		);

ALTER TABLE notice
	ADD
		CONSTRAINT FK_manager_TO_notice
		FOREIGN KEY (
			mcode
		)
		REFERENCES manager (
			mcode
		);

ALTER TABLE comments
	ADD
		CONSTRAINT FK_qna_TO_comments
		FOREIGN KEY (
			qno
		)
		REFERENCES qna (
			qno
		);

ALTER TABLE comments
	ADD
		CONSTRAINT FK_manager_TO_comments
		FOREIGN KEY (
			mcode
		)
		REFERENCES manager (
			mcode
		);
		

		
		
ALTER TABLE rest
	ADD
		CONSTRAINT FK_approval_TO_rest
		FOREIGN KEY (
			acode
		)
		REFERENCES approval (
			acode
		);

ALTER TABLE approval
	ADD
		CONSTRAINT FK_doctor_TO_approval
		FOREIGN KEY (
			dcode
		)
		REFERENCES doctor (
			dcode
		);

ALTER TABLE files
	ADD
		CONSTRAINT FK_notice_TO_files
		FOREIGN KEY (
			ncode
		)
		REFERENCES notice (
			ncode
		);
	


		
alter table files drop constraint fk_notice_to_files;
alter table files add constraint fk_notice_to_files 
foreign key (ncode) references notice(ncode) on delete cascade;

alter table qna drop constraint FK_patient_TO_qna;
alter table qna add constraint FK_patient_TO_qna 
foreign key (pcode) references patient(pcode) on delete cascade;

alter table reservation drop constraint FK_patient_TO_reservation;
alter table reservation add constraint FK_patient_TO_reservation 
foreign key (pcode) references patient(pcode) on delete cascade;

alter table reservation drop constraint FK_doctor_TO_reservation;
alter table reservation add constraint FK_doctor_TO_reservation 
foreign key (dcode) references doctor(dcode) on delete cascade;

alter table comments drop constraint FK_qna_TO_comments;
alter table comments add constraint FK_qna_TO_comments 
foreign key (qno) references qna(qno) on delete cascade;

alter table comments drop constraint FK_manager_TO_comments;
alter table comments add constraint FK_manager_TO_comments 
foreign key (mcode) references manager(mcode) on delete cascade;

delete from patient where pcode = 1;

alter table reservation
	modify state varchar(10) default '예약';
	
-- 데이터 삽입		
select * from patient;
select * from subject;
select * from manager;
select * from qna;

select * from manager;
insert into manager (mcode, name, id, pw)
   values (1, '매니저1', 'manager1', '1234');
insert into manager (mcode, name, id, pw)
   values (2, '매니저2', 'manager2', '123123');
insert into manager (mcode, name, id, pw)
   values (3, '매니저3', 'manager3', '4321');
insert into manager (mcode, name, id, pw)
   values (4, '매니저4', 'manager4', 'm1234');
insert into manager (mcode, name, id, pw)
   values (5, '매니저5', 'manager5', '1234m');

select * from subject;
insert into subject values(1, '가가가과', '국가안전보장에 관련되는 대외정책·군사정책과 국내정책의 수립에 관하여 국무회의의 심의에 앞서 대통령의 자문에 응하기 위하여 국가안전보장회의를 둔다.', '031-123-4567');
insert into subject values(2, '나나나과', '행정각부의 장은 국무위원 중에서 국무총리의 제청으로 대통령이 임명한다. 대통령이 제1항의 기간내에 공포나 재의의 요구를 하지 아니한 때에도 그 법률안은 법률로서 확정된다.', '031-456-7890');
insert into subject values(3, '다다다과', '국가는 농업 및 어업을 보호·육성하기 위하여 농·어촌종합개발과 그 지원등 필요한 계획을 수립·시행하여야 한다. 대법관의 임기는 6년으로 하며, 법률이 정하는 바에 의하여 연임할 수 있다.', '031-321-7654');
insert into subject values(4, '라라라과', '공무원의 신분과 정치적 중립성은 법률이 정하는 바에 의하여 보장된다. 국회는 법률에 저촉되지 아니하는 범위안에서 의사와 내부규율에 관한 규칙을 제정할 수 있다.', '031-987-6543');
insert into subject values(5, '마마마과', '누구든지 병역의무의 이행으로 인하여 불이익한 처우를 받지 아니한다. 혼인과 가족생활은 개인의 존엄과 양성의 평등을 기초로 성립되고 유지되어야 하며, 국가는 이를 보장한다.', '031-876-5432');

select * from patient;
insert into PATIENT values (1, 'aaa1234', '1234', '환자1', '홍길동', '010-1111-1111', to_date('1997-10-18','yyyy-mm-dd'), '남', 'pa123@sample.com', 12345, '경기도', '광명시');
insert into PATIENT values (2, 'bbb1234', '1234', '환자2', '스폰지밥', '010-2345-1111', to_date('1992-2-3','yyyy-mm-dd'), '여', 'sdf@sample.com', 2222, '서울특별시', '구로구');
insert into PATIENT values (3, 'ccc1234', '1234', '환자3', '징징이', '010-1111-1235', to_date('1991-11-21','yyyy-mm-dd'), '여', 'asdf@sample.com', 33333, '충청남도', '공주시');
insert into PATIENT values (4, 'ddd1234', '1234', '환자4', '뚱이', '010-2523-1123', to_date('1996-3-14','yyyy-mm-dd'), '남', 'gsds@sample.com', 44444, '강원도', '삼척시');
insert into PATIENT values (5, 'eee1234', '1234', '환자5', '다람이', '010-6434-1231', to_date('1999-6-26','yyyy-mm-dd'), '남', 'adfas@sample.com', 55555, '서울특별시', '종로구');
insert into PATIENT values(6,'id6','6666','닉네임6','이름6','010-1111-1116',to_date('1992-6-19','yyyy-mm-dd'),'남','email6@email.com','66666','주소6','세부주소6');
insert into PATIENT values(7,'id7','7777','닉네임7','이름7','010-1111-1117',to_date('1993-5-18','yyyy-mm-dd'),'여','email7@email.com','77777','주소7','세부주소7');
insert into PATIENT values(8,'id8','8888','닉네임8','이름8','010-1111-1118',to_date('1994-4-17','yyyy-mm-dd'),'남','email8@email.com','88888','주소8','세부주소8');
insert into PATIENT values(9,'id9','9999','닉네임9','이름9','010-1111-1119',to_date('1995-3-16','yyyy-mm-dd'),'여','email9@email.com','99999','주소9','세부주소9');
insert into PATIENT values(10,'id10','0000','닉네임10','이름10','010-1111-1110',to_date('1996-2-15','yyyy-mm-dd'),'남','email10@email.com','10000','주소10','세부주소10');

select * from doctor;
insert into doctor values(1, 1, 'id1', 'pw1', '의사1', to_date('1992-6-19','yyyy-mm-dd'), 12345678, 12345, '주소1', '상세주소1', '경력1', '010-1234-5678', 'abcd@abcd.com');
insert into doctor values(2, 1, 'id2', 'pw2', '의사2', to_date('1992-7-19','yyyy-mm-dd'), 23456789, 23456, '주소2', '상세주소2', '경력2', '010-2345-6789', 'bcde@bcde.com');
insert into doctor values(3, 3, 'id3', 'pw3', '의사3', to_date('1992-2-13','yyyy-mm-dd'), 34567890, 34567, '주소3', '상세주소3', '경력3', '010-3456-7890', 'cdef@cdef.com');
insert into doctor values(4, 4, 'id4', 'pw4', '의사4', to_date('1991-4-19','yyyy-mm-dd'), 45678901, 45678, '주소4', '상세주소4', '경력4', '010-4567-8901', 'defg@defg.com');
insert into doctor values(5, 5, 'id5', 'pw5', '의사5', to_date('1991-5-13','yyyy-mm-dd'), 56789012, 56789, '주소5', '상세주소5', '경력5', '010-5678-9012', 'efgh@efgh.com');

select * from notice;
insert into notice values (001, 1, '공지사항1', '1번 공지사항입니다.', to_date('2021-01-01','yyyy-mm-dd'), 0);
insert into notice values (002, 2, '공지사항2', '2번 공지사항입니다.', to_date('2021-02-01','yyyy-mm-dd'), 0);
insert into notice values (003, 3, '공지사항3', '3번 공지사항입니다.', to_date('2021-03-01','yyyy-mm-dd'), 0);
insert into notice values (004, 4, '공지사항4', '4번 공지사항입니다.', to_date('2021-04-01','yyyy-mm-dd'), 0);
insert into notice values (005, 5, '공지사항5', '5번 공지사항입니다.', to_date('2021-05-01','yyyy-mm-dd'), 0);

select * from qna;
insert into qna values (1, 1, '질문1', '질문일번입니다', sysdate, 'image경로1', 0);
insert into qna values (2, 3, '질문2', '질문이번입니다', sysdate, 'image경로2', 1);
insert into qna values (3, 5, '질문3', '질문삼번입니다', sysdate, 'image경로3', 727777);
insert into qna values (4, 7, '질문4', '질문사번입니다', sysdate, 'image경로4', 1000);
insert into qna values (5, 9, '질문5', '질문오번입니다', sysdate, 'image경로5', 55555);

select * from reservation;
insert into reservation values(1, 1, 2, to_date('2021-03-12','yyyy-mm-dd'));
insert into reservation values(2, 2, 1, to_date('2021-12-21','yyyy-mm-dd'));
insert into reservation values(3, 3, 5, to_date('2021-05-13','yyyy-mm-dd'));
insert into reservation values(4, 4, 4, to_date('2021-04-09','yyyy-mm-dd'));
insert into reservation values(5, 5, 3, to_date('2021-03-03','yyyy-mm-dd'));

select * from comments;
insert into COMMENTS values(1,1,to_date('2021-10-20','yyyy-mm-dd'),'감사합니다1');
insert into COMMENTS values(2,2,to_date('2021-09-20','yyyy-mm-dd'),'감사합니다2');
insert into COMMENTS values(3,3,to_date('2021-08-20','yyyy-mm-dd'),'감사합니다3');
insert into COMMENTS values(4,4,to_date('2021-07-20','yyyy-mm-dd'),'감사합니다4');
insert into COMMENTS values(5,5,to_date('2021-06-20','yyyy-mm-dd'),'감사합니다5');

select * from files;
insert into files values(1,1, to_date('2021-01-23', 'yyyy-mm-dd'), '바뀐이름1', '원래이름1', 3);
insert into files values(2,2, to_date('2021-02-23', 'yyyy-mm-dd'), '바뀐이름2', '원래이름2', 2);
insert into files values(3,3, to_date('2021-03-23', 'yyyy-mm-dd'), '바뀐이름3', '원래이름3', 1);
insert into files values(4,4, to_date('2021-04-23', 'yyyy-mm-dd'), '바뀐이름4', '원래이름4', 3);
insert into files values(5,5, to_date('2021-05-23', 'yyyy-mm-dd'), '바뀐이름5', '원래이름5', 2);

insert into approval values (1, 5, sysdate, '대기', '병가');


select * from approval;
insert into approval values (1, 5, sysdate, '승인', '병가');
insert into approval values (2, 4, sysdate, '대기', '휴가');
insert into approval values (3, 3, sysdate, '대기', '휴가');
insert into approval values (4, 2, sysdate, '대기', '휴가');
insert into approval values (5, 1, sysdate, '거절', '꾀병');

select * from rest;
insert into rest values(1, 1, null, 'FRI');
insert into rest values(2, 2, to_date('2021-03-12','yyyy-mm-dd'), null);
insert into rest values(3, 4, null, 'WED');
insert into rest values(4, 4, to_date('2021-03-15','yyyy-mm-dd'), null);
insert into rest values(5, 5, null, 'MON');
update rest set day = ''
select * from rest;
select * from approval natural join rest where approved = '승인' and dcode = 5;
select * from reservation where rsvdate between and;
select name, tel, dcode, rsvdate from (select p.name, p.tel, dcode, rsvdate from (select dcode, rsvdate from reservation r natural join doctor d) rd natural join patient p) rdp natural join subject s;

SELECT a.name
     , a.tel
     , b.rsvdate
     , c.name
     , d.name
  FROM patient a
 INNER JOIN reservation b
    ON a.pcode = b.pcode
 INNER JOIN doctor c
    ON b.dcode = c.dcode
    INNER JOIN subject d
    ON c.scode = d.scode
 WHERE a.pcode = 2;



select rsvdate, ds.name, state, p.name from 
(select rsvdate, ds.name, state from (select d.dcode, d.scode, s.name from doctor d join subject s
on d.scode = s.scode) ds join reservation r
on r.dcode = ds.dcode) dsr join patient p
on p.pcode = dsr.;

select d.name, d.career, s.name from doctor d join subject s
on d.scode = s.scode where d.dcode = 1;

select * from qna q join patient p
on q.pcode = p.pcode where p.nickname = '환자1';

insert into reservation values(8, 2, 1, sysdate,'예약');
insert into reservation values(9, 2, 1, sysdate + 2,'예약');
 ALTER TABLE notice MODIFY references; 
SELECT b.rcode
    , b.rsvdate
    , a.name
 FROM patient a
INNER JOIN reservation b
   ON a.pcode = b.pcode
INNER JOIN doctor c
   ON b.dcode = c.dcode
WHERE c.dcode = '1' and to_char(b.rsvdate, 'yyyy-mm-dd') = to_date('2021-10-20', 'yyyy-mm-dd') 
order by b.rsvdate asc;

select d.dcode, d.scode, d.name, d.career, d.tel, d.email from doctor d join subject s on d.scode = s.scode where s.name = '가가가과';
select * from approval;
select * from rest;
update rest set restdate = sysdate + 3 where rcode=2;
select to_char(restdate, 'yyyy-mm-dd') restdate, day from rest r join approval a on r.acode = a.acode where a.dcode = 4  and approved='승인';
update rest set approved='승인'
select * from reservation where dcode = 1 and to_char(rsvdate, 'yyyy-mm-dd') = '2021-10-20' and state = '예약';
select * from reservation where rcode = 11;
select * from reservation;
update reservation set rsvdate = to_date('2021-10-26 9:30:00', 'yyyy-mm-dd HH24:MI:SS') where rcode = 11;


create sequence rsv_seq start with 12;
insert into reservation values(rsv_seq.nextval, 2, 2, to_date('2021-10-26 17:45', 'yyyy-mm-dd HH24:MI'), '예약');
delete from reservation where rcode <= 25 and 12 <= rcode;

-- 페이지 처리
select * from (select rownum as rn , rsvs.* from (select r.rcode, r.pcode, r.rsvdate, d.scode, s.name from reservation r inner join doctor d on r.dcode = d.dcode inner join subject s on d.scode = s.scode where r.pcode = 2 order by rcode desc) rsvs) result;


select memoid, name, age from (select rownum as rn, memos.* from (select * from memo order by memoid desc) memos) where rn between 14 and 16


SELECT p.name pname, p.tel, r.rsvdate, d.name dname, s.name sname FROM patient p INNER JOIN reservation r ON p.pcode = r.pcode INNER JOIN doctor d ON r.dcode = d.dcode INNER JOIN subject s ON d.scode = s.scode WHERE r.rcode = 2;

select count(*) as cnt from reservation where dcode = 1;

select * from (select rownum as rn, rsvs.* from (select r.rcode, to_char(r.rsvdate, 'yyyy-mm-dd HH24:MI') rsvdate, r.pcode, p.name from reservation r inner join patient p on r.pcode = p.pcode where r.dcode = 1 and to_char(rsvdate, 'yyyy-mm-dd') = '2021-10-28' order by rsvdate desc) rsvs) result where rn between 1 and 10
select * from approval;
select * from rest
select * from reservation
merge into reservation using dual on (rcode = 10) when matched then update set r.state = '취소' when not matched then update reservation set r.state = '예약';

select * from approval

alter table approval add restdate date;
alter table approval add day varchar(10);

drop table rest;

insert into rest values (1, 5, sysdate, '승인', '병가', null, 6);
insert into rest values (2, 4, sysdate, '대기', '휴가', to_date('2021-12-01','yyyy-mm-dd'), null);
insert into rest values (3, 3, sysdate, '대기', '휴가', null, 4);
insert into rest values (4, 2, sysdate, '대기', '휴가', to_date('2021-03-15','yyyy-mm-dd'), null);
insert into rest values (5, 1, sysdate, '거절', '꾀병', null, 2);

alter table approval rename to rest;
alter table rest rename column acode to rcode;

alter table rest rename column approvedate to requestdate;

select * from manager;

select * from rest;

update rest set approved = '승인'
insert into rest values (6, 4, sysdate, '승인', '휴가', to_date('2021-11-30','yyyy-mm-dd'), null);
insert into rest values (7, 4, sysdate, '승인', '휴가', null, 6);


select * from (select rownum as rn, n.ncode, n.title, m.name, to_char(n.writedate,'yyyy-mm-dd') as writedate, n.cnt from notice n inner join manager m on n.mcode = m.mcode order by n.ncode desc) where rn between 1 and 4

select * from (select ROW_NUMBER() OVER(ORDER BY n.writedate desc) as rn, n.ncode, n.title, m.name, to_char(n.writedate,'yyyy-mm-dd') as writedate, n.cnt
from notice n inner join manager m on n.mcode = m.mcode) where rn between 1 and 4

delete from rest
alter table rest modify day number
select * from rest

create sequence qna_seq

select p.pcode, count(*) from patient p right outer join reservation r on p.pcode = r.pcode group by p.pcode;

SELECT p.pcode pcode, p.name name, p.birth birth, count(r.pcode) cnt
FROM patient p 
LEFT OUTER JOIN reservation r 
ON p.pcode = r.pcode 
GROUP BY p.pcode, p.name, p.birth;

select * from reservation;

select * from doctor;


create sequence a;

select a.currval from dual;

create table t(
	n number primary key
)



insert into t values(a.nextval) and
select n from t


select * from doctor;


select * from reservation;

select to_char(rsvdate, 'yyyy-mm-dd') rsvdate from reservation where dcode = 1 group by to_char(rsvdate, 'yyyy-mm-dd');

create sequence ncode;

select * from notice;
delete from notice;
select * from files;

create sequence fileSeq




