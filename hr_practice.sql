
DROP TABLE members;

CREATE TABLE members(
    mem_id VARCHAR2(20) PRIMARY KEY,
    mem_PW VARCHAR2(20) NOT NULL,
    mem_name VARCHAR2(20) NOT NULL,
    mem_age NUMBER(2),
    mem_regdate DATE DEFAULT sysdate
);