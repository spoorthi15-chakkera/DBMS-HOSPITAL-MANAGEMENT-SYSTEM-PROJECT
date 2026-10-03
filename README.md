🏥 Hospital Management System

📌 Project Overview

The Hospital Management System is a database management project developed to organize and manage important hospital information in a structured relational database.
A hospital handles a large amount of interconnected information such as patient records, doctors, departments, wards, appointments, treatments, and billing. Maintaining this information manually or in separate files can result in duplicate data, inconsistent records, disconnected information, and difficulty in retrieving required details.

This project develops a normalized relational database that connects hospital-related information through primary keys, foreign keys, and integrity constraints. The system is implemented using MySQL and demonstrates database design, normalization, SQL operations, data validation, testing, and reporting.

🎯 Problem Statement

In a manual or file-based hospital arrangement, patient information, doctor schedules, treatment details, and billing records may be maintained independently.

This can lead to:

Data redundancy
Data inconsistency
Duplicate records
Weak data validation
Difficulty maintaining relationships between records
Difficult retrieval of appointments and treatment information
Difficulty tracking billing information

The proposed Hospital Management System stores major hospital information in appropriate normalized tables and connects related records using foreign keys and database constraints.

🎯 Objectives

The main objectives of this project are:

To design a normalized relational database for hospital management.
To manage patient, doctor, department, ward, appointment, treatment, and billing information.
To represent the system using an ER diagram.
To convert the ER design into a relational database schema.
To normalize the database up to Third Normal Form (3NF).
To implement the database using MySQL.
To apply PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL, CHECK, and DEFAULT constraints.

📂 Database Details

Main Entities

The database contains the following core entities:

Entity	Description
Patient	Stores patient demographic information
Doctor	Stores doctor details and specialization
Department	Stores hospital department information
Ward	Stores ward and capacity information
Appointment	Stores patient-doctor appointments
Treatment	Stores diagnosis and treatment information
Bill	Stores patient billing information
Patient_Contact	Stores multiple contact numbers
Prescription	Supports prescribed medicine information

The documentation identifies seven core entities along with supporting tables for multi-valued patient contacts and prescriptions.

🛠️ Technologies Used

Technology	Purpose

MySQL 8.0	Relational database implementation
MySQL Workbench 8.0 CE	SQL execution and database management
SQL	Database creation, manipulation and querying
dbfiddle.dev	Independent SQL query verification
draw.io / diagrams.net	ER and relational schema diagrams
Git	Version control
GitHub	Repository and project management
Microsoft Word	Project documentation
These tools and technologies are based on the tools section of your DBMS documentation.
To perform DDL, DML, DQL, DCL, and TCL operations.

🔄 Project Workflow :
          Problem Identification
                  ↓
          Requirement Analysis
                  ↓
           Entity Identification
                  ↓
             ER Diagram
                  ↓
        Relational Schema Design
                  ↓
          Normalization to 3NF
                  ↓
        MySQL Database Creation
                  ↓
         Sample Data Insertion
                  ↓
          SQL Query Operations
                  ↓
       Testing & Data Validation
                  ↓
            Sample Outputs
                  ↓
        Final Database System

To execute joins, aggregate functions, subqueries, views, and set operations.
To validate the database using test cases and sample data

👥 Team Details

| Roll Number | Name                    | Responsibility                         |
| ----------- | ----------------------- | -------------------------------------- |
| 25B11AI179  | CH. Spoorthi            | Team lead, ER design and normalization |
| 25B11AI240  | V. D. D. Shankar Samhit | Schema implementation and DDL          |
| 25B11AI448  | K. Prajna Kovida Reddy  | Query development and views            |
| 25B11AIC81  | V. Srinivas             | Sample data, testing and documentation |

📂 Project Files
File / Folder	Description
schema.sql	Database and table creation
sample_data.sql	Sample hospital data
queries.sql	SQL queries and operations
ER_Diagram.png	Entity Relationship Diagram
Relational_Schema.png	Relational database schema
DBMS DOCUMENTATION.docx	Complete project documentation
README.md	GitHub project documentation
screenshots/	SQL outputs and testing screenshots

Conclusion :

The Hospital Management System provides a structured relational database for managing important hospital information such as patients, doctors, departments, wards, appointments, treatments, and bills.
The project demonstrates ER modelling, relational schema design, normalization up to 3NF, MySQL implementation, SQL operations, constraints, sample data, reporting, and data validation.
The resulting database reduces data redundancy, maintains relationships between records, protects data integrity, and supports structured retrieval of hospital information through SQL queries.
