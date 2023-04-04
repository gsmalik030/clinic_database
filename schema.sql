CREATE TABLE IF NOT EXISTS patients (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	date_of_birth DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS medical_histories (
	id SERIAL PRIMARY KEY,
	admitted_at TIMESTAMP NOT NULL,
	patients_id INT NOT NULL,
	FOREIGN KEY (patients_id)
	REFERENCES patients(id),
	status VARCHAR(50)
)
