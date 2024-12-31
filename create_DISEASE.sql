-- Use hospitals database
USE hospitals_db;

-- Drop DISEASE table if it already exists
DROP TABLE IF EXISTS DISEASE;

-- Create DISEASE table
CREATE TABLE DISEASE (
    disease_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  
    disease_name VARCHAR(255) NOT NULL,                
    disease_treatment TEXT,                             
    doctor_id INT,                                          -- Foreign key to DOCTORS table (specialist doctor)
    med_id INT,                                             -- Foreign key to MEDICATIONS table (treatment medication)
    FOREIGN KEY (doctor_id) REFERENCES DOCTORS(doctor_id),  -- Link to doctor_id in DOCTORS table
    FOREIGN KEY (med_id) REFERENCES MEDICATIONS(med_id)     -- Link to med_id in MEDICATIONS table
);

-- Verify that the DISEASE table was created successfully
SELECT * FROM DISEASE;
