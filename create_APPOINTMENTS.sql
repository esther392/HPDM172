-- Use hospitals database
USE hospitals_db;

-- Drop APPOINTMENTS table if it already exists
DROP TABLE IF EXISTS APPOINTMENTS;

-- Create APPOINTMENTS table
CREATE TABLE APPOINTMENTS (
    appt_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY, 
    appt_date DATETIME,                              
    appt_purpose VARCHAR(100),                                 -- Type of appointment (e.g., consultation, follow-up)
    patient_id INT,                                            -- Foreign key to PATIENTS table
    doctor_id INT,                                             -- Foreign key to DOCTORS table
    FOREIGN KEY (patient_id) REFERENCES PATIENTS(patient_id),  -- Link to patient_id in PATIENTS table
    FOREIGN KEY (doctor_id) REFERENCES DOCTORS(doctor_id)      -- Link to doctor_id in DOCTORS table
);

-- Verify that the APPOINTMENTS table was created successfully
SELECT * FROM APPOINTMENTS;
