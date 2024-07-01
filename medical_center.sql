DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors 
(
  id SERIAL PRIMARY KEY,
  doctor_name TEXT NOT NULL,
  specialty TEXT NOT NULL,
  phone_number FLOAT UNIQUE NOT NULL
);

CREATE TABLE patients 
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  insurance TEXT,
  primary_care INTEGER REFERENCES doctors(id)
);

CREATE TABLE diseases 
(
  id SERIAL PRIMARY KEY,
  disease_name TEXT NOT NULL
);

CREATE TABLE visits 
(
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER REFERENCES doctors(id),
  patient_id INTEGER REFERENCES patients(id),
  disease_id INTEGER REFERENCES diseases(id),
  date DATE NOT NULL
);

INSERT INTO doctors 
(doctor_name, specialty, phone_number) 
VALUES 
  ('Fredrickson', 'Cardiologist', 5551234),
  ('Smith', 'Surgeon', 55576655),
  ('Harrison', 'Family Practice', 5551948),
  ('Gomez', 'Family Practice', 3429078),
  ('Garrett', 'Neurologist', 6459890);

INSERT INTO patients 
(first_name, last_name, insurance, primary_care) 
VALUES
  ('Jimmy', 'Smith', 'Aetna', 2),
  ('Taylor', 'Green', 'Aetna', 1),
  ('Harriet', 'Smith', 'Kaiser', 3),
  ('Larry', 'Nickles', 'Cigna', 4),
  ('Peter', 'Ghost', 'none', 5),
  ('Linda', 'Driver', 'Kaiser', 3);

INSERT INTO diseases 
(disease_name) 
VALUES  
  ('Cardiomyopathy'),
  ('Flu'),
  ('Brain tumor'),
  ('Anemia'),
  ('Allergic reaction');

INSERT INTO visits 
(doctor_id, patient_id, disease_id, "date") 
VALUES
  (2, 4, 3, '2024-1-23'),
  (1, 2, 4, '2024-1-29'),
  (4, 3, 1, '2024-2-24');