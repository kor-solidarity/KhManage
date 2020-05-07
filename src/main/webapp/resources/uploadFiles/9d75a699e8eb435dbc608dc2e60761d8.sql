-- ����Ŭ CROSS JOIN
SELECT * FROM emp, dept;

-- ANSI CROSS JOIN
SELECT * FROM emp
CROSS JOIN dept;

-- NATURAL JOIN
SELECT * FROM emp
NATURAL JOIN dept  --�������� ���� ������ ã�Ƽ� ������(join������). ��������.
ORDER BY deptno;

-- INNER JOIN�� �̿��� NATURAL JOIN
SELECT * FROM emp
JOIN dept USING(deptno);  -- ��������.���� ���̰� �ܼ��� �ڵ带 ����.

-- ��������
SELECT deptno FROM emp
WHERE ename=UPPER('king');

SELECT * FROM dept
WHERE deptno=10;

-- �� �� ����� ��ġ�� ����� �ϳ�.(�������ε� �� �� �ְ���?)
SELECT * FROM dept
WHERE deptno = (    --()���� ��������, �׹��� ���� ����.
    SELECT deptno FROM emp
    WHERE ename=UPPER('king')
);

-- ������ �Ѱ��� �������� �ذ��Ѱ�
SELECT D.*
FROM dept D, emp E
WHERE D.deptno = E.deptno --���� ����
    AND ename = UPPER('king'); --��ȸ����
    

--��� �ӱݺ��� �޿��� ���� �޴� �����
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
--HAVING avg(sal)>2000; --���ǿ����� avg�� ���� �׷��Լ��� �׻� �׷�ȭ �Ǿ��־���Ѵ�. SELECT�� �������.


-- ���� �ֱٿ� �Ի��� ���
SELECT empno, ename, hiredate FROM emp
WHERE hiredate = (
    SELECT max(hiredate)
    FROM emp
);

--QUIZ
-- ��ü ��� �ӱݺ��� �μ� �� ����ӱ��� ���� �μ�
-- COLUMN
-- deptno-�μ���ȣ, avg_sal- �μ�������ӱ�
-- 10 2916.67
-- 20 2258.33
SELECT deptno, ROUND(avg(sal),2) avg_sal
FROM emp
GROUP BY deptno
HAVING avg(sal) > (
    SELECT avg(sal) FROM emp
)
ORDER BY deptno;


-- �� ����� ���̺� �ְ� �ٽ� ��ȸ�ϱ�. �̰��� �ζ��� ����Ѵ�.
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
    
    
-- �ζ��� ��
SELECT A FROM (
    SELECT empno A FROM emp) empTB
WHERE empTB.A = 7369;


--��Į�� ��������. �̳༮�� �ζ��κ亸�� ����
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
--��Į�� ���������� �̿��Ͽ�
--empno, ename, deptno, dname, loc��ȸ�ϱ�
SELECT empno, ename, deptno,
    (SELECT dname FROM dept D 
        WHERE E.deptno=D.deptno) dname,
    (SELECT loc FROM dept D 
        WHERE E.deptno=D.deptno) loc
FROM emp E
ORDER BY deptno;


-- ���������� ORDER BY ������ ����ϱ�
UPDATE dept
SET dname = 'ZACCOUNT'
WHERE deptno= 10; --10���μ� �̸� ����
commit;

SELECT * FROM dept;--Ȯ��

SELECT empno, ename, sal, deptno
FROM emp E
ORDER BY 
    (SELECT dname FROM dept D
    WHERE E.deptno=D.deptno);

--QUIZ
--�μ��� �ο� ���ϱ�
-- 40�� �μ��� 0���̶�� ���
-- �������� Ȱ��, ����Ȱ�� (�ΰ� ���� �ۼ�)
-- deptno, dname, cnt_employee


--��������Ȱ��
SELECT deptno, dname, ( SELECT COUNT(*) FROM emp e 
                        WHERE e.deptno = d.deptno) cnt_employee
FROM dept d;


--����Ȱ��
SELECT D.deptno,dname, count(E.deptno) FROM dept D, emp E
WHERE D.deptno = E.deptno(+)
GROUP BY D.deptno,dname
ORDER BY D.deptno;


-- rownum �÷�
SELECT rownum, emp.* FROM emp; --������ emp���پ� �����鼭 rownum�� �ٸ����̺� �ϳ��� �����, ���߿� �� ������ �� ���̺��� ��ģ��.

--���� ���� �Ʒ��� ���� ���������̴�.
SELECT rownum FROM emp; 
SELECT * FROM emp;


SELECT rownum, E.* FROM(
    SELECT * FROM emp
) E;

-- �߸��� ���
-- ORDER BY�� �������� �����ϹǷ�
-- rownum���� ���ȣ�� ���� ���Ŀ� ������ �ϰ� �ȴ�
--  -> ���ĵ� ������ ���ȣ�� Ȯ���� �� ����
SELECT rownum, emp.* FROM emp
ORDER BY ename;


-- �߸��� ó��
-- FROM���� WHERE�� �����ϸ� ROWNUM�� �߰��ȴ�
-- ROWNUM�� ��ȸ�� ����� ù ���� ������ 1����
-- ���������� ���ȣ�� ���δ�
-- ������, WHERE���� ������ 1�� �ƴ� �߰�������
-- �����Ѵٸ� 1�� �Ű��� rownum�� ���� �߰����� 
-- ã���� ���� �ȴ�
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


-- top-n ����

-- QUIZ
-- comm�� ���� ���� �޴� TOP2�� ��ȸ
-- COLUMS : comm_top, emp.*
-- MARTIN, WARD
SELECT * FROM(
    SELECT rownum rnum, E.* FROM(
        SELECT * FROM emp
        ORDER BY comm desc  NULLS LAST -- �����ű��
    )E
    ORDER BY rownum  --DESC --��� �����ϱ�
)R
WHERE rnum between 1 and 2; --����� ����





