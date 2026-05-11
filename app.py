from flask import Flask, render_template

app = Flask(__name__)

# My mock data from Oracle

patients = [
    (1, "Sarah", "Bennett", "F"),
    (2, "Michael", "Lee", "M"),
    (3, "Emma", "Johnson", "F")
]

doctors = [
    ("Alice", "Smith", "Endocrinology"),
    ("Brian", "Lee", "Pulmonology"),
    ("Carla", "Nguyen", "Cardiology")
]

appointments = [
    ("Sarah", "Bennett", "Alice", "Smith", "2025-12-10", "Diabetes follow-up"),
    ("Michael", "Lee", "Brian", "Lee", "2025-12-11", "Asthma check"),
    ("Emma", "Johnson", "Carla", "Nguyen", "2025-12-12", "Heart screening")
]

conditions = [
    ("Sarah", "Bennett", "Type 1 Diabetes", "Moderate", "Active"),
    ("Michael", "Lee", "Asthma", "Mild", "Active"),
    ("Emma", "Johnson", "Hypertension", "Severe", "Active")
]

# Routes

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/patients")
def patients_page():
    return render_template("patients.html", patients=patients)

@app.route("/doctors")
def doctors_page():
    return render_template("doctors.html", doctors=doctors)

@app.route("/appointments")
def appointments_page():
    return render_template("appointments.html", appointments=appointments)

@app.route("/conditions")
def conditions_page():
    return render_template("conditions.html", conditions=conditions)

@app.route("/patient")
def patient_dashboard():
    #Sarah Bennett patient example page
    patient_info = ("Sarah", "Bennett", "F")

    patient_conditions = [
        ("Type 1 Diabetes", "Moderate", "Active")
    ]

    patient_appointments = [
        ("2025-12-10", "Diabetes follow-up", "Alice Smith")
    ]

    return render_template(
        "patient_dashboard.html",
        patient=patient_info,
        conditions=patient_conditions,
        appointments=patient_appointments
    )

@app.route("/doctor")
def doctor_dashboard():
    #Alice Smith doctor exapmle page
    doctor_info = ("Alice", "Smith", "Endocrinology")

    doctor_appointments = [
        ("2025-12-10", "Sarah Bennett", "Diabetes follow-up")
    ]

    doctor_patients = [
        ("Sarah", "Bennett", "Type 1 Diabetes", "Moderate")
    ]

    return render_template(
        "doctor_dashboard.html",
        doctor=doctor_info,
        appointments=doctor_appointments,
        patients=doctor_patients
    )

if __name__ == "__main__":
    app.run(debug=True)
