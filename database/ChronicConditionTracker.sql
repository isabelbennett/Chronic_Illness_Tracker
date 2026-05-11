CREATE TABLE Specialty (
    SpecialtyID   NUMBER PRIMARY KEY,
    Title         VARCHAR2(100),
    Notes         VARCHAR2(255)
);

CREATE TABLE Doctor (
    DoctorID     NUMBER PRIMARY KEY,
    FirstName    VARCHAR2(50) NOT NULL,
    LastName     VARCHAR2(50) NOT NULL,
    LicenseNo    NUMBER,
    Email        VARCHAR2(100),
    SpecialtyID  NUMBER,
    CONSTRAINT fk_doctor_specialty
        FOREIGN KEY (SpecialtyID)
        REFERENCES Specialty(SpecialtyID)
);

CREATE TABLE Patient (
    PatientID  NUMBER PRIMARY KEY,
    FirstName  VARCHAR2(50) NOT NULL,
    LastName   VARCHAR2(50) NOT NULL,
    DoB        DATE,
    Gender     VARCHAR2(10),
    PhoneNo    VARCHAR2(20),
    Email      VARCHAR2(100)
);

CREATE TABLE Appointment (
    AppointmentID NUMBER PRIMARY KEY,
    ApptDate      DATE NOT NULL,
    ApptTime      TIMESTAMP NOT NULL,
    Reason        VARCHAR2(255),
    PatientID     NUMBER NOT NULL,
    DoctorID      NUMBER NOT NULL,
    CONSTRAINT fk_appt_patient
        FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    CONSTRAINT fk_appt_doctor
        FOREIGN KEY (DoctorID) REFERENCES Doctor(DoctorID)
);

CREATE TABLE Condition (
    ConditionID      NUMBER PRIMARY KEY,
    ConditionName    VARCHAR2(100) NOT NULL,
    Description      VARCHAR2(255),
    ICD10Code        VARCHAR2(20),
    TypicalSymptoms  VARCHAR2(255)
);

CREATE TABLE PatientCondition (
    PatientConditionID NUMBER PRIMARY KEY,
    DiagnosisDate      DATE,
    Severity           VARCHAR2(20),
    Status             VARCHAR2(50),
    Notes              VARCHAR2(255),
    PatientID          NUMBER NOT NULL,
    ConditionID        NUMBER NOT NULL,
    CONSTRAINT fk_pc_patient
        FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    CONSTRAINT fk_pc_condition
        FOREIGN KEY (ConditionID) REFERENCES Condition(ConditionID)
);

CREATE TABLE SymptomLog (
    SymptomID          NUMBER PRIMARY KEY,
    SymptomName        VARCHAR2(100),
    Severity           NUMBER,
    DateLogged         DATE,
    Notes              VARCHAR2(255),
    PatientConditionID NUMBER NOT NULL,
    CONSTRAINT fk_symptom_patientcondition
        FOREIGN KEY (PatientConditionID)
        REFERENCES PatientCondition(PatientConditionID)
);

CREATE TABLE Metrics (
    MetricID    NUMBER PRIMARY KEY,
    MetricName  VARCHAR2(100),
    MetricValue VARCHAR2(100),
    MetricDate  DATE,
    PatientID   NUMBER NOT NULL,
    CONSTRAINT fk_metrics_patient
        FOREIGN KEY (PatientID)
        REFERENCES Patient(PatientID)
);

CREATE TABLE Studies (
    StudyID  NUMBER PRIMARY KEY,
    Purpose  VARCHAR2(255),
    Notes    VARCHAR2(255)
);

CREATE TABLE PatientStudies (
    PatientStudiesID  NUMBER PRIMARY KEY,
    EnrollmentDate    DATE,
    PatientID         NUMBER NOT NULL,
    StudyID           NUMBER NOT NULL,
    ConsentDate       DATE,
    ConsentFormSigned NUMBER(1),
    CONSTRAINT fk_ps_patient
        FOREIGN KEY (PatientID) REFERENCES Patient(PatientID),
    CONSTRAINT fk_ps_study
        FOREIGN KEY (StudyID) REFERENCES Studies(StudyID)
);   





INSERT INTO Specialty VALUES (1, 'Endocrinology', 'Diabetes and hormone disorders');
INSERT INTO Specialty VALUES (2, 'Pulmonology', 'Lung and respiratory care');
INSERT INTO Specialty VALUES (3, 'Cardiology', 'Heart and vascular care');

INSERT INTO Doctor VALUES (1, 'Alice', 'Smith', 445566, 'asmith@clinic.com', 1);
INSERT INTO Doctor VALUES (2, 'Brian', 'Lee', 778899, 'blee@clinic.com', 2);
INSERT INTO Doctor VALUES (3, 'Carla', 'Nguyen', 112233, 'cnguyen@clinic.com', 3);

INSERT INTO Patient VALUES (1, 'Sarah', 'Bennett', DATE '1999-04-12', 'F', '5551237890', 'sarah@email.com');
INSERT INTO Patient VALUES (2, 'Michael', 'Lee', DATE '1986-09-23', 'M', '5559876543', 'michael@email.com');
INSERT INTO Patient VALUES (3, 'Emma', 'Johnson', DATE '2002-02-18', 'F', '5554561111', 'emma@email.com');

INSERT INTO Appointment VALUES (1, DATE '2025-12-10', TIMESTAMP '2025-12-10 09:00:00', 'Diabetes follow-up', 1, 1);
INSERT INTO Appointment VALUES (2, DATE '2025-12-11', TIMESTAMP '2025-12-11 10:30:00', 'Asthma check', 2, 2);
INSERT INTO Appointment VALUES (3, DATE '2025-12-12', TIMESTAMP '2025-12-12 14:00:00', 'Heart screening', 3, 3);

