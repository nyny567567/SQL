표를 분해했을 때 얻는 장점.
1. 특정 인물의 job을 단순 하나만 수정하더라도 info 테이블의 모든 행에서 바뀐 직업을 참조할 수 있다.
2. info에 데이터가 존재하지 않더라도 auth 테이블에는 존재할 수 있다.
3. 동명이인 등록이 가능하다. (이름이 같아도 다른 job을 얼마든지 지정할 수 있다.

위에 있는 테이블보다 밑에 데이터를 쪼갠 테이블이 훨씬 더 보기도 좋고, 효율성도 뛰어날 것입니다.
이렇게 표를 분리해서 효율적으로 사용할 수 있도록 제작한 후, 보기 편하게 하나로 합쳐서 조회하는 것을
JOIN이라고 합니다.

INNER JOIN
오라클 sql: SELECT * FROM info, auth WHERE info.auth_id = auth.auth_id;
ANSI sql: SELECT * FROM info INNER JOIN auth ON info.auth_id = auth.auth_id;

두 테이블에 공통된 데이터만 JOIN되어서 조회.


LEFT OUTER JOIN
오라클 sql: SELECT * FROM info, auth WHERE info_id = auth.auth_id(+);
ANSI sql: SELEct * FROM info LEFT OUTER JOIN auth ON info.auth_id = auth.auth

왼쪽을 기준으로 왼쪽은 전부 다 조회. 공통된 데이터가 없는 경우 null 처리.

RIGHT OUTER JOIN
오라클 sql: SELECT * FROM info, auth WHERE info_id = auth.auth_id;
ANSI sql: SELECT * FROM info RIGHT OUTER JOIN auth ON info.auth_id = auth.auth_id; 


오른쪽을 기준으로 오른쪽 테이블은 전부 출력, 없는 경우 null 처리.

FULL OUTER JOIN
SELECT * FROM info FULL OUTER JOIN auth ON info.auth_id = auth.auth_id;
양쪽을 기준으로 모든 행이 붙어서 출력.

CROSS JOIN
SELECT * FROM info CROSS JOIN auth;

CROSS JOIN: 조인 대상이 되는 테이블 한 행마다 모든 데이터가 조인되어 조회.
조인 조건이 존재하지 않으며 테이블의 존재하는 행의 개수를 곱한 만큼의 결과값이 반환.
-> 카테시안 곱 (카티션 프로덕트)
의미가 없는 데이터가 조회되고, 그 양이 너무 방대하기 때문에 거의 사용하지 않는 조인.

SELF JOIN
동일 테이블 사이의 조인을 말합니다.

