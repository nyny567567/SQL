ǥ�� �������� �� ��� ����.
1. Ư�� �ι��� job�� �ܼ� �ϳ��� �����ϴ��� info ���̺��� ��� �࿡�� �ٲ� ������ ������ �� �ִ�.
2. info�� �����Ͱ� �������� �ʴ��� auth ���̺��� ������ �� �ִ�.
3. �������� ����� �����ϴ�. (�̸��� ���Ƶ� �ٸ� job�� �󸶵��� ������ �� �ִ�.

���� �ִ� ���̺��� �ؿ� �����͸� �ɰ� ���̺��� �ξ� �� ���⵵ ����, ȿ������ �پ ���Դϴ�.
�̷��� ǥ�� �и��ؼ� ȿ�������� ����� �� �ֵ��� ������ ��, ���� ���ϰ� �ϳ��� ���ļ� ��ȸ�ϴ� ����
JOIN�̶�� �մϴ�.

INNER JOIN
����Ŭ sql: SELECT * FROM info, auth WHERE info.auth_id = auth.auth_id;
ANSI sql: SELECT * FROM info INNER JOIN auth ON info.auth_id = auth.auth_id;

�� ���̺� ����� �����͸� JOIN�Ǿ ��ȸ.


LEFT OUTER JOIN
����Ŭ sql: SELECT * FROM info, auth WHERE info_id = auth.auth_id(+);
ANSI sql: SELEct * FROM info LEFT OUTER JOIN auth ON info.auth_id = auth.auth

������ �������� ������ ���� �� ��ȸ. ����� �����Ͱ� ���� ��� null ó��.

RIGHT OUTER JOIN
����Ŭ sql: SELECT * FROM info, auth WHERE info_id = auth.auth_id;
ANSI sql: SELECT * FROM info RIGHT OUTER JOIN auth ON info.auth_id = auth.auth_id; 


�������� �������� ������ ���̺��� ���� ���, ���� ��� null ó��.

FULL OUTER JOIN
SELECT * FROM info FULL OUTER JOIN auth ON info.auth_id = auth.auth_id;
������ �������� ��� ���� �پ ���.

CROSS JOIN
SELECT * FROM info CROSS JOIN auth;

CROSS JOIN: ���� ����� �Ǵ� ���̺� �� �ึ�� ��� �����Ͱ� ���εǾ� ��ȸ.
���� ������ �������� ������ ���̺��� �����ϴ� ���� ������ ���� ��ŭ�� ������� ��ȯ.
-> ī�׽þ� �� (īƼ�� ���δ�Ʈ)
�ǹ̰� ���� �����Ͱ� ��ȸ�ǰ�, �� ���� �ʹ� ����ϱ� ������ ���� ������� �ʴ� ����.

SELF JOIN
���� ���̺� ������ ������ ���մϴ�.

