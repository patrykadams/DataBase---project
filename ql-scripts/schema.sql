/* Cinema Management System - Database Schema
   Description: Core table definitions including constraints and relations.
*/

-- 1. Business Clients Table
CREATE TABLE companies (
    company_id INTEGER NOT NULL PRIMARY KEY,
    name       VARCHAR2(50) NOT NULL,
    tax_id     VARCHAR2(20) NOT NULL -- Changed from NIP for international clarity
);

-- 2. Departments
CREATE TABLE departments (
    dept_id INTEGER NOT NULL PRIMARY KEY,
    name    VARCHAR2(50) NOT NULL
);

-- 3. Employees (Recursive relationship for hierarchy)
CREATE TABLE employees (
    emp_id     INTEGER NOT NULL PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name  VARCHAR2(50) NOT NULL,
    dept_id    INTEGER NOT NULL,
    manager_id INTEGER,
    CONSTRAINT fk_dept FOREIGN KEY (dept_id) REFERENCES departments(dept_id),
    CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);

-- 4. Views for Analytics
-- View of the current repertoire (joins 3 tables) 
CREATE OR REPLACE VIEW v_current_repertoire AS
SELECT 
    m.title AS film_title, 
    r.room_number, 
    s.start_time, 
    s.price
FROM screenings s
JOIN movies m ON s.movies_movie_id = m.movie_id
JOIN rooms r ON s.rooms_room_id = r.room_id;

-- View of the staff structure (unary join) 
CREATE OR REPLACE VIEW v_staff_details AS
SELECT 
    e.first_name, 
    e.last_name, 
    d.name AS dept_name, 
    m.last_name AS manager_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
LEFT JOIN employees m ON e.manager_id = m.emp_id;

-- 5. Synonyms for easier access 
CREATE SYNONYM tix FOR tickets;
CREATE SYNONYM emps FOR employees;
