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

SELECT id FROM member WHERE NAME="진병찬" AND email="chan@naver.com";

#더미데이터 삽입	
INSERT INTO member (id, pass, name, pnum, hnum, email, addr) VALUES ('kosmo', '1234', '코스모61기', '', '010-0000-0001', 'kosmo61@naver.com', '서울시 금천구 월드메르디앙2차');

SELECT pass FROM member WHERE id="kos1" AND NAME="kosmo" AND email="bc0086@naver.com";


create table multi_board
(
    num int not NULL auto_increment,
    title varchar(100) not null,
    content text not null,
    postdate datetime default current_timestamp,
    id VARCHAR(30) not null,
    visitcount MEDIUMint NOT NULL DEFAULT 0,
    primary key (num)
);

-- 외래키
# 회원테이블과 게시판테이블의 참조 제약조건board
ALTER TABLE multi_board ADD constraint fk_board_member
	FOREIGN KEY (id) REFERENCES member (id);
	
#더미데이터 삽입	
INSERT INTO member (NAME, id, pass, pnum, hnum, email, addr ) VALUES ('마스터', 'master', '1234', '', '010-1111-1111', 'bc0086@naver.com', '서울시금천구 월드메르디앙2차');
# member테이블과 외래키 제약조건이 있으므로 board테이블에 먼저 삽입할 경우
# 에러가 발생된다.
INSERT INTO multi_board (title, content, id) VALUES ('제목입니다1', '내용입니다1', 'master');
INSERT INTO multi_board (title, content, id) VALUES ('제목입니다2', '내용입니다2', 'master');
INSERT INTO multi_board (title, content, id) VALUES ('제목입니다3', '내용입니다3', 'master');
INSERT INTO multi_board (title, content, id) VALUES ('제목입니다4', '내용입니다4', 'master');
INSERT INTO multi_board (title, content, id) VALUES ('제목입니다5', '내용입니다5', 'master');

#bname추가
ALTER TABLE multi_board ADD bname VARCHAR(200);

ALTER TABLE multi_board ADD file VARCHAR(200);

/*
	기존의 게시판을 멀티게시판으로 변경
		공지사항 : notice
		프로그램일정 : schedule
		자유게시판 : freeboard
		사진게시판 : photoboard
		정보자료실 : databoard
	하나의 테이블로 여러개의 게시판을 제작하는 경우 게시판의 구분을 위해
	flag(플레그)가 필요하다.
*/

-- 공지사항 게시판에 글쓰기
INSERT INTO multi_board (title, content, id, bname)
	VALUE ('여긴 공지사항', '내용없음', 'kosmo', 'notice');
	
-- 자유게시판에 글쓰기
INSERT INTO multi_board (title, content, id, bname)
	VALUE ('여긴 공지사항1', '내용없음', 'kosmo', 'notice');
	
-- 자유게시판 리스트보기
SELECT * FROM multi_board WHERE bname='freeboard';

-- 공지사항  리스트보기
SELECT * FROM multi_board WHERE bname='notice';