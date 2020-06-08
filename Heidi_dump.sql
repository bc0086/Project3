-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.3-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- suamil_db 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `suamil_db`;
CREATE DATABASE IF NOT EXISTS `suamil_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `suamil_db`;

-- 테이블 suamil_db.member 구조 내보내기
DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `name` varchar(100) NOT NULL,
  `id` varchar(100) NOT NULL,
  `pass` varchar(100) NOT NULL,
  `pnum` varchar(100) DEFAULT NULL,
  `hnum` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `addr` varchar(100) NOT NULL,
  `regidate` datetime DEFAULT current_timestamp(),
  `grade` varchar(200) DEFAULT 'normal',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 suamil_db.member:~5 rows (대략적) 내보내기
DELETE FROM `member`;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`name`, `id`, `pass`, `pnum`, `hnum`, `email`, `addr`, `regidate`, `grade`) VALUES
	('kosmo', 'kos1', 'kos1', '123-1234-1234', '123-1234-1234', 'bc0086@naver.com', '서울 강남구 남부순환로 2609가산', '2020-06-05 20:21:57', 'normal'),
	('코스모61기', 'kosmo', '1234', '', '010-0000-0001', 'kosmo61@naver.com', '서울시 금천구 월드메르디앙2차', '2020-06-02 09:46:03', 'normal'),
	('코스모1', 'kosmo1', '1111', '02-1111-1111', '010-1111-1111', 'cosmo1@naver.com', '충북 청주시 상당구 1순환로 1202-1227-11', '2020-06-05 11:49:35', 'normal'),
	('코스모9', 'kosmo9', '9999', '02-9999-9999', '010-9999-9999', 'cosmo9@daum.net', '서울 강북구 4.19로 1279-3', '2020-06-05 11:52:57', 'normal'),
	('마스터', 'master', '1234', '', '010-1111-1111', 'bc0086@naver.com', '서울시 금천구 월드메르디앙2차', '2020-06-06 18:22:29', 'master');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- 테이블 suamil_db.multi_board 구조 내보내기
DROP TABLE IF EXISTS `multi_board`;
CREATE TABLE IF NOT EXISTS `multi_board` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `postdate` datetime DEFAULT current_timestamp(),
  `id` varchar(30) NOT NULL,
  `visitcount` mediumint(9) NOT NULL DEFAULT 0,
  `bname` varchar(200) DEFAULT '0',
  `file` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `fk_board_member` (`id`),
  CONSTRAINT `fk_board_member` FOREIGN KEY (`id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- 테이블 데이터 suamil_db.multi_board:~31 rows (대략적) 내보내기
DELETE FROM `multi_board`;
/*!40000 ALTER TABLE `multi_board` DISABLE KEYS */;
INSERT INTO `multi_board` (`num`, `title`, `content`, `postdate`, `id`, `visitcount`, `bname`, `file`) VALUES
	(2, '제목입니다1', '내용입니다1', '2020-06-06 18:25:17', 'master', 13, 'freeboard', NULL),
	(3, '제목입니다2', '내용입니다2', '2020-06-06 18:25:19', 'master', 6, 'schedule', NULL),
	(4, '제목입니다3', '내용입니다3', '2020-06-06 18:25:20', 'master', 0, 'phothboard', NULL),
	(5, '제목입니다4', '내용입니다4', '2020-06-06 18:25:21', 'master', 5, 'databoard', NULL),
	(6, '제목입니다5', '내용입니다5', '2020-06-06 18:25:23', 'master', 7, 'freeboard', NULL),
	(7, '여긴 공지사항', '내용없음', '2020-06-06 19:30:47', 'kosmo', 6, 'notice', NULL),
	(8, '123', '123', '2020-06-07 02:21:31', 'master', 3, 'photoboard', NULL),
	(10, '123123수정됬을까?', '12313\r\n수\r\n정\r\n됬\r\n을\r\n까\r\n?', '2020-06-07 02:34:16', 'master', 32, 'freeboard', NULL),
	(11, '234', '234\r\n2\r\n4\r\n5\r\n', '2020-06-07 05:29:38', 'master', 0, 'photoboard', NULL),
	(15, '1', '1', '2020-06-07 06:53:46', 'master', 0, 'freeboard', NULL),
	(16, '2', '2', '2020-06-07 06:53:51', 'master', 0, 'freeboard', NULL),
	(17, '3', '3', '2020-06-07 06:53:57', 'master', 0, 'freeboard', NULL),
	(18, '5', '5', '2020-06-07 06:54:55', 'master', 0, 'freeboard', NULL),
	(19, '6', '6', '2020-06-07 06:55:01', 'master', 1, 'freeboard', NULL),
	(20, '7', '7', '2020-06-07 06:55:06', 'master', 1, 'freeboard', NULL),
	(21, '8', '8', '2020-06-07 06:55:13', 'master', 0, 'freeboard', NULL),
	(22, '9', '9', '2020-06-07 06:55:18', 'master', 1, 'freeboard', NULL),
	(23, '자유게시판 드디어 완성됬다.', ' 힘드네', '2020-06-07 08:16:04', 'master', 1, 'freeboard', NULL),
	(24, '첨부1', '첨\r\n부\r\n합\\\r\n니\r\n다', '2020-06-07 11:31:25', 'master', 1, 'databoard', NULL),
	(25, '첨부시도2', '첨\r\n부\r\n좀\r\n되\r\n자\r\n\r\n', '2020-06-07 11:41:00', 'master', 11, 'databoard', NULL),
	(26, 'qr', 'qwr', '2020-06-07 13:35:09', 'kos1', 0, 'databoard', NULL),
	(27, 'qwe', 'qwe', '2020-06-07 13:35:24', 'kos1', 0, 'databoard', NULL),
	(28, 'qwe', 'qwe', '2020-06-07 13:35:55', 'kos1', 0, 'databoard', NULL),
	(29, 'asd', 'asd', '2020-06-07 13:37:55', 'kos1', 0, 'databoard', NULL),
	(30, 'qwe', 'qwe', '2020-06-07 13:58:43', 'kos1', 0, '0', NULL),
	(31, 'qwerqwr', 'qwr', '2020-06-07 13:59:12', 'kos1', 0, '0', NULL),
	(32, 'qwesadasf', 'asfasf', '2020-06-07 14:00:20', 'kos1', 0, 'databoard', NULL),
	(33, '11', '11', '2020-06-07 14:02:38', 'kos1', 0, 'databoard', NULL),
	(34, '22', '22', '2020-06-07 14:05:53', 'kos1', 0, 'databoard', '20200607_0225006.jpg'),
	(35, '33', '33', '2020-06-07 14:13:10', 'kos1', 0, 'databoard', '20200607_0225007.jpg'),
	(36, 'fdgfdg', 'fdgdfgd', '2020-06-07 14:35:11', 'master', 15, 'databoard', '20200607_022500.jpg');
/*!40000 ALTER TABLE `multi_board` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
