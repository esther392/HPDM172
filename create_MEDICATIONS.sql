-- Use hospitals database
USE hospitals_db;

-- Drop MEDICATIONS table if it already exists
DROP TABLE IF EXISTS MEDICATIONS;

-- Create MEDICATIONS table
CREATE TABLE MEDICATIONS (
    med_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,  
    med_name VARCHAR(255) NOT NULL,                   
    med_manufacturer VARCHAR(255),                    
    med_type VARCHAR(100)                             -- Type of medication (e.g., Tablet, Syrup, etc.)
);

-- Verify that the MEDICATIONS table was created successfully
SELECT * FROM MEDICATIONS;
