-- ============================================================
-- HOSPITAL MANAGEMENT SYSTEM
-- DQL, JOINS, AGGREGATES, SUBQUERIES, VIEWS, DCL & TCL
-- ============================================================


-- ================= DQL : Basic Retrieval (Q1-Q5) =================

-- Q1: List all patients with their basic details.
SELECT patient_id, first_name, last_name, dob, blood_group, gender
FROM Patient;

-- Q2: List all doctors with their specialization and experience.
SELECT doctor_id, first_name, last_name, specialization, experience_years, email
FROM Doctor;

-- Q3: Show all scheduled appointments.
SELECT appt_id, patient_id, doctor_id, appt_date, appt_time, status
FROM Appointment
WHERE status = 'Scheduled';

-- Q4: Show all appointments that are completed.
SELECT appt_id, patient_id, doctor_id, appt_date, appt_time
FROM Appointment
WHERE status = 'Completed';

-- Q5: List doctors having more than 5 years of experience.
SELECT doctor_id, first_name, last_name, specialization, experience_years
FROM Doctor
WHERE experience_years > 5;


-- ================= Joins (Q6-Q11) =================

-- Q6: Inner join - doctors with their department names.
SELECT d.doctor_id,
       CONCAT(d.first_name, ' ', d.last_name) AS doctor,
       d.specialization,
       dp.dept_name
FROM Doctor d
INNER JOIN Department dp
ON d.dept_id = dp.dept_id;

-- Q7: Appointment details with patient and doctor names.
SELECT a.appt_id,
       CONCAT(p.first_name, ' ', p.last_name) AS patient,
       CONCAT(d.first_name, ' ', d.last_name) AS doctor,
       a.appt_date,
       a.appt_time,
       a.status
FROM Appointment a
JOIN Patient p
ON a.patient_id = p.patient_id
JOIN Doctor d
ON a.doctor_id = d.doctor_id;

-- Q8: Show treatment details with patient and ward information.
SELECT t.treatment_id,
       CONCAT(p.first_name, ' ', p.last_name) AS patient,
       t.diagnosis,
       t.treatment_date,
       w.ward_name
FROM Treatment t
JOIN Appointment a
ON t.appt_id = a.appt_id
JOIN Patient p
ON a.patient_id = p.patient_id
LEFT JOIN Ward w
ON t.ward_id = w.ward_id;

-- Q9: Left outer join - all patients and their bills, if available.
SELECT CONCAT(p.first_name, ' ', p.last_name) AS patient,
       b.bill_id,
       b.consultation_fee,
       b.medicine_charges,
       b.bed_charges,
       b.payment_status
FROM Patient p
LEFT JOIN Bill b
ON p.patient_id = b.patient_id;

-- Q10: Right outer join - all appointments and their treatments, if available.
SELECT a.appt_id,
       a.appt_date,
       a.status,
       t.treatment_id,
       t.diagnosis
FROM Treatment t
RIGHT JOIN Appointment a
ON t.appt_id = a.appt_id;

-- Q11: Full outer join simulation in MySQL - patients and bills.
SELECT p.patient_id,
       CONCAT(p.first_name, ' ', p.last_name) AS patient,
       b.bill_id,
       b.payment_status
FROM Patient p
LEFT JOIN Bill b
ON p.patient_id = b.patient_id

UNION

SELECT p.patient_id,
       CONCAT(p.first_name, ' ', p.last_name) AS patient,
       b.bill_id,
       b.payment_status
FROM Patient p
RIGHT JOIN Bill b
ON p.patient_id = b.patient_id;


-- ================= Aggregates, GROUP BY, HAVING (Q12-Q16) =================

-- Q12: Total number of patients.
SELECT COUNT(*) AS total_patients
FROM Patient;

-- Q13: Total number of doctors in each department.
SELECT dept_id,
       COUNT(*) AS total_doctors
FROM Doctor
GROUP BY dept_id;

-- Q14: Departments having more than one doctor.
SELECT dept_id,
       COUNT(*) AS doctor_count
FROM Doctor
GROUP BY dept_id
HAVING COUNT(*) > 1;

-- Q15: Average experience of doctors.
SELECT AVG(experience_years) AS average_experience
FROM Doctor;

-- Q16: Maximum doctor experience and the doctor having it.
SELECT doctor_id,
       CONCAT(first_name, ' ', last_name) AS doctor,
       MAX(experience_years) AS maximum_experience
