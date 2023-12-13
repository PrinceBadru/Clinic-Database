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

-- Create invoice_items table
CREATE TABLE invoice_items (
    id INT PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT
);

-- Add a foreign key constraint to the invoice_items table
ALTER TABLE invoice_items
ADD CONSTRAINT fk_treatment
FOREIGN KEY (treatment_id)
REFERENCES treatment(id);

-- Create the invoices table
CREATE TABLE invoices (
    id INT PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT 
);


ALTER TABLE invoice_items
ADD CONSTRAINT fk_invoice
FOREIGN KEY (invoice_id)
REFERENCES invoices(id);

ALTER TABLE invoices
ADD CONSTRAINT fk_medical_history
FOREIGN KEY (medical_history_id)
REFERENCES medical_histories(id);