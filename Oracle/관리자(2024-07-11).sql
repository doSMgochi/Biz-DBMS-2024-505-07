-- ������ ������ ȭ��
/*
���� ȭ���� USERNAME : SYS, ���� : SYSDBA �� ������ ȭ���̴�
SYTSDBA �� Oracle DBMS �� �ſ� �߿��� ������ ��Ÿ����.
SYSDBA�� DB �� �����ϰ�, �����ϰ�, ����ڸ� �����ϰ�, �����ϰ�, �������� �ý��۰����� �� �� �ִ� �����̴�.
���� SYS ������� ��й�ȣ�� �� �����Ǿ�� �Ѵ�.
*/
-- Oracle DBMS ������Ʈ�� ó�� ������ ���� �����ڷ� �����Ͽ� TableSpace �� User �� ������ �־�� �Ѵ�.
-- TableSpace �� C:/app/data ������ ������ ��

CREATE TABLESPACE student -- student ��� �̸����� TableSpace, ������ ����Ҹ� ����
DATAFILE 'C:/app/data/student.dbf' -- c:/app/data ������ student.dbf ��� �̸��� ������ �����ϰ�, ������ ����ҷ� �ϰڴ�
SIZE 1M -- Data ������� ������ 1MByte ��ŭ �����ϰڴ�. SIZE 1MB ó�� ����ϸ� �� �ȴ�.
AUTOEXTEND ON NEXT 1K; -- �⺻ ����� ������ ���� ä������, 1KB �� �ڵ����� ��� �÷���

DROP TABLESPACE student -- student ��� TableSpace �� �����ϰڴ�
INCLUDING CONTENTS AND DATAFILES
CASCADE CONSTRAINTS;

/*
TableSpace : student
������ ���� : C:/app/data/student.dbf
���� ũ�� : 2M Byte
�ڵ����� ũ�� : 2K Byte
*/

CREATE TABLESPACE student
DATAFILE 'C:/app/data/student.dbf'
SIZE 2M
AUTOEXTEND ON NEXT 2K;

-- ����� ����
/*
����Ŭ 12c ���� �������� user �� ������ �� �Ϲ����� ���ڿ������� user �� ������ �� ����
����� �̸� �տ� �ݵ�� C## �� ������ ���·� user name �� �����ؾ��Ѵ�.
�� ������ �������� �������� �߻��ϰ�
Ư�� JAVA ����� �ٸ� ������ DBMS �� �����ϴ� ���α׷����� ������ ���� ������ ����ų �� �ִ�.
*/
CREATE USER C##user1 -- user1 �̶�� �̸����� ����ڸ� �����Ѵ�
IDENTIFIED BY 1234; -- ��й�ȣ�� 1234 �� �����Ѵ�

DROP USER C##user1 CASCADE;

/*
����Ŭ 12c ���� �������� ����+���� ������ �Ϲ����� ����� ID �� �����ϱ� ���Ͽ�
�ý��� ������ ������ �� ����� �����Ѵ�.
*/
ALTER SESSION SET "_ORACLE_SCRIPT" = true;
CREATE USER user1 IDENTIFIED 1234;

/*
USER �� ������ �� �տ��� ������ TableSpace �� USER ������ �������־�߸�
����� �����Ͱ� ���� ������ TableSpace �� ����ȴ�.
*/
CREATE USER user1 IDENTIFIED BY 1234;
-- ���� ������ user1 �� �ƹ��� ������ ���, �α��� ���� �� �� ����.
-- user1 ���� �������� ������ �ο��ؾ߸� DBMS �� �����Ͽ� ������ ������ �� �ִ�.
/*
���� �ο� ��å
������ USER(user1) ���� �α���, ���̺� ����, CRUD, ��Ÿ �������� ������ ������ �ο��ϴ� ���� �ǹ��� ��Ģ
�н��ϴ� ���忡��, ���ÿ� ����� �����Ϳ� �����Ѵٴ� �������� ȯ�濡�� �������� ������ ������ �ο��ϴ� ����
����� �����԰� ������� �ִ�.

���⼭�� user1 ���� DBA ������ �ο��� ���̴�.
����Ŭ���� DBA ������ SYSDBA ���� ���� ���ѵ� �����̸�, �α���, ���̺� ���� ����, CRUD ���� ������
��� ������ �� �ִ� �����̴�.
*/

GRANT DBA TO user1;