INSERT INTO Condition VALUES (1, 'Type 1 Diabetes', 'Autoimmune diabetes', 'E10', 'Thirst, fatigue, blurred vision');
INSERT INTO Condition VALUES (2, 'Asthma', 'Chronic lung disease', 'J45', 'Wheezing, shortness of breath');
INSERT INTO Condition VALUES (3, 'Hypertension', 'High blood pressure', 'I10', 'Headache, dizziness');

INSERT INTO PatientCondition VALUES (1, DATE '2012-08-10', 'Moderate', 'Active', 'Requires insulin', 1, 1);
INSERT INTO PatientCondition VALUES (2, DATE '2019-04-15', 'Mild', 'Active', 'Uses inhaler', 2, 2);
INSERT INTO PatientCondition VALUES (3, DATE '2023-01-20', 'Severe', 'Active', 'On medication', 3, 3);

INSERT INTO SymptomLog VALUES (1, 'Fatigue', 3, DATE '2025-11-29', 'Tired after work', 1);
INSERT INTO SymptomLog VALUES (2, 'Shortness of breath', 4, DATE '2025-11-28', 'After activity', 2);
INSERT INTO SymptomLog VALUES (3, 'Headache', 2, DATE '2025-11-27', 'Morning headache', 3);

INSERT INTO Metrics VALUES (1, 'Blood Glucose', '145', DATE '2025-11-29', 1);
INSERT INTO Metrics VALUES (2, 'Peak Flow', '380', DATE '2025-11-28', 2);
INSERT INTO Metrics VALUES (3, 'Blood Pressure', '150/95', DATE '2025-11-27', 3);

INSERT INTO Studies VALUES (1, 'Diabetes Insulin Study', 'Testing new insulin dosage');
INSERT INTO Studies VALUES (2, 'Asthma Inhaler Study', 'Comparing inhaler effectiveness');

INSERT INTO PatientStudies VALUES (1, DATE '2024-03-01', 1, 1, DATE '2024-03-01', 1);
INSERT INTO PatientStudies VALUES (2, DATE '2024-06-15', 2, 2, DATE '2024-06-15', 1); */


/* TESTING TABLES AND DATA */
SELECT * FROM Patient;
SELECT * FROM Appointment;
SELECT * FROM PatientCondition;
SELECT * FROM SymptomLog;
SELECT * FROM Metrics;
SELECT * FROM PatientStudies;

/* Testing patient queries */
SELECT *
FROM Patient
WHERE PatientID = 1; 

SELECT c.ConditionName, pc.DiagnosisDate, pc.Severity, pc.Status 
FROM PatientCondition pc 
JOIN Condition c ON pc.ConditionID = c.ConditionID 
WHERE pc.PatientID = 1; 

SELECT MetricName, MetricValue, MetricDate 
FROM Metrics 
WHERE PatientID = 1 
ORDER BY MetricDate DESC; 

SELECT s.Purpose, ps.EnrollmentDate, ps.ConsentDate 
FROM PatientStudies ps 
JOIN Studies s ON ps.StudyID = s.StudyID 
WHERE ps.PatientID = 1; 

SELECT s.SymptomName, s.Severity, s.DateLogged, s.Notes 
FROM SymptomLog s 
JOIN PatientCondition pc ON s.PatientConditionID = pc.PatientConditionID 
WHERE pc.PatientID = 1; 

/* Testing Doctor Queries */

SELECT a.ApptDate, a.ApptTime, a.Reason, p.FirstName, p.LastName 
FROM Appointment a 
JOIN Patient p ON a.PatientID = p.PatientID 
WHERE a.DoctorID = 1 
ORDER BY a.ApptDate; 

SELECT p.FirstName, p.LastName, c.ConditionName, pc.Severity, pc.Status 
FROM PatientCondition pc 
JOIN Condition c ON pc.ConditionID = c.ConditionID 
JOIN Patient p ON pc.PatientID = p.PatientID 
WHERE p.PatientID = 1;

SELECT s.SymptomName, s.Severity, s.DateLogged 
FROM SymptomLog s 
WHERE s.PatientConditionID = 1 
ORDER BY s.DateLogged; 

SELECT p.FirstName, p.LastName, m.MetricName, m.MetricValue, m.MetricDate 
FROM Metrics m 
JOIN Patient p ON m.PatientID = p.PatientID 
ORDER BY m.MetricDate DESC; 

SELECT d.FirstName, d.LastName, s.Title 
FROM Doctor d 
JOIN Specialty s ON d.SpecialtyID = s.SpecialtyID;

/* Testing Admin Queries */

SELECT COUNT(*) AS TotalPatients 
FROM Patient;

SELECT a.ApptDate, p.FirstName, p.LastName, d.FirstName AS DoctorFirst 
FROM Appointment a 
JOIN Patient p ON a.PatientID = p.PatientID 
JOIN Doctor d ON a.DoctorID = d.DoctorID 
ORDER BY a.ApptDate; 

SELECT s.Title, COUNT(d.DoctorID) AS DoctorsCount 
FROM Specialty s 
LEFT JOIN Doctor d ON s.SpecialtyID = d.SpecialtyID 
GROUP BY s.Title; 

SELECT s.Purpose, COUNT(ps.PatientID) AS TotalPatients 
FROM Studies s 
LEFT JOIN PatientStudies ps ON s.StudyID = ps.StudyID 
GROUP BY s.Purpose;

SELECT COUNT(*) AS TotalAppointments 
FROM Appointment;  




