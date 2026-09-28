-------------------------------------------------------------
------HOSPITAL MANAGEMENT SYSTEM DDL DATABASE------
-------------------------------------------------------------

CREATE TABLE Department (
  dept_id       INT          PRIMARY KEY AUTO_INCREMENT,
  dept_name     VARCHAR(100) NOT NULL UNIQUE,
  floor_no      INT,
  hod_doctor_id INT
);

CREATE TABLE Doctor (
  doctor_id          INT          PRIMARY KEY AUTO_INCREMENT,
  first_name         VARCHAR(50)  NOT NULL,
  last_name          VARCHAR(50)  NOT NULL,
  specialization     VARCHAR(100),
  experience_years   INT          CHECK (experience_years >= 0),
  email              VARCHAR(100) UNIQUE NOT NULL,
  dept_id            INT,
  FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Patient (
  patient_id  INT         PRIMARY KEY AUTO_INCREMENT,
  first_name  VARCHAR(50) NOT NULL,
  last_name   VARCHAR(50) NOT NULL,
  dob         DATE,
  blood_group CHAR(5),
  gender      VARCHAR(10),
  address     TEXT
);

CREATE TABLE Patient_Contact (
  id         INT PRIMARY KEY AUTO_INCREMENT,
  patient_id INT NOT NULL,
  contact    VARCHAR(15),
  FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

CREATE TABLE Ward (
  ward_id   INT         PRIMARY KEY AUTO_INCREMENT,
  ward_name VARCHAR(50),
  capacity  INT         CHECK (capacity > 0),
  dept_id   INT,
  FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Appointment (
  appt_id    INT         PRIMARY KEY AUTO_INCREMENT,
  patient_id INT         NOT NULL,
  doctor_id  INT         NOT NULL,
  appt_date  DATE        NOT NULL,
  appt_time  TIME        NOT NULL,
  status     VARCHAR(20) DEFAULT "Scheduled",
  symptoms   TEXT,
  FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
  FOREIGN KEY (doctor_id)  REFERENCES Doctor(doctor_id)
);

CREATE TABLE Treatment (
  treatment_id   INT  PRIMARY KEY AUTO_INCREMENT,
  appt_id        INT  UNIQUE NOT NULL,
  diagnosis      TEXT,
  treatment_date DATE,
  ward_id        INT,
  FOREIGN KEY (appt_id)  REFERENCES Appointment(appt_id),
  FOREIGN KEY (ward_id)  REFERENCES Ward(ward_id)
);

CREATE TABLE Bill (
  bill_id          INT           PRIMARY KEY AUTO_INCREMENT,
  patient_id       INT           NOT NULL,
  treatment_id     INT           UNIQUE,
  consultation_fee DECIMAL(10,2) DEFAULT 0,
  medicine_charges DECIMAL(10,2) DEFAULT 0,
  bed_charges      DECIMAL(10,2) DEFAULT 0,
  payment_status   VARCHAR(20)   DEFAULT "Pending",
  bill_date        DATE,
  FOREIGN KEY (patient_id)   REFERENCES Patient(patient_id),
  FOREIGN KEY (treatment_id) REFERENCES Treatment(treatment_id)
);
