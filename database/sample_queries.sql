## There are 3 different perspectives/views that would mainly be using this database. Queries are
## separated by which view they are applicable to: patient, doctor, or admin.


## Patient Queries 

## View thier profile:
SELECT *
FROM Patient
WHERE PatientID = 1;

#View their diagnoses:
SELECT c.ConditionName, pc.DiagnosisDate, pc.Severity, pc.Status
FROM PatientCondition pc
JOIN Condition c ON pc.ConditionID = c.ConditionID
WHERE pc.PatientID = 1;

##View their test results/metrics:
SELECT MetricName, MetricValue, MetricDate
FROM Metrics
WHERE PatientID = 1
ORDER BY MetricDate DESC;

##View studies they are enrolled in:
SELECT s.Purpose, ps.EnrollmentDate, ps.ConsentDate
FROM PatientStudies ps
JOIN Studies s ON ps.StudyID = s.StudyID
WHERE ps.PatientID = 1;

##View their logged symptoms:
SELECT s.SymptomName, s.Severity, s.DateLogged, s.Notes
FROM SymptomLog s
JOIN PatientCondition pc ON s.PatientConditionID = pc.PatientConditionID
WHERE pc.PatientID = 1;


## Doctor Queries 

## View their appointment schedule:
SELECT a.ApptDate, a.ApptTime, a.Reason, p.FirstName, p.LastName
FROM Appointment a
JOIN Patient p ON a.PatientID = p.PatientID
WHERE a.DoctorID = 1
ORDER BY a.ApptDate;

## View a patient's conditions:
SELECT p.FirstName, p.LastName, c.ConditionName, pc.Severity, pc.Status
FROM PatientCondition pc
JOIN Condition c ON pc.ConditionID = c.ConditionID
JOIN Patient p ON pc.PatientID = p.PatientID
WHERE p.PatientID = 1;

## View a patient's symptoms:
SELECT s.SymptomName, s.Severity, s.DateLogged
FROM SymptomLog s
WHERE s.PatientConditionID = 1
ORDER BY s.DateLogged;

## Review a patient's metrics:
SELECT p.FirstName, p.LastName, m.MetricName, m.MetricValue,
m.MetricDate
FROM Metrics m
JOIN Patient p ON m.PatientID = p.PatientID
ORDER BY m.MetricDate DESC;

## View a doctors specialty information:
SELECT d.FirstName, d.LastName, s.Title
FROM Doctor d
JOIN Specialty s ON d.SpecialtyID = s.SpecialtyID;

  
## Admin Queries

## Total number of patients:
SELECT COUNT(*) AS TotalPatients
FROM Patient;

## View all upcoming appointmetns:
SELECT a.ApptDate, p.FirstName, p.LastName, d.FirstName AS DoctorFirst
FROM Appointment a
JOIN Patient p ON a.PatientID = p.PatientID
JOIN Doctor d ON a.DoctorID = d.DoctorID
ORDER BY a.ApptDate;

## View number of doctors per specialty:
SELECT s.Title, COUNT(d.DoctorID) AS DoctorsCount
FROM Specialty s
LEFT JOIN Doctor d ON s.SpecialtyID = d.SpecialtyID
GROUP BY s.Title;

## View number of patients per studies:
SELECT s.Purpose, COUNT(ps.PatientID) AS TotalPatients
FROM Studies s
LEFT JOIN PatientStudies ps ON s.StudyID = ps.StudyID
GROUP BY s.Purpose;

##Total number of appointments in schedule:
SELECT COUNT(*) AS TotalAppointments
FROM Appointment;
