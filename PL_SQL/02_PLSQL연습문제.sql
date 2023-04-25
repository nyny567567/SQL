
-- 1. ������ �� 3���� ����ϴ� �͸� ����� ����� ����. (��¹� 9���� �����ؼ� ������)

BEGIN
    dbms_output.put_line('3 x 1 = ' || 3*1);
    dbms_output.put_line('3 x 2 = ' || 3*2);
    dbms_output.put_line('3 x 3 = ' || 3*3);
    dbms_output.put_line('3 x 4 = ' || 3*4);
    dbms_output.put_line('3 x 5 = ' || 3*5);
    dbms_output.put_line('3 x 6 = ' || 3*6);
    dbms_output.put_line('3 x 7 = ' || 3*7);
    dbms_output.put_line('3 x 8 = ' || 3*8);
    dbms_output.put_line('3 x 9 = ' || 3*9);
END;

-- 2. employees ���̺��� 201�� ����� �̸��� �̸��� �ּҸ� ����ϴ�
-- �͸����� ����� ����. (������ ��Ƽ� ����ϼ���.)
DECLARE
    v_emp_name employees.first_name%TYPE;
    v_emp_email employees.email%TYPE;
BEGIN
    SELECT
        first_name, email
    INTO
        v_emp_name, v_emp_email
    FROM employees
    WHERE employee_id = 201;

    dbms_output.put_line(v_emp_name || ': ' || v_emp_email);
END;


-- 3. employees ���̺��� �����ȣ�� ���� ū ����� ã�Ƴ� �� (MAX �Լ� ���)
-- �� ��ȣ + 1������ �Ʒ��� ����� emps ���̺�
-- employee_id, last_name, email, hire_date, job_id�� �ű� �����ϴ� �͸� ����� ���弼��.
-- SELECT�� ���Ŀ� INSERT�� ����� �����մϴ�.
/*
<�����>: steven
<�̸���>: stevenjobs
<�Ի�����>: ���ó�¥
<JOB_ID>: CEO
*/
DROP TABLE emps;
CREATE TABLE emps AS (SELECT * FROM employees WHERE 1=2);

DECLARE
    v_max_empno employees.employee_id%TYPE;
BEGIN
    
    SELECT
        MAX(employee_id)
    INTO
        v_max_empno
    FROM employees;
    
    INSERT INTO emps
        (employee_id, last_name, email, hire_date, job_id)
    VALUES
        (v_max_empno + 1, 'steven', 'stevenjobs', sysdate, 'CEO');
    
    COMMIT;
    
END;

SELECT * FROM emps;

