# Chronic Illness Tracking Database System

A Flask and SQL prototype for tracking chronic illness care, including patients, doctors, appointments, conditions, symptoms, health metrics, and research study participation.

## Project Overview

This project was created as a database design project focused on healthcare data management. The goal was to design a normalized relational database for chronic illness tracking and create a simple web prototype showing how different users could interact with the system.

The database includes entities such as patients, doctors, specialties, appointments, conditions, patient conditions, symptom logs, health metrics, research studies, and patient study participation.

## Features

- Normalized relational database design
- Entity Relationship Diagram
- Oracle SQL table creation and sample data
- SQL queries for patient, doctor, and admin use cases
- Flask web prototype
- Admin view for patients, doctors, appointments, and conditions
- Sample patient and doctor dashboards

## Technologies Used

- Python
- Flask
- HTML
- CSS
- Oracle SQL

## Project Structure

```text
chronic-illness-tracker/
├── app.py
├── requirements.txt
├── database/
│   ├── ChronicConditionTracker.sql
│   └── sample_queries.sql
├── templates/
│   ├── base.html
│   ├── index.html
│   ├── patients.html
│   ├── doctors.html
│   ├── appointments.html
│   ├── conditions.html
│   ├── patient_dashboard.html
│   └── doctor_dashboard.html
├── static/
│   └── style.css
└── docs/
    ├── final_writeup.pdf
    └── query_explanations.pdf
