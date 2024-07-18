-- schoolUser 로 접속한 화면
-- 학생정보테이블명세의 학생정보 sheet 를 다음 조건으로 완성
-- 학번 : PK, 학생이름, 학과, 전화번호는 NOT NULL 로
-- 학생정보테이블명세.학생정보 sheet 를 기준으로
-- tbl_student 테이블을 생성
USE schoolDB;
CREATE TABLE tbl_student (
	st_num	VARCHAR(5)		PRIMARY KEY,
	st_name	VARCHAR(20)	NOT NULL	,
	st_dept	VARCHAR(20)	NOT NULL	,
	st_grade	TINYINT		,
	st_tel	VARCHAR(20)	NOT NULL	,
	st_addr	VARCHAR(125)		
);
CREATE TABLE tbl_subject (
sb_code	VARCHAR(5)		PRIMARY KEY,
sb_name	VARCHAR(20)	NOT NULL	,
sb_prof	VARCHAR(20)
);

DROP TABLE tbl_subject;

CREATE TABLE tbl_score (
sc_stnum	VARCHAR(5)	NOT NULL,
sc_sbcode	VARCHAR(5)	NOT NULL,
sc_score	INT	NOT NULL,
PRIMARY KEY(sc_stnum, sc_sbcode)
);

SELECT * FROM tbl_subject;
SELECT COUNT(*) FROM tbl_student;

SELECT * FROM tbl_score;
SELECT COUNT(*) FROM tbl_score;
/*
학생정보, 성적정보, 과목정보 3개의 Table 을 JOIN 하여
학번 S0001 인 학생의 성적을 출력 : SELECTION

학번, 이름, 학과, 학년, 과목코드, 과목명, 점수 : PROJECTION
*/

CREATE VIEW view_scores
AS 
(SELECT std.st_num AS 학번, std.st_name AS 이름,
		std.st_dept AS 학과, std.st_grade AS 학년,
		sco.sc_sbcode AS 과목코드, sub.sb_name AS 과목명, sco.sc_score AS 점수
FROM tbl_student std
	JOIN tbl_score sco
		ON std.st_num = sco.sc_stnum
	JOIN tbl_subject sub
		ON sco.sc_sbcode = sub.sb_code
);

SELECT * 
FROM view_scores
WHERE 학번 = 'S0001';

/*
각 학생의 총점을 계산하여 다음과 같이 출력
학번 이름, 학과, 학년, 총점
*/
SELECT st_num AS 학번, st_name AS 이름, st_dept AS 학과, st_grade AS 학년, SUM(sc_score) AS 총점, AVG(sc_score) AS 평균
FROM tbl_student
	JOIN tbl_score
		ON st_num = sc_stnum
GROUP BY st_num, st_name, st_dept, st_grade;

-- 위의 SQL 을 응용하여 각 학생의 평균이
-- 60점 이상, 69점 이하인 학생들만 나열
-- 성적순으로 내림차순 정렬

-- (1)
SELECT st_num AS 학번, st_name AS 이름, st_dept AS 학과, st_grade AS 학년, SUM(sc_score) AS 총점, AVG(sc_score) AS 평균
FROM tbl_student
	JOIN tbl_score
		ON st_num = sc_stnum
GROUP BY st_num, st_name, st_dept, st_grade
HAVING 평균 BETWEEN 60 AND 69
ORDER BY 평균 desc;

-- 위(1) SQL 을 응용하여
-- 학년 3학년인 학생들의
-- 학생별 총점과 평균을 구하고
-- 평균이 60 이상 69 이하인 리스트만 출력

SELECT st_num AS 학번, st_name AS 이름, st_dept AS 학과, st_grade AS 학년, SUM(sc_score) AS 총점, AVG(sc_score) AS 평균
FROM tbl_student
	JOIN tbl_score
		ON st_num = sc_stnum
WHERE st_grade = '3'
GROUP BY st_num, st_name, st_dept, st_grade
HAVING 평균 BETWEEN 60 AND 69
ORDER BY 평균 desc;

SELECT st.st_num, st.st_name, st.st_dept, st.st_grade, sc.sb_code, sc.sb_name, sc.sc_score
FROM (SELECT * FROM tbl_score sco JOIN tbl_subject sub ON sco.sc_sbcode = sub.sb_code) sc JOIN tbl_student st
ON sc.sc_stnum = st.st_num
WHERE st.st_num = 'S0001';