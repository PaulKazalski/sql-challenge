-- Employees table

DROP table employees;

CREATE table employees (
	emp_no INT NOT NULL PRIMARY KEY,
	birth_date DATE, 
	first_name varchar(40),
	last_name varchar(40),
	gender varchar(1),
	hire_date DATE
);

select * from employees;

-- Departments table

DROP table departments;

CREATE table departments (
	dept_no varchar(30) NOT NULL PRIMARY KEY,
	dept_name varchar(30) NOT NULL
);

select * from departments;

-- Department Employees table

DROP table dept_emp;

CREATE table dept_emp ( 
	emp_no INT NOT NULL,
	dept_no varchar(30) NOT NULL,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) references employees (emp_no), 
	FOREIGN KEY (dept_no) references departments (dept_no)
);

select * from dept_emp;

-- Department Mangers table

DROP table dept_managers;

CREATE table dept_managers (
	dept_no varchar(30) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (dept_no) references departments (dept_no),
	FOREIGN KEY (emp_no) references employees (emp_no)
);

select * from dept_managers;

-- Salaries Table

DROP table salaries;

CREATE table salaries (
	emp_no INT NOT NULL,
	salary INT,
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) references employees (emp_no)
);

select * from salaries;

-- Titles Table

DROP table titles;

CREATE table titles (
	emp_no INT NOT NULL,	
	title varchar(50),
	from_date DATE,
	to_date DATE,
	FOREIGN KEY (emp_no) references employees (emp_no)
);

select * from titles;

