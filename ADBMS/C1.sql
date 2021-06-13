
									#SET-1
                                    
#1.	Create an employee  table ‘EMP’ 

CREATE SCHEMA `20MCA012`;
SHOW databases;
USE 20MCA012;
CREATE TABLE EMP(EMPNO INT,ENAME VARCHAR(25),JOB VARCHAR(12),SALARY INT,COMMISSION INT,DEPTNO INT);
SELECT * FROM EMP;

#2.	Display the structure of ‘EMP’

DESC EMP;

#3.	Insert the following record into ‘EMP’

INSERT INTO EMP(EMPNO,ENAME,JOB,SALARY,DEPTNO)VALUES('7369','SMITH','CLERK','800','20');

#4.	Insert the rest of records using substitution variable.

INSERT INTO EMP(EMPNO,ENAME,JOB,SALARY,COMMISSION,DEPTNO)VALUES('7499','ALLEN','SALESMAN','1600','300','30');
INSERT INTO EMP(EMPNO,ENAME,JOB,SALARY,COMMISSION,DEPTNO)VALUES('7521','WARD','SALESMAN','1250','500','30');
INSERT INTO EMP(EMPNO,ENAME,JOB,SALARY,DEPTNO)VALUES('7566','JONES','MANGER','2975','20');
INSERT INTO EMP(EMPNO,ENAME,JOB,SALARY,COMMISSION,DEPTNO)VALUES('7654','MARTIN','SALESMAN','1250','1400','30');
INSERT INTO EMP(EMPNO,ENAME,JOB,SALARY,DEPTNO)VALUES('7698','BLAKE','MANGER','2850','30');
INSERT INTO EMP(EMPNO,ENAME,JOB,SALARY,DEPTNO)VALUES('7782','CLARK','MANGER','2450','10');
INSERT INTO EMP(EMPNO,ENAME,JOB,SALARY,DEPTNO)VALUES('7788','SCOTT','ANALYST','3000','20');
INSERT INTO EMP(EMPNO,ENAME,JOB,SALARY,DEPTNO)VALUES('7839','KING','PRESIDENT','5000','10');
INSERT INTO EMP(EMPNO,ENAME,JOB,SALARY,DEPTNO)VALUES('7844','TURNER','SALESMAN','1500','30');
INSERT INTO EMP(EMPNO,ENAME,JOB,SALARY,DEPTNO)VALUES('7876','ADAMS','CLERK','1100','20');
INSERT INTO EMP(EMPNO,ENAME,JOB,SALARY,DEPTNO)VALUES('7900','JAMES','NULL','950','30');
INSERT INTO EMP(EMPNO,ENAME,JOB,SALARY,DEPTNO)VALUES('7902','FORD','ANALYST','3000','20');
INSERT INTO EMP(EMPNO,ENAME,JOB,SALARY,DEPTNO)VALUES('7934','MILLER','CLERK','1300','10');

#5.	Insert job  as ‘CLERK’ for all ‘NULL’ job types.

UPDATE EMP SET JOB='CLERK' WHERE JOB='NULL';
SELECT * FROM EMP;

#6.	Add a new field  ‘date_join’ with following values

ALTER TABLE EMP ADD DATE_JOIN VARCHAR(20);
UPDATE EMP SET DATE_JOIN='17-DEC-80' WHERE EMPNO='7369';
UPDATE EMP SET DATE_JOIN='20-FEB-81' WHERE EMPNO='7499';
UPDATE EMP SET DATE_JOIN='22-FEB-81' WHERE EMPNO='7521';
UPDATE EMP SET DATE_JOIN='02-APR-81' WHERE EMPNO='7566';
UPDATE EMP SET DATE_JOIN='28-SEP-81' WHERE EMPNO='7654';
UPDATE EMP SET DATE_JOIN='01-MAY-81' WHERE EMPNO='7698';
UPDATE EMP SET DATE_JOIN='09-JUN-81' WHERE EMPNO='7782';
UPDATE EMP SET DATE_JOIN='19-APR-87' WHERE EMPNO='7788';
UPDATE EMP SET DATE_JOIN='17-NOV-81' WHERE EMPNO='7839';
UPDATE EMP SET DATE_JOIN='08-SEP-81' WHERE EMPNO='7844';
UPDATE EMP SET DATE_JOIN='23-MAY-87' WHERE EMPNO='7876';
UPDATE EMP SET DATE_JOIN='03-DEC-81' WHERE EMPNO='7900';
UPDATE EMP SET DATE_JOIN='03-DEC-81' WHERE EMPNO='7902';
UPDATE EMP SET DATE_JOIN='23-JAN-82' WHERE EMPNO='7934';
SELECT * FROM EMP;

#7.	Display details of all employees.

SELECT * FROM EMP ORDER BY EMPNO;

