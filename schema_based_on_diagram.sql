-- creating patients table
CREATE TABLE patients (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date_of_birth DATE
);

-- Create the medical_histories table
CREATE TABLE medical_histories (
    id INT PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(255)
);

-- Add a foreign key constraint to the medical_histories table
ALTER TABLE medical_histories
ADD CONSTRAINT fk_patient
FOREIGN KEY (patient_id)
REFERENCES patients(id);