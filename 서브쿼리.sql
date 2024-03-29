/* 서브쿼리*/
USE PRACTICE;

/* SELECT 절 서브쿼리*/
SELECT *, (SELECT GENDER FROM CUSTOMER WHERE A.MEM_NO = MEM_NO) AS GENDER
FROM SALES AS A;
/* 테이블 결합에 비해 처리 속도가 늦음 */

/* FROM 절 안에 서브쿼리*/
SELECT *
FROM (
	SELECT MEM_NO, COUNT(ORDER_NO) AS 구매횟수
    FROM SALES
    GROUP BY MEM_NO) AS A;
    
    /* WHERE 절 서브쿼리*/
SELECT COUNT(ORDER_NO) AS 주문횟수
FROM SALES
WHERE MEM_NO IN (SELECT MEM_NO FROM CUSTOMER WHERRE WHERE YEAR(JOIN_DATE) =2019);
/*위 코드와 같은 내용 */
SELECT COUNT(ORDER_NO) AS 주문횟수
FROM SALES AS S
INNER JOIN CUSTOMER AS C
ON S.MEM_NO = C.MEM_NO
WHERE YEAR(C.JOIN_DATE) = 2019;
	
/* 서브쿼리 + 테이블 결합 */
