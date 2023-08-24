--question 1- List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
    emp.emp_no
    ,emp.first_name
    ,emp.last_name
    ,emp.sex
    ,sal.salary
FROM employees AS emp
INNER JOIN salary AS sal
    ON sal.emp_no=emp.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
    emp.first_name
    ,emp.last_name
    ,emp.hire_date
FROM employees AS emp
WHERE hire_date YEAR = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name. 24 results

SELECT 
    dep.dept_no
    ,dep.dept_name
    ,emp.emp_no
    ,emp.first_name
    ,emp.last_name
INNER JOIN dept_emp
    ON dept_emp.emp_no=emp.emp_no
INNER JOIN departments AS dep
    ON dep.dept_no=dept_emp.dept_no
WHERE emp.emp_no IN(SELECT emp_no from dept_manager)


--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT
    first_name
    ,last_name
    ,sex
FROM employees
WHERE first_name='Hercules' 
    AND last_name LIKE 'b%';
--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT
    emp.emp_no
    ,emp.last_name
    ,emp.first_name
FROM employees as emp
INNER JOIN dept_emp 
    ON emp.emp_no=dept_emp.emp_no
INNER JOIN departments as dep
    ON dep.dept_no=dept_emp.dept_no
WHERE dep.dept_name='Sales'
    
--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
    emp.emp_no
    ,emp.last_name
    ,emp.first_name
    ,'Sales' as Department_Name
INNER JOIN dept_emp 
    ON emp.emp_no=dept_emp.emp_no
INNER JOIN departments as dep
    ON dep.dept_no=dept_emp.dept_no
WHERE dep.dept_name='Sales'
UNION ALL
SELECT
    emp.emp_no
    ,emp.last_name
    ,emp.first_name
    ,'Development' as Department_Name
INNER JOIN dept_emp 
    ON emp.emp_no=dept_emp.emp_no
INNER JOIN departments as dep
    ON dep.dept_no=dept_emp.dept_no
WHERE dep.dept_name='Development';
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT COUNT(last_name) as Last_Name_Frequency
FROM employees
ORDER BY desc

