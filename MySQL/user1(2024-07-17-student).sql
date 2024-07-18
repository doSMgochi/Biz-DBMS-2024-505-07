-- user1 로 접속한 화면
USE mydb;
SELECT * FROM tbl_student;
-- SC0001, 홍길동, 정보통신, 3, 010-1111-1111, 서울특별시 데이터를
-- tbl_student 테이블에 INSERT
INSERT INTO tbl_student (st_num, st_name, st_dept, st_grade, st_tel, st_addr)
VALUES ('S00001', '홍길동', '정보통신', '3', '010-1111-1111', '서울특별시');

-- 학번이 S00001 인 학생의 주소를
-- 서울특별시에서 강원도 원주로 변경하기
UPDATE SET st_addr = '강원도 원주' tbl_student WHERE st_num = 'S00001';