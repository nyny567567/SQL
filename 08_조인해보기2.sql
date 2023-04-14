
-- �̳�(����) ����
SELECT
    *
FROM info i
INNER JOIN auth a
ON i.auth_id = a.auth_id;

-- ����Ŭ ���� (�� ��� ���մϴ�.)
SELECT
    *
FROM info i, auth a
WHERE i.auth_id = a.auth_id;

-- auth_id �÷��� �׳� ���� ��ȣ�ϴ� ��� ��ϴ�.
-- �� ������ ���� ���̺� ��� �����ϱ� �����Դϴ�.
-- �̷� ����, �÷��� ���̺� �̸��� ���̴���, ��Ī�� ���ż�
-- Ȯ���ϰ� ������ ���ּ���.
SELECT
    auth.auth_id, info.title, info.content, auth.name
FROM info
INNER JOIN auth
ON info.auth_id = auth.auth_id;















