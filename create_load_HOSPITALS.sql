-- Create hospitals database (if it doesn't exist - use create_hospitals_db.sql)
CREATE DATABASE IF NOT EXISTS hospitals_db;

-- Use hospitals database
USE hospitals_db;

-- Drop HOSPITALS table if it already exists
DROP TABLE IF EXISTS HOSPITALS;

-- Create HOSPITALS table
CREATE TABLE HOSPITALS (
    hospital_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    hospital_name VARCHAR(255) NOT NULL UNIQUE,
    address TEXT NOT NULL,
    size INT NOT NULL,
    type VARCHAR(100),
    accreditation_year YEAR,
    emergency_service BOOLEAN
);

-- Load the data from cleaned CSV file containing hospitals data
LOAD DATA LOCAL INFILE '/path/to/cleaned_hospitals.csv' -- used the cleaned_hospitals CSV file
  -- replace with server/local machine path to the CSV file (e.g. mine was cd ~/Downloads)
INTO TABLE HOSPITALS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(hospital_name, address, size, type, emergency_service, accreditation_year);

-- Verify that data was imported successfully
SELECT * FROM HOSPITALS;
