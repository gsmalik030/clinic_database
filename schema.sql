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
);

CREATE TABLE IF NOT EXISTS treatments(
	id SERIAL PRIMARY KEY,
	type VARCHAR(50) NOT NULL,
	name VARCHAR (50) NOT NULL
);

CREATE TABLE IF NOT EXISTS invoices(
	id SERIAL PRIMARY KEY,
	total_amount DECIMAL(5, 2) NOT NULL,
	genrated_at TIMESTAMP,
	payed_at TIMESTAMP,
	medical_histories_id INT REFERENCES medical_histories(id)
);

CREATE TABLE IF NOT EXISTS invoice_items(
	id SERIAL PRIMARY KEY,
	unit_price DECIMAL (5, 2) NOT NULL,
	quantity INT NOT NULL DEFAULT 0,
	total_price DECIMAL (5, 2) NOT NULL,
	invoices_id INT REFERENCES invoices(id),
	treatments_id INT REFERENCES treatments(id)
);

CREATE TABLE IF NOT EXISTS treatments_has_medical_histories(
	treatments_id INT REFERENCES treatments(id),
	medical_histories_id INT REFERENCES medical_histories(id)
);


