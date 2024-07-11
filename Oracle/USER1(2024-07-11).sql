-- ����� Student TableSpace �� �����ϴ� user1 ȭ���Դϴ�.

/*
tbl_student table �� ���� �Ӽ����� ���̺� �����ϱ�

�й� : st_num ���ڿ�(10) PK
�̸� : st_name �ѱ� ���ڿ�(20) NOT NULL
�а� : st_dept �ѱ۹��ڿ�(20) NOT NULL
�г� : st_grade ����
��ȭ��ȣ : st_tel ���ڿ� NOT NULL

����Ŭ�� ���ڿ� type
CHAR, VARCHAR2, nVARCHAR2
CHAR : ���� ���ڿ�, ���̰� ������ ���ڿ� �����͸� �����ϱ�
    CHAR type �� ���� ������ ���ڿ��� �����ϸ� SELECT ���� ������ ����Ű�� ��찡 ����.
VARCHAR2 : ���� ��, ������ ���ڿ�, �������ڿ�, �����ϴ� ���ڿ��� Į���� ũ�⺸�� ������
    ������ �����Ͽ� ���� ���� ���� ����
nVARCHAR2 : UTF-8 ��� ��, ����, �ѱ� �� 2byte ���ڿ��� ȿ�������� �����ϱ� ���� type

���� ������ DBMS ���� ��ü�� ����, �ѱ� ���ڿ��� Ư���� �������� �ʰ� ó���� �Ѵ�.
�������� ����ϴ� ����Ŭ DBMS �� ���޵� 7,8,9 ������ ������ ���� ����Ѵ�.
����Ŭ 9 ������ ������ ���ڿ��� type VARCHAR2, nVARCHAR2 �� ��Ȯ�� ������ �ϴµ�
���� Į���� �ѱ� "ȫ�浿" �� ����Ǿ� �ִٸ�
VARCHAR2 �� ���ڿ��� ���̰� 6���� nVARCHAR2 �� ���ڿ��� ���̰� 3���� ǥ���ȴ�.

���� ����ϴ� 21c ���������� �ѱ��̳� ������ ���ڿ� ���̸� ���� ���ڿ��� ������ ǥ���Ѵ�
������ 9 ���� ������ VARCHAR2 �� byte ũ��� ǥ���ϰ�, nVARCHAR2 �� ���ڿ��� ���̷� ǥ���Ͽ�
ȥ���� �ش�.
���� �������� VARCHAR2 �� nVARCHAR2 �� �����ϴ� ���� ȣȯ�� ���� ���� ���̴�.

DB ������ ���� VARCHAR2 �� ���� ���̺��� �ѱ� ���ڿ��� ���ݹۿ� ���� ���ϴ� ��쵵 �ִ�.
*/

CREATE TABLE tbl_student (
st_num varchar2(10) primary key,
st_name nvarchar2(20) not null,
st_dept nvarchar2(20) not null,
st_grade number,
st_tel varchar2(20) not null
);

drop table tbl_student;
/*
INSERT INTO �� ������ �� ��üĮ���� ��ġ�ϴ� �����͸� �߰��� ��
INSERT �Ǵ� Į�� ����Ʈ�� ������ �� ������,
�̴� ������ ���Ἲ�� ��ĥ �� �ִ� ���� ������ �ڵ��̴�. ���� ��� ����.
*/
insert into tbl_student(st_num,st_name,st_dept,st_grade,st_tel) values ('2400001', 'ȫ�浿', '�������', 3, '010-1111-1111');
insert into tbl_student(st_num,st_name,st_dept,st_grade,st_tel) values ('2400002', '������', '���а�', 2, '010-2222-2222');
insert into tbl_student(st_num,st_name,st_dept,st_grade,st_tel) values ('2400003', '�̸���', '�����а�', 4, '010-3333-3333');
SELECT LENGTH(st_name) FROM tbl_student;

/*
�л����̺�(tbl_student)���� �̸��� �л��� ��ȭ��ȣ��
010-3333-3333 ���� 010-333-3456 ���� �����ϴ� SQL �� �ۼ�
*/

SELECT *
FROM tbl_student
WHERE st_name = '�̸���' AND st_tel = '010-3333-3333';

-- ù��° SELECT ���� �����Ͱ� ������
-- �̸����� �ٽ� �� �� SELECT �� �غ���.

-- st_name Į���� PK �� �ƴϸ�, UNIQUE Į���� �ƴϴ�
-- �̷��� �Ϲ����� Į���� WHERE ���� ����Ͽ� UPDATE, DELETE �� �����ϸ�
-- ������ ���Ἲ�� ������ �� ����.
SELECT *
FROM tbl_student
WHERE st_name = '�̸���';

-- UPDATE, DELETE �� �����ϰ��� �ϴ� �������� PK Į�� ���� �ݵ�� ���� Ȯ�� �� ��
-- PK Į���� WHERE ���� ����Ͽ� �����ؾ� �Ѵ�.
UPDATE tbl_student 
SET st_tel = '010-333-3456' 
WHERE st_num = '2400003';

DROP TABLE tbl_student;

CREATE TABLE tbl_student (
st_num	VARCHAR2(5)		PRIMARY KEY,
st_name	nVARCHAR2(20)	NOT NULL	,
st_dept	nVARCHAR2(20)	NOT NULL	,
st_grade	NUMBER		,
st_tel	VARCHAR2(20)	NOT NULL	,
st_addr	nVARCHAR2(125)		

);

SELECT * FROM tbl_student;
SELECT COUNT(*) FROM tbl_student;
-- �л������� �߿��� �а��� �����а��� �л��� ����Ʈ�� ������
-- ��ü ������ �߿��� Ư���� ���� (WHERE) �� �ο��Ͽ� ����Ʈ�� �Ϻθ� ����ϴ� ���� SELECTION �̶�� �Ѵ�.
SELECT * FROM tbl_student WHERE st_dept = '�����а�';

-- �л������� �߿��� �л��̸�, ��ȭ��ȣ �׸� �����ְ� �̸� ������ �����Ͽ� ������
-- �л� ���̺� ��ü Į�� (�Ӽ�, Attribute) �߿��� Ư���� Į���� �����Ͽ� ȭ�鿡 ���̵��� �ϴ� ���� Projection �̶�� �Ѵ�.
SELECT st_name, st_tel
FROM tbl_student
ORDER BY st_name;

CREATE TABLE tbl_ (
st_num VARCHAR2(5) PRIMARY KEY,
number(3) NOT NULL,
number(3) NOT NULL,
number(3) NOT NULL,
number(3) NOT NULL,
number(3) NOT NULL,
number(3) NOT NULL,
number(3) NOT NULL,
number(3) NOT NULL,

CONSTRAINT _RULE01 FOREIGN KEY (st_num) REFERENCES tbl_student (st_num);
);