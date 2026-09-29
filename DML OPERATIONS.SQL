-- ---------------- DML : Sample Data Insertion ----------------

-- Insert Departments
INSERT INTO Department (dept_name, floor_no, hod_doctor_id) VALUES
('Cardiology', 1, NULL),
('Neurology', 2, NULL),
('Orthopedics', 3, NULL),
('General Medicine', 1, NULL);


-- Insert Doctors
INSERT INTO Doctor
(first_name, last_name, specialization, experience_years, email, dept_id)
VALUES
('Ramesh', 'Kumar', 'Cardiologist', 12, 'ramesh.kumar@hospital.com', 1),
('Priya', 'Sharma', 'Neurologist', 8, 'priya.sharma@hospital.com', 2),
('Arjun', 'Reddy', 'Orthopedic Surgeon', 10, 'arjun.reddy@hospital.com', 3),
('Sneha', 'Rao', 'General Physician', 5, 'sneha.rao@hospital.com', 4);


-- Insert Patients
INSERT INTO Patient
(first_name, last_name, dob, blood_group, gender, address)
VALUES
('Rahul', 'Sharma', '2000-05-15', 'O+', 'Male', 'Kakinada'),
('Priya', 'Verma', '1998-08-20', 'A+', 'Female', 'Rajahmundry'),
('Arun', 'Kumar', '1995-03-10', 'B+', 'Male', 'Surampalem'),
('Divya', 'Reddy', '2002-11-25', 'AB+', 'Female', 'Vijayawada');


-- Insert Patient Contact Numbers
INSERT INTO Patient_Contact (patient_id, contact) VALUES
(1, '9876543210'),
(2, '9876543211'),
(3, '9876543212'),
(4, '9876543213');


-- Insert Wards
INSERT INTO Ward (ward_name, capacity, dept_id) VALUES
('Cardiology Ward', 20, 1),
('Neurology Ward', 15, 2),
('Orthopedic Ward', 25, 3),
('General Ward', 30, 4);


-- Insert Appointments
INSERT INTO Appointment
(patient_id, doctor_id, appt_date, appt_time, status, symptoms)
VALUES
(1, 1, '2026-09-20', '10:00:00', 'Completed',
 'Chest pain and shortness of breath'),

(2, 2, '2026-09-21', '11:30:00', 'Completed',
 'Severe headache and dizziness'),

(3, 3, '2026-09-22', '09:30:00', 'Scheduled',
 'Knee pain and difficulty walking'),

(4, 4, '2026-09-23', '14:00:00', 'Scheduled',
 'Fever and general weakness');


-- Insert Treatments
INSERT INTO Treatment
(appt_id, diagnosis, treatment_date, ward_id)
VALUES
(1, 'Mild cardiac condition', '2026-09-20', 1),
(2, 'Migraine', '2026-09-21', 2),
(3, 'Knee joint problem', '2026-09-22', 3);


-- Insert Bills
INSERT INTO Bill
(patient_id, treatment_id, consultation_fee,
 medicine_charges, bed_charges, payment_status, bill_date)
VALUES
(1, 1, 1000.00, 500.00, 1500.00, 'Paid', '2026-09-20'),
(2, 2, 800.00, 300.00, 1000.00, 'Paid', '2026-09-21'),
(3, 3, 900.00, 600.00, 1200.00, 'Pending', '2026-09-22');