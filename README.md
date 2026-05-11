# Chronic Illness Tracking Database System

A Flask and SQL prototype for tracking chronic illness care, including patients, doctors, appointments, conditions, symptoms, health metrics, and research study participation.

---

## Project Overview

This project was created as a database design project focused on healthcare data management. The goal was to design a normalized relational database for chronic illness tracking and create a simple web prototype showing how different users could interact with the system.

The database includes entities such as patients, doctors, specialties, appointments, conditions, patient conditions, symptom logs, health metrics, research studies, and patient study participation.

The Flask prototype demonstrates how administrators, doctors, and patients could interact with the system through separate dashboard views.

---

## Features

- Fully normalized relational database design
- Entity Relationship Diagram (ERD)
- Oracle SQL table creation scripts
- Sample healthcare mock data
- SQL queries for patient, doctor, and administrator use cases
- Flask-based front-end prototype
- Admin dashboard
- Patient dashboard
- Doctor dashboard
- Appointment and condition tracking

---

## Technologies Used

- Python
- Flask
- HTML
- CSS
- Oracle SQL

---

## Project Structure

## Project Structure

```text
chronic-illness-tracker/
├── app.py
├── requirements.txt
├── ChronicConditionTracker.sql
├── templates/
│   ├── base.html
│   ├── index.html
│   ├── patients.html
│   ├── doctors.html
│   ├── appointments.html
│   ├── conditions.html
│   ├── patient_dashboard.html
│   └── doctor_dashboard.html
└── static/
    └── style.css
```

---

## Database Design

The database was designed using a normalized relational structure and includes the following core entities:

- Patient
- Doctor
- Specialty
- Appointment
- Condition
- PatientCondition
- SymptomLog
- Metrics
- Studies
- PatientStudies

The project demonstrates:
- Primary and foreign key relationships
- Junction tables
- Third Normal Form (3NF)
- Multi-table JOIN queries
- Healthcare-oriented database organization

---

## Example SQL Queries

### View a Patient's Diagnoses

```sql
SELECT c.ConditionName, pc.DiagnosisDate, pc.Severity, pc.Status
FROM PatientCondition pc
JOIN Condition c ON pc.ConditionID = c.ConditionID
WHERE pc.PatientID = 1;
```

### View Upcoming Appointments

```sql
SELECT a.ApptDate, p.FirstName, p.LastName, d.FirstName AS DoctorFirst
FROM Appointment a
JOIN Patient p ON a.PatientID = p.PatientID
JOIN Doctor d ON a.DoctorID = d.DoctorID
ORDER BY a.ApptDate;
```

---

## How to Run the Project

### 1. Clone the Repository

```bash
git clone https://github.com/YOUR-USERNAME/chronic-illness-tracker.git
cd chronic-illness-tracker
```

### 2. Install Dependencies

```bash
pip install -r requirements.txt
```

### 3. Run the Flask Application

```bash
python app.py
```

### 4. Open in Browser

```text
http://127.0.0.1:5000/
```

---

## Current Limitations

This project is currently a prototype and has several limitations:

- The Flask interface uses mock data
- The Flask application is not directly connected to Oracle
- No authentication or user login system
- No encryption or HIPAA-compliant security
- No live patient data

Despite these limitations, the project demonstrates database normalization, SQL query design, and front-end prototyping for healthcare applications.

---

## Future Improvements

- Connect Flask directly to Oracle or PostgreSQL
- Add secure authentication and authorization
- Implement role-based access control
- Add data entry forms
- Add search and filtering functionality
- Improve dashboard visualizations
- Add HIPAA-focused security protections
- Deploy as a cloud-hosted web application

---

## Author

Isabel Bennett

MS Data Science Student  
University of St. Thomas  
Interested in healthcare data systems, data engineering, and healthcare technology.
