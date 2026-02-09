/* Seed Data for Cinema Management System
   Description: Initial data for testing and demonstration.
*/

-- Departments
INSERT INTO departments (dept_id, name) VALUES (1, 'Administration');
INSERT INTO departments (dept_id, name) VALUES (2, 'Customer Service');

-- Employees (Cleaned from real names)
INSERT INTO employees (emp_id, first_name, last_name, dept_id, manager_id) 
VALUES (1, 'John', 'Smith', 1, NULL);
INSERT INTO employees (emp_id, first_name, last_name, dept_id, manager_id) 
VALUES (2, 'Jane', 'Doe', 2, 1);

-- Movies
INSERT INTO movies (movie_id, title, duration) VALUES (101, 'Inception', 148);
INSERT INTO movies (movie_id, title, duration) VALUES (102, 'Interstellar', 169);

-- Rooms
INSERT INTO rooms (room_id, room_number, capacity) VALUES (1, 'Gold Hall', 50);

-- Screenings
INSERT INTO screenings (screening_id, movies_movie_id, rooms_room_id, start_time, price)
VALUES (1, 101, 1, TO_DATE('2026-03-01 18:00', 'YYYY-MM-DD HH24:MI'), 25.00);

COMMIT;
