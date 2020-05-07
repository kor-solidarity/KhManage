-- 오라클 CROSS JOIN
SELECT * FROM emp, dept;

-- ANSI CROSS JOIN
SELECT * FROM emp
CROSS JOIN dept;

-- NATURAL JOIN
SELECT * FROM emp
NATURAL JOIN dept  --랜덤으로 같은 조건을 찾아서 합쳐줌(join시켜줌). 쓰지말자.
ORDER BY deptno;

-- INNER JOIN을 이용한 NATURAL JOIN
SELECT * FROM emp
JOIN dept USING(deptno);  -- 쓰지말자.눈에 보이고 단순한 코드를 쓰자.

-- 서브쿼리
SELECT deptno FROM emp
WHERE ename=UPPER('king');

SELECT * FROM dept
WHERE deptno=10;

-- 위 두 결과를 합치는 방법중 하나.(조인으로도 할 수 있겠지?)
SELECT * FROM dept
WHERE deptno = (    --()속이 서브쿼리, 그밖이 메인 쿼리.
    SELECT deptno FROM emp
    WHERE ename=UPPER('king')
);

-- 위에서 한것을 조인으로 해결한것
SELECT D.*
FROM dept D, emp E
WHERE D.deptno = E.deptno --조인 조건
    AND ename = UPPER('king'); --조회조건
    

--평균 임금보다 급여를 많이 받는 사원들
SELECT avg(sal) FROM emp;

SELECT *
FROM emp
WHERE sal > (
    SELECT avg(sal) 
    FROM emp
)
ORDER BY sal;


--SELECT avg(sal)
--FROM emp;

--SELECT avg(sal)
--FROM emp
--WHERE avg(sal)>2000;

--SELECT avg(sal)
--FROM emp
--GROUP BY empno
--HAVING avg(sal)>2000; --조건에서의 avg과 같은 그룹함수는 항상 그룹화 되어있어야한다. SELECT는 상관없음.


-- 가장 최근에 입사한 사원
SELECT empno, ename, hiredate FROM emp
WHERE hiredate = (
    SELECT max(hiredate)
    FROM emp
);

--QUIZ
-- 전체 평균 임금보다 부서 별 평균임금이 높은 부서
-- COLUMN
-- deptno-부서번호, avg_sal- 부서별평균임금
-- 10 2916.67
-- 20 2258.33
SELECT deptno, ROUND(avg(sal),2) avg_sal
FROM emp
GROUP BY deptno
HAVING avg(sal) > (
    SELECT avg(sal) FROM emp
)
ORDER BY deptno;


-- 위 결과를 테이블에 넣고 다시 조회하기. 이것을 인라인 뷰라한다.
SELECT AVG_SAL.deptno, dname, avg_sal FROM (
    SELECT deptno, ROUND(avg(sal),2) avg_sal
    FROM emp
    GROUP BY deptno
    HAVING avg(sal) > (
        SELECT avg(sal) FROM emp
    )
    ORDER BY deptno
) AVG_SAL
JOIN dept
    ON AVG_SAL.deptno = dept.deptno;
    
    
-- 인라인 뷰
SELECT A FROM (
    SELECT empno A FROM emp) empTB
WHERE empTB.A = 7369;


--스칼라 서브쿼리. 이녀석이 인라인뷰보다 좋다
SELECT 
    deptno,
    ( SELECT dname FROM dept D
        WHERE D.deptno = E.deptno) dname,
    ROUND(avg(sal),2) avg_sal
FROM emp E
GROUP BY deptno
HAVING avg(sal) > (
    SELECT avg(sal) FROM emp
)
ORDER BY deptno;


--QUIZ
--스칼라 서브쿼리를 이용하여
--empno, ename, deptno, dname, loc조회하기
SELECT empno, ename, deptno,
    (SELECT dname FROM dept D 
        WHERE E.deptno=D.deptno) dname,
    (SELECT loc FROM dept D 
        WHERE E.deptno=D.deptno) loc
FROM emp E
ORDER BY deptno;


-- 서브쿼리를 ORDER BY 절에서 사용하기
UPDATE dept
SET dname = 'ZACCOUNT'
WHERE deptno= 10; --10번부서 이름 변경
commit;

SELECT * FROM dept;--확인

SELECT empno, ename, sal, deptno
FROM emp E
ORDER BY 
    (SELECT dname FROM dept D
    WHERE E.deptno=D.deptno);

--QUIZ
--부서별 인원 구하기
-- 40번 부서는 0명이라고 출력
-- 서브쿼리 활용, 조인활용 (두개 쿼리 작성)
-- deptno, dname, cnt_employee


--서브쿼리활용
SELECT deptno, dname, ( SELECT COUNT(*) FROM emp e 
                        WHERE e.deptno = d.deptno) cnt_employee
FROM dept d;


--조인활용
SELECT D.deptno,dname, count(E.deptno) FROM dept D, emp E
WHERE D.deptno = E.deptno(+)
GROUP BY D.deptno,dname
ORDER BY D.deptno;


-- rownum 컬럼
SELECT rownum, emp.* FROM emp; --동작이 emp한줄씩 읽으면서 rownum을 다른테이블에 하나씩 만들고, 나중에 다 끝나면 두 테이블을 합친다.

--위의 것은 아래의 것이 합쳐진것이다.
SELECT rownum FROM emp; 
SELECT * FROM emp;


SELECT rownum, E.* FROM(
    SELECT * FROM emp
) E;

-- 잘못된 경우
-- ORDER BY를 마지막에 수행하므로
-- rownum으로 행번호가 붙은 이후에 정렬을 하게 된다
--  -> 정렬된 상태의 행번호를 확인할 수 없다
SELECT rownum, emp.* FROM emp
ORDER BY ename;


-- 잘못된 처리
-- FROM절과 WHERE를 수행하며 ROWNUM이 추가된다
-- ROWNUM은 조회된 결과의 첫 행을 읽으며 1부터
-- 순차적으로 행번호를 붙인다
-- 하지만, WHERE절의 조건이 1이 아닌 중간값부터
-- 만족한다면 1로 매겨진 rownum이 없어 중간값을 
-- 찾을수 없게 된다
SELECT rownum, E.* FROM(
    SELECT * FROM emp
    ORDER BY ename
) E
WHERE rownum between 3 and 5; 

SELECT * FROM(
    SELECT rownum rnum, E.* FROM(
        SELECT * FROM emp
        ORDER BY ename
    )E
)R
WHERE rnum between 3 and 5;


-- top-n 쿼리

-- QUIZ
-- comm을 가장 많이 받는 TOP2를 조회
-- COLUMS : comm_top, emp.*
-- MARTIN, WARD
SELECT * FROM(
    SELECT rownum rnum, E.* FROM(
        SELECT * FROM emp
        ORDER BY comm desc  NULLS LAST -- 순위매기기
    )E
    ORDER BY rownum  --DESC --결과 정렬하기
)R
WHERE rnum between 1 and 2; --결과값 선택





