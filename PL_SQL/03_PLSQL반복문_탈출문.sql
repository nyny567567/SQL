
-- WHILE문

DECLARE
    v_num NUMBER := 3;
    v_count NUMBER := 1;
BEGIN
    WHILE v_count <= 10 
    LOOP
        dbms_output.put_line(v_num);
        v_count := v_count + 1;
    
    END LOOP;
end;


-- 탈출문
DECLARE
    v_num NUMBER := 3;
    v_count NUMBER := 1;
BEGIN
    WHILE v_count <= 10 
    LOOP
        dbms_output.put_line(v_num);
        EXIT WHEN v_count = 5;
        v_count := v_count + 1;
    
    END LOOP;
end;


-- FOR문
DECLARE
    V_NUM number := 3;
BEGIN

    FOR i IN 1..9 -- .을 두 개 작성해서 범위를 표현.
    LOOP
        CONTINUE WHEN i = 5;
        dbms_output.put_line(v_num || 'x' || i || '=' || v_num*i);
    END LOOP;


END;

-- 1. 모든 구구단을 출력하는 익명 블록을 만드세요. (2 ~ 9단)
    
BEGIN
    FOR dan IN 2..9
    LOOP
        dbms_output.put_line('구구단: ' || dan || '단');
    FOR hang IN 1..9 -- .을 두 개 작성해서 범위를 표현.
    LOOP
          dbms_output.put_line(dan || 'x' || hang || '=' ||dan*hang);
        END LOOP;
        dbms_output.put_line('-----------------------------------');
        
    END LOOP;


END;

-- 2. INSERT를 300번 실행하는 익명 블록을 처리하세요.
-- board라는 이름의 테이블을 만드세요. (bno, writer, title 컬럼이 존재합니다.)
-- bno는 SEQUENcE로 올려 주시고, writer와 title에 번호를 붙여서 INSERT 진행해 주세요.
-- ex) 1, test1, title1 -> 2 test2 title2 -> 3 test3 title

CREATE TABLE board (
    bno number primary key,
    writer varchar2(50),
    title varchar2(50)
    );
    
    
CREATE SEQUENCE b_seq 
    START WITH 1 -- 시작값 (기본값은 증가할 때 최소값, 감소할 때 최대값)
    INCREMENT BY 1 -- 증가값 (양수면 증가, 음수면 감소, 기본값 1)
    MAXVALUE 300 -- 최대값(기본값은 증가 1027, 감소일 때 -1)
    NOCACHE -- 캐시메모리 사용 여부 (CACHE) 
    NOCYCLE; -- 순환 여부 (NOCYCLE이 기본, 순환시키려면 CYCLE);

begin
 for i in 1..300
 loop
 insert INTO board values(b_seq.nextval, concat('test', b_seq.nextval), concat('title', b_seq.nextval));

end loop;
commit;
end;

select * from board
ORDER BY bno DESC;