#8.	Display all the distinct job types in ‘EMP’.

SELECT  DISTINCT JOB FROM EMP;

#9.	Display names of all employees in dept 20 and 30

SELECT ENAME FROM EMP WHERE DEPTNO IN(20,30);

#10.	List name and Total of salary i.e sal+commission

SELECT ENAME,SALARY+IFNULL(COMMISSION,0) FROM EMP;

#11.	List name and Annual Salary i.e sal*12

SELECT ENAME,SALARY*12 FROM EMP;

#12.	List the employee who joined in the date ‘03-DEC-81’

SELECT ENAME FROM EMP WHERE DATE_JOIN='03-DEC-81';

#13.	Display the total salary of ‘Miller’

SELECT SALARY+IFNULL(COMMISSION,0) FROM EMP WHERE ENAME='MILLER';	

#14.	Delete the employee ‘Miller’ from’EMP’

DELETE FROM EMP WHERE ENAME='MILLER';
SELECT * FROM EMP;

#15.	Display name and deptno of all employees.

SELECT ENAME,DEPTNO FROM EMP;

#16.	Remove the field ‘commission’ fom’EMP’ after updating salary with total salary, i.e sal+commission

ALTER TABLE EMP ADD TOTALSALARY INT;
UPDATE  EMP SET TOTALSALARY=SALARY+IFNULL(COMMISSION,0);
ALTER TABLE EMP DROP COLUMN COMMISSION;
SELECT * FROM EMP;

#17.	Display the name of employees having the same amount of salary ( don’t use subqueries)

SELECT A.ENAME,A.SALARY FROM EMP  A INNER JOIN EMP B ON A.SALARY = B.SALARY AND A.ENAME != B.ENAME;

#18.	 Display the name and employee no as ‘name’ and ‘emp_id’

SELECT EMPNO AS 'emp_id',ENAME AS 'name' FROM EMP;

#19.	Rename table ‘EMP’ to ‘EMPLOYEE’

RENAME TABLE EMP TO EMPLOYEE;
DESC EMPLOYEE;

#20.	Create a new table ‘EMP_TAB’ from table ‘EMPLOYEE’

CREATE TABLE EMP_TAB AS SELECT * FROM EMPLOYEE;
DESC EMP_TAB;

#21.	List all the details of ‘EMPLOYEE’ and ‘EMP_TAB’

SELECT DISTINCT E.EMPNO,E.NAME,E.JOB,E.SALARY,E.DEPTNO,E.DATE_JOIN,E.TOTALSALARY,
B.EMPNO,B.ENAME,B.JOB,B.SALARY,B.DEPTNO,B.DATE_JOIN,B.TOTALSALARY FROM EMP_TAB JOIN EMPLOYEE B 
WHERE E.EMPNO=B.EMPNO;

#22.	Delete all records from ‘EMP’

TRUNCATE TABLE EMPLOYEE;
SELECT * FROM EMPLOYEE;

#23.	Delete the table ‘EMP’
DROP TABLE EMPLOYEE;
DROP TABLE EMP;

								      #SET-2

Create a table STUDENT with fields sid, name, dob (date of birth) and marks of 3 subjects ( physics, chemistry and maths ).
Add the details of 5 students. Perform the following queries:

USE 20MCA012;
CREATE TABLE STUDENT(SID INT PRIMARY KEY,SNAME VARCHAR(20),DOB VARCHAR(20),MPHYSICS INT,MCHEMISTRY INT,MMATHS INT);
INSERT INTO STUDENT(SID,SNAME,DOB,MPHYSICS,MCHEMISTRY,MMATHS)VALUES('101','ARUN','10-FEB-98','82','80','76');
INSERT INTO STUDENT(SID,SNAME,DOB,MPHYSICS,MCHEMISTRY,MMATHS)VALUES('102','BIBIN','19-OCT-99','41','60','66');
INSERT INTO STUDENT(SID,SNAME,DOB,MPHYSICS,MCHEMISTRY,MMATHS)VALUES('103','CIJO','28-MAR-98','32','30','34');
INSERT INTO STUDENT(SID,SNAME,DOB,MPHYSICS,MCHEMISTRY,MMATHS)VALUES('104','DIVID','02-DEC-97','56','60','46');
INSERT INTO STUDENT(SID,SNAME,DOB,MPHYSICS,MCHEMISTRY,MMATHS)VALUES('105','ELDHO','15-APR-99','86','89','87');

#1.	Display the id and name of youngest student.

SELECT SID,SNAME FROM STUDENT WHERE DOB=(SELECT MIN(DOB) FROM STUDENT);

#2.	Display the details of students who have passed in maths and either in physics or chemistry.(pass mark = 40 marks and above)

