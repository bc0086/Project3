/*
	블럭단위 주석
*/
#라인단위 주석1
-- 라인단위 주석2

#모델1방식(JSP) + MariaDB를 이용한 게시판
#회원테이블(부모)
create table member
(
id VARCHAR(100) NOT null,
pass VARCHAR(100) NOT NULL,
name VARCHAR(100) NOT null,
pnum VARCHAR(100),
hnum VARCHAR(100) NOT null,
email VARCHAR(100) NOT null,
addr VARCHAR(100) NOT null,
regidate datetime default CURRENT_TIMESTAMP, 
/* 
	현재시간을 디폴트로 사용member
	datatime : 날짜와 시간을 동시에 표현할 수 있는 자료형
*/
primary key(id)member
);
member
DROP TABLE member;
#더미데이터 삽입	
INSERT INTO member (id, pass, name, pnum, hnum, email, addr) VALUES ('kosmo', '1234', '코스모61기', '', '010-0000-0001', 'kosmo61@naver.com', '서울시 금천구 월드메르디앙2차');