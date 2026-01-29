# 📝 JPA 기반 게시판 데이터베이스 설계 (Oracle)

이 저장소는 Java와 Database를 연동하는 **JDBC 실습을 위한 Oracle SQL 스크립트**를 포함하고 있습니다. 
컴퓨터 전공자 및 시니어 입문자분들이 DB 구축 원리를 쉽게 이해할 수 있도록 구성되었습니다.

---

## 🚀 1. 사용자 계정 생성 및 권한 설정
> 반드시 시스템(System/Admin) 환경에서 실행해야 합니다.

```sql
-- 스크립트 모드 활성화 (12c 이상)
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

-- 기존 사용자 삭제 및 신규 생성
DROP USER KHH CASCADE; 
CREATE USER KHH IDENTIFIED BY KHH
    DEFAULT TABLESPACE USERS
    TEMPORARY TABLESPACE TEMP; 

-- 필수 권한 부여
GRANT CONNECT, RESOURCE, DBA TO KHH;

# 🛠 2. 테이블 및 시퀀스 생성게시판의 핵심 정보를 저장할 테이블 구조와 게시글 번호 자동 증가를 위한 시퀀스입니다.
테이블 구조

컬럼명,타입,제약조건,설명
no,NUMBER,PRIMARY KEY,게시글 고유 번호
title,VARCHAR2(100),NOT NULL,글 제목
content,VARCHAR2(1000),,글 내용
writer,VARCHAR2(50),NOT NULL,작성자명
regdate,DATE,DEFAULT SYSDATE,등록 일시

SQLDROP TABLE jdbcBoard;
CREATE TABLE jdbcBoard( 
    no NUMBER, 
    title VARCHAR2(100) NOT NULL, 
    content VARCHAR2(1000), 
    writer VARCHAR2(50) NOT NULL, 
    regdate DATE DEFAULT SYSDATE,
    PRIMARY KEY(no) 
);

-- 시퀀스 생성 (1부터 시작)
DROP SEQUENCE jdbcBoard_seq;
CREATE SEQUENCE jdbcBoard_seq START WITH 1 INCREMENT BY 1; 

🔍 3. 주요 SQL 활용 예시
데이터 관리 (CRUD)
 데이터 입력: INSERT INTO jdbcBoard VALUES(jdbcBoard_seq.nextval, '제목', '내용', '작성자', sysdate);
 전체 목록 조회: SELECT * FROM jdbcBoard ORDER BY no DESC;
 게시글 수정: UPDATE jdbcBoard SET title='수정제목', content='수정내용' WHERE no=5;
 게시글 삭제: DELETE FROM jdbcBoard WHERE no=8;
 검색 기능SQL-- 제목에 'b'가 포함된 게시글 검색
   SELECT * FROM jdbcBoard WHERE no > 0 AND title LIKE '%b%';

-- 작성자에 'c'가 포함된 게시글 검색
SELECT * FROM jdbcBoard WHERE no > 0 AND writer LIKE '%c%';
⚠️ 주의사항실습 중 데이터가 잘못되었다면 ROLLBACK;
명령어로 되돌릴 수 있습니다.
데이터 확정을 위해서는 COMMIT;
명령어를 잊지 마세요.