SELECT SID,SNAME,DOB FROM STUDENT WHERE MMATHS >= '40' AND MPHYSICS >='40' OR MCHEMISTRY >='40';

#3.	Add two more columns total and average.

ALTER TABLE STUDENT ADD TOTAL INT,ADD AVERAGE INT;

#4.	Display the name of student who scored highest marks in maths.

SELECT SNAME FROM STUDENT WHERE MMATHS=(SELECT MAX(MMATHS) FROM STUDENT);

#5.	Display the name of student who scored least marks in chemistry.

SELECT SNAME FROM STUDENT WHERE MCHEMISTRY=(SELECT MIN(MCHEMISTRY) FROM STUDENT);

#6.	Update column total with total marks.

UPDATE STUDENT SET TOTAL = MPHYSICS + MCHEMISTRY + MMATHS;
UPDATE STUDENT SET AVERAGE=TOTAL/3;

#7.	Display details of students in order of total merit.

SELECT * FROM STUDENT ORDER BY TOTAL;

#8.	Rename the column average with avg_mark

ALTER TABLE STUDENT RENAME COLUMN AVERAGE TO AVG_MARK;

#9.	Find out the overall average of class.

SELECT AVG(AVG_MARK) AS OVERALL FROM STUDENT;

#10.	Display details of students whose average is greater than overall average.

SELECT * FROM STUDENT WHERE AVG_MARK> (SELECT AVG(AVG_MARK) FROM STUDENT);

#11.	Find the total no: of students whose average is greater than overall average.

SELECT COUNT(*) AS COUNT FROM STUDENT WHERE AVG_MARK>(SELECT AVG(AVG_MARK) FROM STUDENT);



									#SET-3

#Create the Table LOAN_ACCOUNTS with the structure given below
#Add another column ‘category’ of type varchar2(1) in the Loan Table

USE 20MCA012;

CREATE TABLE LOAN_ACCOUNTS
(
ACCNO INT,
CUST_NAME VARCHAR(15),
LOAN_AMOUNT DECIMAL(8,2),
INSTALLMENTS INT,
INT_RATE DECIMAL(4,2),
START_DATE DATE,
INTEREST DECIMAL(8,2)
);

DROP TABLE LOAN_ACCOUNTS;


DESC LOAN_ACCOUNTS;

ALTER TABLE LOAN_ACCOUNTS
ADD COLUMN CATEGORY VARCHAR(1);


INSERT INTO LOAN_ACCOUNTS(ACCNO,CUST_NAME,LOAN_AMOUNT,INSTALLMENTS,INT_RATE,START_DATE)
VALUES(1001,'R.K GUPTA',300000.00,36,12.00,'2009-7-19'),
(1002,'S.P SHARMA',500000.00,48,10.00,'2008-3-22'),
(1003,'K.P JAIN',300000.00,36,NULL,'2007-8-3'),
(1004,'M.P YADAV',800000.00,60,10.00,'2008-6-12'),
(1005,'S.P SINHA',200000.00,36,12.50,'2010-3-1'),
(1006,'P. SHARMA',700000.00,60,12.50,'2008-5-6'),
(1007,'K.S DHALL',500000.00,48,NULL,'2008-5-3');

SELECT * FROM LOAN_ACCOUNTS;
TRUNCATE TABLE LOAN_ACCOUNTS;

#1.	Put the interest rate 11.50% for all the loans for which the interest rate is NULL.
UPDATE LOAN_ACCOUNTS SET INT_RATE =11.50 WHERE INT_RATE IS NULL;

#2.	Increase the interest rate by 0.5% for all the Loans for which the Loan amount is more than 400000.

UPDATE LOAN_ACCOUNTS SET INT_RATE= INT_RATE+0.5 WHERE LOAN_AMOUNT >400000;

#3.	For each Loan replace Interest with (Loan_amount * Int_rate* installments)/(12*100).

UPDATE LOAN_ACCOUNTS SET INTEREST=(LOAN_AMOUNT*INT_RATE*INSTALLMENTS) /(12*100); 

#4.	Delete the records of all the Loans whose start date is before 2008

DELETE FROM LOAN_ACCOUNTS WHERE YEAR(START_DATE)<2008; 

#5.	Delete the records of all the Loans whose name starts with ‘K’

DELETE FROM LOAN_ACCOUNTS WHERE CUST_NAME LIKE 'K%';

#6.	Display the details of all the Loans with less than 40 installments.

SELECT * FROM LOAN_ACCOUNTS WHERE INSTALLMENTS <40;

#7.	Display the Accno and Loan_amount of all the loans started before 01-04-2009.

SELECT ACCNO,LOAN_AMOUNT FROM LOAN_ACCOUNTS WHERE START_DATE<'2009-4-1';

#8.	Display the int_rate of all Loans started after 01-04-2009.