FROM Doctor
GROUP BY doctor_id, first_name, last_name
ORDER BY maximum_experience DESC
LIMIT 1;


-- ================= Nested and Correlated Subqueries (Q17-Q20) =================

-- Q17: Patients who have never had an appointment.
SELECT patient_id, first_name, last_name
FROM Patient
WHERE patient_id NOT IN
      (SELECT patient_id FROM Appointment);

-- Q18: Patients who have at least one pending bill
--      (Correlated subquery).
SELECT CONCAT(first_name, ' ', last_name) AS patient
FROM Patient p
WHERE EXISTS
      (SELECT 1
       FROM Bill b
       WHERE b.patient_id = p.patient_id
       AND b.payment_status = 'Pending');

-- Q19: Doctors whose experience is greater than
--      the average doctor experience.
SELECT doctor_id,
       CONCAT(first_name, ' ', last_name) AS doctor,
       experience_years
FROM Doctor
WHERE experience_years >
      (SELECT AVG(experience_years)
       FROM Doctor);

-- Q20: Appointments belonging to doctors having
--      more than 5 years of experience.
SELECT appt_id,
       patient_id,
       doctor_id,
       appt_date,
       status
FROM Appointment
WHERE doctor_id IN
      (SELECT doctor_id
       FROM Doctor
       WHERE experience_years > 5);


-- ================= Views and Set Operations (Q21-Q25) =================

-- Q21: Doctors having more experience than the average.
SELECT doctor_id,
       first_name,
       last_name,
       experience_years
FROM Doctor
WHERE experience_years >
      (SELECT AVG(experience_years)
       FROM Doctor);

-- Q22: Updatable view of scheduled appointments.
CREATE VIEW Scheduled_Appointments AS
SELECT appt_id,
       patient_id,
       doctor_id,
       appt_date,
       appt_time,
       status
FROM Appointment
WHERE status = 'Scheduled';

-- Display the view.
SELECT * FROM Scheduled_Appointments;

-- Q23: Non-updatable view showing patient-wise bill summary.
CREATE VIEW Patient_Bill_Summary AS
SELECT p.patient_id,
       CONCAT(p.first_name, ' ', p.last_name) AS patient,
       COUNT(b.bill_id) AS bill_count,
       SUM(b.consultation_fee +
           b.medicine_charges +
           b.bed_charges) AS total_amount
FROM Patient p
LEFT JOIN Bill b
ON p.patient_id = b.patient_id
GROUP BY p.patient_id, p.first_name, p.last_name;

-- Display the view.
SELECT * FROM Patient_Bill_Summary;

-- Q24: UNION - distinct first names of doctors and patients.
SELECT first_name
FROM Doctor
UNION
SELECT first_name
FROM Patient;

-- Q25: INTERSECT - first names common to doctors and patients.
SELECT first_name
FROM Doctor
INTERSECT
SELECT first_name
FROM Patient;


-- ================= Set Operation (Q26) =================

-- Q26: EXCEPT - doctor first names that are not patient first names.
SELECT first_name
FROM Doctor
EXCEPT
SELECT first_name
FROM Patient;


-- ================= DCL (Q27-Q28) =================

-- Q27: Grant read access on the Patient table
--      to a hospital staff user.
GRANT SELECT
ON hospital_db.Patient
TO 'hospital_staff'@'localhost';

-- Q28: Revoke the read access.
REVOKE SELECT
ON hospital_db.Patient
FROM 'hospital_staff'@'localhost';


-- ================= TCL (Q29-Q31) =================

-- Q29: Insert a new patient and commit the transaction.
START TRANSACTION;

INSERT INTO Patient
(first_name, last_name, dob, blood_group, gender, address)
VALUES
('Amit', 'Kumar', '2000-05-15', 'O+', 'Male', 'Kakinada');

COMMIT;


-- Q30: Begin a transaction, insert two patients
--      and set a savepoint.
START TRANSACTION;

INSERT INTO Patient
(first_name, last_name, dob, blood_group, gender, address)
VALUES
('Neha', 'Reddy', '2001-08-20', 'A+', 'Female', 'Rajahmundry');

SAVEPOINT sp1;

INSERT INTO Patient
(first_name, last_name, dob, blood_group, gender, address)
VALUES
('Vikram', 'Rao', '1999-11-10', 'B+', 'Male', 'Surampalem');


-- Q31: Roll back to the savepoint and commit.
--      The second patient insertion is undone.
ROLLBACK TO sp1;

COMMIT;