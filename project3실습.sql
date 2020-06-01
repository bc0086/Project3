/*
	블럭단위 주석
*/
#라인단위 주석1
-- 라인단위 주석2

#모델1방식(JSP) + MariaDB를 이용한 게시판
#회원테이블(부모)
create table member
(
name VARCHAR(100) NOT null,
id VARCHAR(100) NOT null,
pass VARCHAR(100) NOT NULL,
pnum VARCHAR(100),
hnum VARCHAR(100) NOT null,
email VARCHAR(100) NOT null,
addr VARCHAR(100) NOT null,
regidate datetime default CURRENT_TIMESTAMP, 
/* 
	현재시간을 디폴트로 사용
	datatime : 날짜와 시간을 동시에 표현할 수 있는 자료형
*/
primary key(id)
);

DROP TABLE member;
#더미데이터 삽입	
INSERT INTO member (NAME, id, pass, pnum, hnum, email, addr) VALUES ('코스모61기', 'kosmo', '1234', '');