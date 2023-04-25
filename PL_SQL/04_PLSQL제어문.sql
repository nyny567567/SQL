
-- IF��
DECLARE
    v_num1 NUMBER := 10;
    v_num2 NUMBER := 5;
BEGIN
    IF
        v_num1 >= v_num2
    THEN
        dbms_output.put_line(v_num1 || '��(��) ū ��');
    ELSE
        dbms_output.put_line(v_num2 || '��(��) ū ��');
    END IF;

END;


--ELSIF
DECLARE
    v_salary NUMBER := 0;
    v_department_id NUMBER := 0;
BEGIN
    v_department_id := ROUND(DBMS__RANDOM.VALUE(10, 120), -1);
    
    SELECT
        salary
    INTO
        v-salary
    FROM employees
    WHERE department_id = v_department_id
    AND ROWNUM = 1; -- ù° ���� ���ؼ� ������ �����ϱ� ����.
    
    dbms_output.put_line(v_salary);

    IF v_salary <= 5000 THEN
        dbms_output.put_line('����');
    ELSIF v_salary <=9000 THEN
        dbms_output.put_line('�߰�');
    ELSE
        dbms_output.put_line('����');
    END IF;

END;

--CASE��
DECLARE
    v_salary NUMBER := 0;
    v_department_id NUMBER := 0;
BEGIN
    v_department_id := ROUND(DBMS__RANDOM.VALUE(10, 120), -1);
    
    SELECT
        salary
    INTO
        v-salary
    FROM employees
    WHERE department_id = v_department_id
    AND ROWNUM = 1; -- ù° ���� ���ؼ� ������ �����ϱ� ����.
    
    dbms_output.put_line(v_salary);
    CASE
    WHEN v_salary <= 5000 THEN
        dbms_output.put_line('����');
    ELSIF v_salary <=9000 THEN
        dbms_output.put_line('�߰�');
    ELSE
        dbms_output.put_line('����');
    END IF;

END;

-- ��ø if��
del


