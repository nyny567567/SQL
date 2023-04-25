
-- WHILE��

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


-- Ż�⹮
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


-- FOR��
DECLARE
    V_NUM number := 3;
BEGIN

    FOR i IN 1..9 -- .�� �� �� �ۼ��ؼ� ������ ǥ��.
    LOOP
        CONTINUE WHEN i = 5;
        dbms_output.put_line(v_num || 'x' || i || '=' || v_num*i);
    END LOOP;


END;

-- 1. ��� �������� ����ϴ� �͸� ����� ���弼��. (2 ~ 9��)
    
BEGIN
    FOR dan IN 2..9
    LOOP
        dbms_output.put_line('������: ' || dan || '��');
    FOR hang IN 1..9 -- .�� �� �� �ۼ��ؼ� ������ ǥ��.
    LOOP
          dbms_output.put_line(dan || 'x' || hang || '=' ||dan*hang);
        END LOOP;
        dbms_output.put_line('-----------------------------------');
        
    END LOOP;


END;

-- 2. INSERT�� 300�� �����ϴ� �͸� ����� ó���ϼ���.
-- board��� �̸��� ���̺��� ���弼��. (bno, writer, title �÷��� �����մϴ�.)
-- bno�� SEQUENcE�� �÷� �ֽð�, writer�� title�� ��ȣ�� �ٿ��� INSERT ������ �ּ���.
-- ex) 1, test1, title1 -> 2 test2 title2 -> 3 test3 title

CREATE TABLE board (
    bno number primary key,
    writer varchar2(50),
    title varchar2(50)
    );
    
    
CREATE SEQUENCE b_seq 
    START WITH 1 -- ���۰� (�⺻���� ������ �� �ּҰ�, ������ �� �ִ밪)
    INCREMENT BY 1 -- ������ (����� ����, ������ ����, �⺻�� 1)
    MAXVALUE 300 -- �ִ밪(�⺻���� ���� 1027, ������ �� -1)
    NOCACHE -- ĳ�ø޸� ��� ���� (CACHE) 
    NOCYCLE; -- ��ȯ ���� (NOCYCLE�� �⺻, ��ȯ��Ű���� CYCLE);

begin
 for i in 1..300
 loop
 insert INTO board values(b_seq.nextval, concat('test', b_seq.nextval), concat('title', b_seq.nextval));

end loop;
commit;
end;

select * from board
ORDER BY bno DESC;
