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

-- Create the treatment table
CREATE TABLE treatment (
    id INT PRIMARY KEY,
    type VARCHAR(55),
    name VARCHAR(255) NOT NULL,    
);

--Add a foreign key constraint to treament table
ALTER TABLE treatment 
ADD CONSTRAINT fk_medical_histories
FOREIGN KEY (id)
REFERENCES medical_histories(id);
