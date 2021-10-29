select * from subject order by name asc;
delete from subject;
drop sequence subject_seq;
create sequence subject_seq;
insert into subject values(subject_seq.nextval, '��������', '���������� ���� �̻����� ���� �������� ���� ������ �𸣴� ����(�Ҹ�) ȯ��, ������, ���� ȯ�� ���� �����ϰ� �ֽ��ϴ�. �̻����� ���� �߻��ϴ� ��� ������ȯ�� �����ϰ� ġ���ϴ� ������Դϴ�', '031-123-4560');
insert into subject values(subject_seq.nextval, '���к��系��', '���к�-��� ���������� ��ü�� ���� ���к� ������� �к�Ǿ� ������ ȣ������ �̻��̳� ȣ���� �к� ��� �Ǵ� ǥ�� ����� ���� �������� ���� ġ���մϴ�.', '031-123-4561');
insert into subject values(subject_seq.nextval, '�˷����⳻��', '�˷����⳻�������� �ܺ� ������ ���� �鿪������ �����ļ� ���ι����� ����Ű�� ��ȯ���� �����ϰ� �����ϴ�, ������ �� �а��Դϴ�. Ư�� �˷����⼾�Ϳ� ���� �����մϴ�.', '031-123-4562');
insert into subject values(subject_seq.nextval, '�����ܰ�', '�����ܰ������� �оߺ��� ������ Ŭ����, �ΰ� �ȸ� Ŭ����, �ȸ�Ű渶�� Ŭ����, ����� Ŭ����, ���� ���� ��� Ŭ����, �������� Ŭ����, ������ Ŭ���� �� Ư��ȭ�� ���� Ŭ������ ��ϰ� �ֽ��ϴ�.', '031-123-4563');
insert into subject values(subject_seq.nextval, '�Ҿ�û�ҳ��', '�Ҿ�û�ҳ���� ��̿� û�ҳ��� �ǰ������� ���� 3�� ���������μ� �������ú��� �׸��� ��������� ��� ���߰� �ֽ��ϴ�.', '031-123-4564');
insert into subject values(subject_seq.nextval, '�Ȱ�', '�Ȱ��� ���� 110,000�� �̻��� �ܷ� ȯ�� ����� 6,000�ǿ� ���ϴ� ������ �����ϴ� ���� �ִ� �Ȱ� �������μ� �ְ��� �Ƿ����� �ֻ��� ���񽺸� ���� �ϰ� �ֽ��ϴ�.', '031-123-4565');
insert into subject values(subject_seq.nextval, '�̺����İ�', '������ ���õ� ��, ���� ���̿��̳� ���⼺ ���̿����� ��� ������ ġ�ᰡ �ʿ��� �� ������ ���̰��� �̿��� ���� ������� �ֱ� ���ð��� �̿��� ���� ������� �پ��� ���ٹ������ �����ϰ� �ֽ��ϴ�.', '031-123-4566');
insert into subject values(subject_seq.nextval, '�����ܰ�', '������ ô�߿� �ִ� ���� ���� �� ����, �δ�, �Ű�, ���� �� ���� ������ ���ؼ� �����ϰ�, ��ȯ�� �ܻ��� �����ϰ� ġ���ϴ� �о��Դϴ�.', '031-123-4567');
insert into subject values(subject_seq.nextval, '�Ǻΰ�', '�Ǻΰ��� �Ǻ� ��ȯ���� ���� �޴� ���� ȯ�ڵ��� ���� ���Ḧ �����ϰ� �ֽ��ϴ�. �� �������� ����� �Ƿ����� ÷���� �Ƿ���� ���߾����� ����� �����Ƿ����� �缺�մϴ�.', '031-123-4568');
insert into subject values(subject_seq.nextval, '��οܰ�', '��οܰ��� ũ�� ����ܰ��� ��,�ĵ��ܰ��� �������� ������, ��Ȯ�� ���� �� ġ�Ḧ �����ϸ�, �ֻ��� ���񽺸� �����ϱ� ���� ��� �Ƿ����� �ּ��� ���ϰ� �ֽ��ϴ�.', '031-123-4569');

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
/* ȯ�� ȸ�� */
CREATE TABLE patient (
   pcode NUMBER NOT NULL, /* ȸ�� �ڵ� */
   id VARCHAR(20), /* ���̵� */
   pw VARCHAR(20), /* ��й�ȣ */
   nickname VARCHAR(20), /* �г��� */
   name VARCHAR(50), /* �̸� */
   tel VARCHAR(30), /* ����ó */
   birth DATE, /* ������� */
   gender VARCHAR(10), /* ���� */
   email VARCHAR(40), /* �̸��� */
   postcode NUMBER, /* �����ȣ */
   address VARCHAR(255), /* �ּ� */
   address2 VARCHAR(255) /* ���ּ� */
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

/* ���� */
CREATE TABLE reservation (
   rcode NUMBER NOT NULL, /* ���� ��ȣ */
   pcode NUMBER NOT NULL, /* ȸ�� �ڵ� */
   dcode NUMBER NOT NULL, /* �ǻ� �ڵ� */
   rsvdate DATE /* ���� ���� */
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

/* ���� ���� */
CREATE TABLE qna (
   qno NUMBER NOT NULL, /* �Խñ� ��ȣ */
   pcode NUMBER NOT NULL, /* ȸ�� �ڵ� */
   title VARCHAR(90), /* ���� */
   content VARCHAR(900), /* ���� */
   writedate DATE, /* �ۼ����� */
   img VARCHAR(100), /* ���� */
   cnt NUMBER /* ��ȸ�� */
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

/* �ǻ� */
CREATE TABLE doctor (
   dcode NUMBER NOT NULL, /* �ǻ� �ڵ� */
   scode NUMBER NOT NULL, /* ���� �ڵ� */
   id VARCHAR(20), /* ���̵� */
   pw VARCHAR(20), /* ��й�ȣ */
   name VARCHAR(50), /* �̸� */
   birth DATE, /* ������� */
   licenseno NUMBER, /* �����ȣ */
   postcode NUMBER, /* �����ȣ */
   address VARCHAR(255), /* �ּ� */
   address2 VARCHAR(255), /* ���ּ� */
   career VARCHAR(900), /* ��»��� */
   tel VARCHAR(30), /* ����ó */
   email VARCHAR(40) /* �̸��� */
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

/* ���� ���� */
CREATE TABLE subject (
   scode NUMBER NOT NULL, /* ���� �ڵ� */
   name VARCHAR(50), /* ���� �̸� */
   description VARCHAR(900), /* ���� ���� */
   tel VARCHAR(30) /* ��ȭ��ȣ */
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

/* ������ */
CREATE TABLE manager (
   mcode NUMBER NOT NULL, /* ������ �ڵ� */
   name VARCHAR(50), /* �����ڸ� */
   id VARCHAR(20), /* ���̵� */
   pw VARCHAR(20) /* ��й�ȣ */
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

/* �������� */
CREATE TABLE notice (
   ncode NUMBER NOT NULL, /* �Խñ� ��ȣ */
   mcode NUMBER NOT NULL, /* ������ �ڵ� */
   title VARCHAR(90), /* ���� */
   content VARCHAR(900), /* ���� */
   writedate DATE, /* �ۼ����� */
   cnt NUMBER /* ��ȸ�� */
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

/* ��� */
CREATE TABLE comments (
   qno NUMBER NOT NULL, /* �Խñ� ��ȣ */
   mcode NUMBER NOT NULL, /* ������ �ڵ� */
   writedate DATE, /* �ۼ� ���� */
   content VARCHAR(150) /* ��� ���� */
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

/* ���� */
CREATE TABLE rest (
   rcode NUMBER NOT NULL, /* ���� ��ȣ */
   acode NUMBER NOT NULL, /* ���� ��ȣ */
   restdate DATE, /* ���� ��¥ */
   day VARCHAR(10) /* ���� ���� */
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

/* ���� ��û */
CREATE TABLE approval (
   acode NUMBER NOT NULL, /* ���� ��ȣ */
   dcode NUMBER NOT NULL, /* �ǻ� �ڵ� */
   approvedate DATE, /* ��û ���� */
   approved VARCHAR(10), /* ���� ���� */
   reason VARCHAR(100) /* ���� ���� */
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

/* �� ���̺�2 */
CREATE TABLE files (
   fcode NUMBER NOT NULL, /* �� �÷� */
   ncode NUMBER NOT NULL, /* �Խñ� ��ȣ */
   uploaddate DATE, /* �� �÷�3 */
   name VARCHAR(100), /* �� �÷�4 */
   beforename VARCHAR(100), /* �� �÷�5 */
   filesize NUMBER /* �� �÷�6 */
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
-- ������ ����      
select * from patient;
select * from subject;
select * from manager;
select * from qna;

select * from manager;
insert into manager (mcode, name, id, pw)
   values (1, '�Ŵ���1', 'manager1', '1234');
insert into manager (mcode, name, id, pw)
   values (2, '�Ŵ���2', 'manager2', '123123');
insert into manager (mcode, name, id, pw)
   values (3, '�Ŵ���3', 'manager3', '4321');
insert into manager (mcode, name, id, pw)
   values (4, '�Ŵ���4', 'manager4', 'm1234');
insert into manager (mcode, name, id, pw)
   values (5, '�Ŵ���5', 'manager5', '1234m');

select * from subject; 
insert into subject values(1, '��������', '�����������忡 ���õǴ� �����å��������å�� ������å�� ������ ���Ͽ� ����ȸ���� ���ǿ� �ռ� ������� �ڹ��� ���ϱ� ���Ͽ� ������������ȸ�Ǹ� �д�.', '031-123-4567');
insert into subject values(2, '��������', '���������� ���� �������� �߿��� �����Ѹ��� ��û���� ������� �Ӹ��Ѵ�. ������� ��1���� �Ⱓ���� ������ ������ �䱸�� ���� �ƴ��� ������ �� �������� �����μ� Ȯ���ȴ�.', '031-456-7890');
insert into subject values(3, '�ٴٴٰ�', '������ ��� �� ����� ��ȣ�������ϱ� ���Ͽ� �󡤾������հ��߰� �� ������ �ʿ��� ��ȹ�� �����������Ͽ��� �Ѵ�. ������� �ӱ�� 6������ �ϸ�, ������ ���ϴ� �ٿ� ���Ͽ� ������ �� �ִ�.', '031-321-7654');
insert into subject values(4, '�����', '�������� �źа� ��ġ�� �߸����� ������ ���ϴ� �ٿ� ���Ͽ� ����ȴ�. ��ȸ�� ������ ���˵��� �ƴ��ϴ� �����ȿ��� �ǻ�� ���α����� ���� ��Ģ�� ������ �� �ִ�.', '031-987-6543');
insert into subject values(5, '��������', '�������� �����ǹ��� �������� ���Ͽ� �������� ó�츦 ���� �ƴ��Ѵ�. ȥ�ΰ� ������Ȱ�� ������ ������ �缺�� ����� ���ʷ� �����ǰ� �����Ǿ�� �ϸ�, ������ �̸� �����Ѵ�.', '031-876-5432');

select * from patient;
insert into PATIENT values (1, 'aaa1234', '1234', 'ȯ��1', 'ȫ�浿', '010-1111-1111', to_date('1997-10-18','yyyy-mm-dd'), '��', 'pa123@sample.com', 12345, '��⵵', '�����');
insert into PATIENT values (2, 'bbb1234', '1234', 'ȯ��2', '��������', '010-2345-1111', to_date('1992-2-3','yyyy-mm-dd'), '��', 'sdf@sample.com', 2222, '����Ư����', '���α�');
insert into PATIENT values (3, 'ccc1234', '1234', 'ȯ��3', '¡¡��', '010-1111-1235', to_date('1991-11-21','yyyy-mm-dd'), '��', 'asdf@sample.com', 33333, '��û����', '���ֽ�');
insert into PATIENT values (4, 'ddd1234', '1234', 'ȯ��4', '����', '010-2523-1123', to_date('1996-3-14','yyyy-mm-dd'), '��', 'gsds@sample.com', 44444, '������', '��ô��');
insert into PATIENT values (5, 'eee1234', '1234', 'ȯ��5', '�ٶ���', '010-6434-1231', to_date('1999-6-26','yyyy-mm-dd'), '��', 'adfas@sample.com', 55555, '����Ư����', '���α�');
insert into PATIENT values(6,'id6','6666','�г���6','�̸�6','010-1111-1116',to_date('1992-6-19','yyyy-mm-dd'),'��','email6@email.com','66666','�ּ�6','�����ּ�6');
insert into PATIENT values(7,'id7','7777','�г���7','�̸�7','010-1111-1117',to_date('1993-5-18','yyyy-mm-dd'),'��','email7@email.com','77777','�ּ�7','�����ּ�7');
insert into PATIENT values(8,'id8','8888','�г���8','�̸�8','010-1111-1118',to_date('1994-4-17','yyyy-mm-dd'),'��','email8@email.com','88888','�ּ�8','�����ּ�8');
insert into PATIENT values(9,'id9','9999','�г���9','�̸�9','010-1111-1119',to_date('1995-3-16','yyyy-mm-dd'),'��','email9@email.com','99999','�ּ�9','�����ּ�9');
insert into PATIENT values(10,'id10','0000','�г���10','�̸�10','010-1111-1110',to_date('1996-2-15','yyyy-mm-dd'),'��','email10@email.com','10000','�ּ�10','�����ּ�10');

select * from doctor;
insert into doctor values(1, 1, 'id1', 'pw1', '�ǻ�1', to_date('1992-6-19','yyyy-mm-dd'), 12345678, 12345, '�ּ�1', '���ּ�1', '���1', '010-1234-5678', 'abcd@abcd.com');
insert into doctor values(2, 1, 'id2', 'pw2', '�ǻ�2', to_date('1992-7-19','yyyy-mm-dd'), 23456789, 23456, '�ּ�2', '���ּ�2', '���2', '010-2345-6789', 'bcde@bcde.com');
insert into doctor values(3, 3, 'id3', 'pw3', '�ǻ�3', to_date('1992-2-13','yyyy-mm-dd'), 34567890, 34567, '�ּ�3', '���ּ�3', '���3', '010-3456-7890', 'cdef@cdef.com');
insert into doctor values(4, 4, 'id4', 'pw4', '�ǻ�4', to_date('1991-4-19','yyyy-mm-dd'), 45678901, 45678, '�ּ�4', '���ּ�4', '���4', '010-4567-8901', 'defg@defg.com');
insert into doctor values(5, 5, 'id5', 'pw5', '�ǻ�5', to_date('1991-5-13','yyyy-mm-dd'), 56789012, 56789, '�ּ�5', '���ּ�5', '���5', '010-5678-9012', 'efgh@efgh.com');

select * from notice;
insert into notice values (001, 1, '��������1', '1�� ���������Դϴ�.', to_date('2021-01-01','yyyy-mm-dd'), 0);
insert into notice values (002, 2, '��������2', '2�� ���������Դϴ�.', to_date('2021-02-01','yyyy-mm-dd'), 0);
insert into notice values (003, 3, '��������3', '3�� ���������Դϴ�.', to_date('2021-03-01','yyyy-mm-dd'), 0);
insert into notice values (004, 4, '��������4', '4�� ���������Դϴ�.', to_date('2021-04-01','yyyy-mm-dd'), 0);
insert into notice values (005, 5, '��������5', '5�� ���������Դϴ�.', to_date('2021-05-01','yyyy-mm-dd'), 0);

select * from qna;
insert into qna values (1, 1, '����1', '�����Ϲ��Դϴ�', sysdate, 'image���1', 0);
insert into qna values (2, 3, '����2', '�����̹��Դϴ�', sysdate, 'image���2', 1);
insert into qna values (3, 5, '����3', '��������Դϴ�', sysdate, 'image���3', 727777);
insert into qna values (4, 7, '����4', '��������Դϴ�', sysdate, 'image���4', 1000);
insert into qna values (5, 9, '����5', '���������Դϴ�', sysdate, 'image���5', 55555);

select * from reservation;
insert into reservation values(1, 1, 2, to_date('2021-03-12','yyyy-mm-dd'));
insert into reservation values(2, 2, 1, to_date('2021-12-21','yyyy-mm-dd'));
insert into reservation values(3, 3, 5, to_date('2021-05-13','yyyy-mm-dd'));
insert into reservation values(4, 4, 4, to_date('2021-04-09','yyyy-mm-dd'));
insert into reservation values(5, 5, 3, to_date('2021-03-03','yyyy-mm-dd'));

select * from comments;
insert into COMMENTS values(1,1,to_date('2021-10-20','yyyy-mm-dd'),'�����մϴ�1');
insert into COMMENTS values(2,2,to_date('2021-09-20','yyyy-mm-dd'),'�����մϴ�2');
insert into COMMENTS values(3,3,to_date('2021-08-20','yyyy-mm-dd'),'�����մϴ�3');
insert into COMMENTS values(4,4,to_date('2021-07-20','yyyy-mm-dd'),'�����մϴ�4');
insert into COMMENTS values(5,5,to_date('2021-06-20','yyyy-mm-dd'),'�����մϴ�5');

select * from files;
insert into files values(1,1, to_date('2021-01-23', 'yyyy-mm-dd'), '�ٲ��̸�1', '�����̸�1', 3);
insert into files values(2,2, to_date('2021-02-23', 'yyyy-mm-dd'), '�ٲ��̸�2', '�����̸�2', 2);
insert into files values(3,3, to_date('2021-03-23', 'yyyy-mm-dd'), '�ٲ��̸�3', '�����̸�3', 1);
insert into files values(4,4, to_date('2021-04-23', 'yyyy-mm-dd'), '�ٲ��̸�4', '�����̸�4', 3);
insert into files values(5,5, to_date('2021-05-23', 'yyyy-mm-dd'), '�ٲ��̸�5', '�����̸�5', 2);



select * from approval;
insert into approval values (1, 5, sysdate, '����', '����');
insert into approval values (2, 4, sysdate, '���', '�ް�');
insert into approval values (3, 3, sysdate, '���', '�ް�');
insert into approval values (4, 2, sysdate, '���', '�ް�');
insert into approval values (5, 1, sysdate, '����', '�Һ�');

select * from rest;
insert into rest values(1, 1, null, 'FRI');
insert into rest values(2, 2, to_date('2021-03-12','yyyy-mm-dd'), null);
insert into rest values(3, 4, null, 'WED');
insert into rest values(4, 4, to_date('2021-03-15','yyyy-mm-dd'), null);
insert into rest values(5, 5, null, 'MON');

SELECT COUNT(*) FROM PATIENT WHERE ID='id6';

SELECT * FROM ((RESERVATION NATURAL JOIN PATIENT) NATURAL JOIN SUBJECT)NATURAL JOIN DOCTOR WHERE RCODE=2; 

SELECT a.name, a.tel, b.rsvdate, c.name, d.name FROM patient a INNER JOIN reservation b
ON a.pcode = b.pcode
INNER JOIN doctor c
ON b.dcode = c.dcode
INNER JOIN subject d
ON c.scode = d.scode
WHERE a.pcode = 1;

alter table reservation add state varchar(10);

insert into reservation values(6, 5, 3, to_date('2021-03-03','yyyy-mm-dd'), '����');


select rcode,rsvdate, ds.name, state from (select d.dcode, d.scode, s.name from doctor d join subject s on d.scode = s.scode) ds join reservation r
on r.dcode = ds.dcode where pcode=1;

SELECT a.id
  , b.rcode
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
WHERE a.pcode = '1';


select d.name,s.name,d.career from doctor d join subject s on d.scode = s.scode where d.dcode = 1;

select q.qno, q.title, p.nickname, q.writedate, q.cnt
from qna q inner join patient p
on q.pcode = p.pcode;

select q.qno, q.title, q.content, p.nickname, q.writedate, q.cnt from qna q join patient p
on q.pcode = p.pcode where p.pcode= 1;

select * from comments where qno = 1;

update qna set title = 'qna001', content = '����11', img = '���11'  where qno = 1 and pcode = 1;

select rcode, rsvdate, ds.name, state from (select d.dcode, d.scode, s.name from doctor d join subject s
on d.scode = s.scode) ds join reservation r
on r.dcode = ds.dcode where ds.dcode=1;

SELECT b.rcode
    , b.rsvdate
    , a.name
 FROM patient a
INNER JOIN reservation b
   ON a.pcode = b.pcode
INNER JOIN doctor c
   ON b.dcode = c.dcode
WHERE c.dcode = '1';

select d.dcode, d.name, s.name, d.licenseno from doctor d join subject s
on d.scode = s.scode
Where s.scode = 1;

select a.acode,d.name, a.approvedate, a.approved from doctor d inner join approval a
on d.dcode = a.dcode;

select a.acode, d.name, a.approvedate, a.approved 
from doctor d inner join approval a
on d.dcode = a.dcode where d.name like '%�ǻ�%'
order by a.acode desc;

select d.name, a.approvedate, a.approved, a.reason 
from doctor d inner join approval a
on d.dcode = a.dcode
where acode = 1;

update approval set approved = '����' where acode = 1;

select n.ncode, n.title, m.name, n.writedate, n.cnt
from notice n inner join manager m
on n.mcode = m.mcode
order by n.ncode desc;


select n.ncode, n.title, m.name, n.writedate, n.cnt
from notice n inner join manager m
on n.mcode = m.mcode
where n.title like '%�Դϴ�%' or n.content like '%�Դϴ�%'
order by n.ncode desc;

select q.qno, q.title, p.nickname, q.writedate, q.cnt 
from qna q join patient p
on q.pcode = p.pcode 
where p.nickname like '%ȯ��%'
order by q.qno desc;

select q.qno, q.title, p.nickname, q.writedate, q.cnt 
from qna q join patient p
on q.pcode = p.pcode 
where q.title like '%����%' or q.content like '%����%'
order by q.qno desc;

--///////////////////////////////////////////////////////
insert into PATIENT values (1, 'aaa1234', '1234', 'ȯ��1��, 'ȫ�浿', '010-1111-1111', to_date('1997-10-18','yyyy-mm-dd'), '����, 'pa123@sample.com', 12345, '��⵵', '�����');

select count(*) from patient where id = 'aaa1234';

select id, pw from patient where id ='aaa1234' and pw = '1234';

select id, pw from doctor where id = 'id1' and pw = 'pw1';

select id, pw from manager where id = 'manager1' and pw = '1234';

update patient set pw = '1111', postcode = 00000, address = '����', address2 = '������', tel = '010-1234-5678', email = 'sample1@samp.com' where pcode = 1;

select * from patient where pcode = 1;


select n.ncode, n.title, m.name, n.writedate, n.cnt
from notice n inner join manager m
on n.mcode = m.mcode
order by n.ncode desc;


select n.ncode, n.title, m.name, n.writedate, n.cnt
from notice n inner join manager m
on n.mcode = m.mcode
where n.title like '%�Դϴ�%' or n.content like '%�Դϴ�%'
order by n.ncode desc;


select n.title, m.name, n.writedate, n.cnt, n.content
from notice n inner join manager m
on n.mcode = m.mcode
where ncode=1;

select beforename from files where ncode=1;

update files set uploaddate=sysdate, name='�ٲ��̸�6', beforename='�����̸�6', filesize=3 where fcode=1;
select * from files;
delete from files;

delete from files where ncode=1;


alter table files drop constraint fk_notice_to_files;
alter table files add constraint fk_notice_to_files 
foreign key (ncode) references notice(ncode) on delete cascade;




SELECT TABLE_NAME, CONSTRAINT_NAME 
FROM USER_CONSTRAINTS 
WHERE TABLE_NAME = 'QNA';

SELECT TABLE_NAME, CONSTRAINT_NAME 
FROM USER_CONSTRAINTS 
WHERE TABLE_NAME = 'COMMENTS';

SELECT TABLE_NAME, CONSTRAINT_NAME 
FROM USER_CONSTRAINTS 
WHERE TABLE_NAME = 'RESERVATION';

SELECT TABLE_NAME, CONSTRAINT_NAME 
FROM USER_CONSTRAINTS 
WHERE TABLE_NAME = 'APPROVAL';

SELECT TABLE_NAME, CONSTRAINT_NAME 
FROM USER_CONSTRAINTS 
WHERE TABLE_NAME = 'REST';

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

alter table APPROVAL drop constraint FK_doctor_TO_approval;
alter table APPROVAL add constraint FK_doctor_TO_approval 
foreign key (dcode) references doctor(dcode) on delete cascade;

alter table rest drop constraint FK_APPROVAL_TO_REST;
alter table rest add constraint FK_APPROVAL_TO_REST 
foreign key (acode) references approval(acode) on delete cascade;

delete from patient where pcode=1;
select * from reservation;
create sequence rsv_seq;
create sequence pcode;
drop sequence pcode;
delete from patient;
select * from patient;
select * from rest;
create sequence approval_seq;
drop sequence approval_seq;
select * from notice;
select * from manager;
delete from approval;
insert into approval values (approval_seq.nextval, 10, to_date('2021-11-01', 'yyyy-mm-dd'), '���', '�ް�', sysdate);
insert into approval values (approval_seq.nextval, 5, to_date('2021-11-03', 'yyyy-mm-dd'), '���', '���λ���', sysdate);
ALTER TABLE approval ADD requestdate DATE;
alter table approval drop column adate;
ALTER TABLE approval DROP COLUMN requestdate;

drop table rest;
drop table approval;

alter table approval add restdate date;
alter table approval add day varchar(10);


insert into approval values (1, 5, sysdate, '����', '����', null, 'FRI');
insert into approval values (2, 4, sysdate, '���', '�ް�', to_date('2021-03-12','yyyy-mm-dd'), null);
insert into approval values (3, 3, sysdate, '���', '�ް�', null, 'WED');
insert into approval values (4, 2, sysdate, '���', '�ް�', to_date('2021-03-15','yyyy-mm-dd'), null);
insert into approval values (5, 1, sysdate, '����', '�Һ�', null, 'MON');

alter table approval rename to rest;
alter table rest rename column acode to rcode;
alter table rest rename column approvedate to requestdate;
select * from rest;
create sequence rest_seq;
delete from rest;
insert into rest values (rest_seq.nextval, 3, sysdate, '���', '����', to_date('2021-11-03', 'yyyy-mm-dd'), null);
insert into rest values (rest_seq.nextval, 3, sysdate, '���', '����', null, 'FRI');
select * from rest where dcode = 3;
select * from rest where approved = '���' and dcode = 3;
select rcode, dcode, requestdate, approved, reason, to_char(restdate, 'yyyy-mm-dd')as restdate, day from rest where approved = '����' and dcode = 3;
update rest set approved = '����' where dcode = 12;
