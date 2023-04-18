/*
���� 1.
-EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� �����͸� ��� �ϼ��� ( AVG(�÷�) ���)
-EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� ���� ����ϼ���
-EMPLOYEES ���̺��� job_id�� IT_PFOG�� ������� ��ձ޿����� ���� ������� �����͸� ����ϼ���
*/
SELECT *
FROM employees
where salary >(select avg(salary) from employees);

SELECT COUNT(*)
FROM employees
where salary > (select avg(salary) from employees);

SELECT *
FROM employees
where salary > (select avg(salary) from employees where job_id='IT_PROG');

/*
���� 2.
-DEPARTMENTS���̺��� manager_id�� 100�� ����� department_id��
EMPLOYEES���̺��� department_id�� ��ġ�ϴ� ��� ����� ������ �˻��ϼ���.
*/
SELECT *
FROM employees
where department_id IN (SELECT department_id FROM departments where manager_id='100');

/*
���� 3.
-EMPLOYEES���̺��� ��Pat���� manager_id���� ���� manager_id�� ���� ��� ����� �����͸� ����ϼ���
-EMPLOYEES���̺��� ��James��(2��)���� manager_id�� ���� ��� ����� �����͸� ����ϼ���.
*/
SELECT *
FROM employees
where manager_id > (SELECT manager_id from employees where first_name = 'Pat');

SELECT *
FROM employees
where manager_id IN (SELECT manager_id from employees where first_name ='James');

/*
���� 4.
-EMPLOYEES���̺� ���� first_name�������� �������� �����ϰ�, 41~50��° �������� �� ��ȣ, �̸��� ����ϼ���
*/
select rn, first_name
from
(select rownum as rn, first_name
from
(SELECT *
FROM employees 
order by first_name desc))
where rn between 41 and 50;

/*
���� 5.
-EMPLOYEES���̺��� hire_date�������� �������� �����ϰ�, 31~40��° �������� �� ��ȣ, ���id, �̸�, ��ȣ, 
�Ի����� ����ϼ���.
*/
select *
from
(select rownum as rn, employee_id, first_name, phone_number, hire_date
from 
(select rownum, employee_id, first_name, phone_number, hire_date
from employees
order by hire_date asc))
where rn between 31 and 40;

/*
���� 6.
employees���̺� departments���̺��� left �����ϼ���
����) �������̵�, �̸�(��, �̸�), �μ����̵�, �μ��� �� ����մϴ�.
����) �������̵� ���� �������� ����
*/
select e.employee_id, e.first_name||' '||e.last_name as name, e.department_id, d.department_name
from employees e
left outer join departments d
on e.department_id = d.department_id
order by employee_id asc;

/*
���� 7.
���� 6�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
*/
select employee_id, first_name||' '||last_name as name, department_id,
(select d.department_name
from departments d
where e.department_id = d.department_id) department_name
from employees e
order by employee_id;

/*
���� 8.
departments���̺� locations���̺��� left �����ϼ���
����) �μ����̵�, �μ��̸�, �Ŵ������̵�, �����̼Ǿ��̵�, ��Ʈ��_��巹��, ����Ʈ �ڵ�, ��Ƽ �� ����մϴ�
����) �μ����̵� ���� �������� ����
*/
select d.department_id, d.department_name, d.manager_id, d.location_id, l.street_address, l.postal_code, l.city
from departments d
left outer join locations l
on d.location_id = l.location_id
order by d.department_id asc;

/*
���� 9.
���� 8�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
*/
select department_id, department_name, manager_id, location_id, 
(select street_address
from locations l where d.location_id = l.location_id)street_address, 
(select postal_code
from locations l where d.location_id = l.location_id)postal_code,
(select city
from locations l where d.location_id = l.location_id)city
from departments d
order by department_id asc; 

/*
���� 10.
locations���̺� countries ���̺��� left �����ϼ���
����) �����̼Ǿ��̵�, �ּ�, ��Ƽ, country_id, country_name �� ����մϴ�
����) country_name���� �������� ����
*/
SELECT l.location_id, l.street_address, l.city, l.country_id, c.country_name
from locations l
left outer join countries c
on l.country_id =  c.country_id
order by country_name asc;

/*
���� 11.
���� 10�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
*/
SELECT location_id, street_address, city, country_id, 
(select country_name
from countries c
where c.country_id = l.country_id) country_name
from locations l
order by country_name asc;

/*
���� 12. 
employees���̺�, departments���̺��� left���� hire_date�� �������� �������� 1-10��° �����͸� ����մϴ�
����) rownum�� �����Ͽ� ��ȣ, �������̵�, �̸�, ��ȭ��ȣ, �Ի���, �μ����̵�, �μ��̸� �� ����մϴ�.
����) hire_date�� �������� �������� ���� �Ǿ�� �մϴ�. rownum�� Ʋ������ �ȵ˴ϴ�.
*/
select *
from (select rownum, e.employee_id, e.first_name, e.phone_number, e.hire_date, e.department_id, d.department_name
from employees e
left outer join departments d
on e.department_id = d.department_id
order by hire_date asc)
where rownum between 1 and 10;

/*
���� 13. 
--EMPLOYEES �� DEPARTMENTS ���̺��� JOB_ID�� SA_MAN ����� ������ LAST_NAME, JOB_ID, 
DEPARTMENT_ID,DEPARTMENT_NAME�� ����ϼ���.
*/
select e.last_name, e.job_id, e.department_id, d.department_name
from employees e
join departments d
on e.department_id = d.department_id
where e.job_id='SA_MAN';

/*
���� 14
--DEPARTMENT���̺��� �� �μ��� ID, NAME, MANAGER_ID�� �μ��� ���� �ο����� ����ϼ���.
--�ο��� ���� �������� �����ϼ���.
--����� ���� �μ��� ������� ���� �ʽ��ϴ�.
*/
select department_id, department_name, manager_id,
(select count(*)
from employees e
group by department_id) count(*) --??????
from departments d
where employee_id is not null;

/*
���� 15
--�μ��� ���� ���� ���ο�, �ּ�, �����ȣ, �μ��� ��� ������ ���ؼ� ����ϼ���.
--�μ��� ����� ������ 0���� ����ϼ���.
���� 16
-���� 15 ����� ���� DEPARTMENT_ID�������� �������� �����ؼ� ROWNUM�� �ٿ� 1-10������ ������
����ϼ���.