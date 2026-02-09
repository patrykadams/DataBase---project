/* Views and Synonyms for Cinema Management System
   Description: Business logic layers and simplified naming conventions.
*/

-- View: Current repertoire joining movies, screenings, and rooms
CREATE OR REPLACE VIEW v_current_repertoire AS
SELECT 
    m.title AS film_title, 
    r.room_number, 
    s.start_time, 
    s.price
FROM screenings s
JOIN movies m ON s.movies_movie_id = m.movie_id
JOIN rooms r ON s.rooms_room_id = r.room_id;

-- View: Detailed staff list with manager names (Recursive Join)
CREATE OR REPLACE VIEW v_staff_details AS
SELECT 
    e.first_name, 
    e.last_name, 
    d.name AS dept_name, 
    m.last_name AS manager_name
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
LEFT JOIN employees m ON e.manager_id = m.emp_id;

-- Synonyms for administrative convenience
CREATE SYNONYM tix FOR tickets;
CREATE SYNONYM emps FOR employees;
CREATE SYNONYM movie_list FOR movies;

-- Indexes for performance optimization
CREATE INDEX idx_screening_time ON screenings(start_time);
CREATE INDEX idx_movie_title ON movies(title);
