-- Use hospitals database
USE hospitals_db;

-- Drop LAB_RESULTS table if it already exists
DROP TABLE IF EXISTS LAB_RESULTS;

-- Create LAB_RESULTS table
CREATE TABLE LAB_RESULTS (
    lab_results_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  
    lab_test VARCHAR(255) NOT NULL,                         
    lab_date DATE NOT NULL,                                 
    lab_result VARCHAR(255),                                
    patient_id INT,                                            -- Foreign key to PATIENTS table
    doctor_id INT,                                             -- Foreign key to DOCTORS table
    FOREIGN KEY (patient_id) REFERENCES PATIENTS(patient_id),  -- Link to patient_id in PATIENTS table
    FOREIGN KEY (doctor_id) REFERENCES DOCTORS(doctor_id)      -- Link to doctor_id in DOCTORS table
);

-- Verify that the LAB_RESULTS table was created successfully
SELECT * FROM LAB_RESULTS;
