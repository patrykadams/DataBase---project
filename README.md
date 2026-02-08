# Cinema Management System Database

A comprehensive relational database solution designed to manage a multi-screen cinema complex. This project covers the entire business logic, from HR and infrastructure management to repertoire scheduling and B2B/B2C sales processes.

##  Project Overview
The system is built to ensure data integrity and scalability for a cinema business. It handles complex relationships such as exclusive associations (arcs) for different client types and recursive relationships for staff hierarchy.

### Key Features:
- **Repertoire & Logistics**: Management of movie titles, genres, hall infrastructure (rooms, sectors, seats), and automated screening schedules.
- **Sales Engine**: Integrated support for individual customers and corporate clients (B2B) using tax identification (NIP).
- **HR & Payroll**: Employee management with a department-based structure and a supervisory hierarchy.
- **Financial Tracking**: One-to-one mapping between tickets and payments for precise accounting.

##  Database Architecture
The database consists of 11 normalized tables implementing the following advanced SQL concepts:
- **Many-to-Many Relationships**: Linking movies to multiple genres.
- **Unary Relationships**: Self-referencing table for the organizational hierarchy (Managers -> Employees).
- **Exclusive Arc Relationship**: Ensures a ticket is assigned either to a private individual or a corporate entity.
- **Relational Integrity**: Use of Primary Keys, Foreign Keys, and Unique constraints.

##  Implementation Details
The project includes several database objects to optimize performance and usability:
- **Views**: 
  - `V_CURRENT_REPERTOIRE`: Joins 3 tables to provide a real-time movie schedule.
  - `V_STAFF_DETAILS`: A recursive join view displaying employee-manager relations.
- **Indexes**: Optimized search for frequently accessed columns (e.g., movie titles, screening times).
- **Synonyms**: Simplified naming conventions for administrative queries.

##  Getting Started
1. Clone the repository.
2. Navigate to the `scripts/` directory.
3. Execute the SQL scripts in the following order:
   - `01_schema.sql` (Tables and Constraints)
   - `02_views_synonyms.sql` (Additional database objects)
   - `03_sample_data.sql` (Dummy data for testing)

## 📄 License
This project is open-source and available under the MIT License.
