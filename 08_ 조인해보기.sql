
/*
# �����̶�?
- ���� �ٸ� ���̺��� ������ ���谡 �����Ͽ�
1�� �̻��� ���̺��� �����͸� ��ȸ�ϱ� ���� ����մϴ�.

SELECT �÷�����Ʈ FROM ���� ����� �Ǵ� ���̺� (1�� �̻�)
WHERE ���� ���� -> ����Ŭ ���� 
*/

-- employees ���̺��� �μ� id�� ��ġ�ϴ� departments ���̺��� �μ� id�� ã�Ƽ�
-- SELECT ���Ͽ� �ִ� �÷����� ����ϴ� ������.
SELECT
    first_name, last_name, hire_date,
    salary, job_id, e.department_id, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;