SELECT INT_RATE FROM LOAN_ACCOUNTS WHERE START_DATE>'2009-4-1';

#9.	Display the Accno, cust_name and Loan amount for all the Loans for which the cust_name ends with‘Sharma’.

SELECT ACCNO,CUST_NAME,LOAN_AMOUNT FROM LOAN_ACCOUNTS WHERE CUST_NAME LIKE '%SHARMA';

#10.	Loan_Amount of all the Loans for which the Cust_name ends with ‘a’.

SELECT LOAN_AMOUNT FROM LOAN_ACCOUNTS WHERE CUST_NAME LIKE '%A';

#11.	Display the Accno, Cust_name and Loan_Amount for the Loans for which the Cust_name contains ‘a’.

SELECT ACCNO,CUST_NAME,LOAN_AMOUNT FROM LOAN_ACCOUNTS WHERE CUST_NAME LIKE '%A%';

#12.	Dsiplay the Accno, Cust_name and Loan_Amount for all the Loans for which the Cust_name does not contain ‘P’.

SELECT ACCNO,CUST_NAME,LOAN_AMOUNT FROM LOAN_ACCOUNTS WHERE CUST_NAME NOT LIKE '%P%';

#13.	Display the structure of table LOAN_ACCOUNTS so that you can verify that the table is created as required.

DESCRIBE LOAN_ACCOUNTS;

#14.	Display the details of all the loans in the ascending order of their Loan_Amount.

SELECT * FROM LOAN_ACCOUNTS  WHERE  LOAN_AMOUNT ORDER BY LOAN_AMOUNT ASC;

#15.	Display the details of all the Loans in the descending order of their Start_date

SELECT * FROM LOAN_ACCOUNTS  WHERE  START_DATE ORDER BY START_DATE DESC;

#16.	Display the details of all the Loans in the ascending order of their Loan_amount and within Loan_amount in the descending order of their Start_date.

SELECT * FROM LOAN_ACCOUNTS ORDER BY LOAN_AMOUNT, START_DATE DESC;

#17.	Display the Accno, Cust_name and Loan_Amount of all the Loans for which the Cust_name starts with ‘K’.

SELECT ACCNO,CUST_NAME,LOAN_AMOUNT FROM LOAN_ACCOUNTS WHERE CUST_NAME LIKE 'K%';

#18.	Display the details of all the Loans whose rate of interest in NULL.

SELECT * FROM LOAN_ACCOUNTS WHERE INT_RATE IS NULL;

#19.	Display the details of all the loans whose rate of interest is not NULL.

SELECT * FROM LOAN_ACCOUNTS WHERE INT_RATE IS NOT NULL;

#20.	Display the amounts of various loans from the table Loan_Accounts. A Loan_Amount should appear only once.

SELECT DISTINCT LOAN_AMOUNT FROM LOAN_ACCOUNTS;

#21.	Display the details of all the loans started after 31-12-2008 for which the number of installments are more than 36.

SELECT * FROM LOAN_ACCOUNTS WHERE START_DATE>'2008-12-31' AND INSTALLMENTS>36; 

#22.	Display the Customer_name and Loan_amount for all the Loans for which the Loan amount is less than 500000 or int_rate is more than 12.

SELECT CUST_NAME,LOAN_AMOUNT FROM LOAN_ACCOUNTS WHERE LOAN_AMOUNT<500000 OR INT_RATE>12; 

#23.	Display the details of all Loans which started in the year 2009.

SELECT * FROM LOAN_ACCOUNTS WHERE YEAR(START_DATE)=2009;

#24.	Display the details of all the Loans whose Loan amount is in the Range 400000 to 500000.

SELECT * FROM LOAN_ACCOUNTS WHERE LOAN_AMOUNT BETWEEN 400000 AND 500000;

#25.	Display the Customer_name and Loan_amount of all the Loans for which the number of installments are 26, 36 and 48.

SELECT CUST_NAME,LOAN_AMOUNT FROM LOAN_ACCOUNTS WHERE INT_RATE IN (26,36,48);

#26.	Display the customer name, loan_amount and interest rate. If interest rate is NULL, display it as 0.

SELECT CUST_NAME,LOAN_AMOUNT,IFNULL(INT_RATE,0) AS INT_RATE FROM LOAN_ACCOUNTS;


#INSERT INTO LOAN_ACCOUNTS(ACCNO,INT_RATE) VALUES(1010,NULL);
#SELECT * FROM LOAN_ACCOUNTS;

#27.	Display the customer name, loan_amount and interest rate. If interest rate is NULL, display it as “No Interest”.

SELECT CUST_NAME,LOAN_AMOUNT,IFNULL(INT_RATE,'NO INTEREST') AS INT_RATE FROM LOAN_ACCOUNTS;