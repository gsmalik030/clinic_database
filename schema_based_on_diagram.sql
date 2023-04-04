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
	status VARCHAR(50),
	INDEX fk_medical_histories_patients(patients_id)
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
	medical_histories_id INT REFERENCES medical_histories(id),
	INDEX fk_invoices_medical_histories_idx(medical_histories_id)
);

CREATE TABLE IF NOT EXISTS invoice_items(
	id SERIAL PRIMARY KEY,
	unit_price DECIMAL (5, 2) NOT NULL,
	quantity INT NOT NULL DEFAULT 0,
	total_price DECIMAL (5, 2) NOT NULL,
	invoices_id INT REFERENCES invoices(id),
	treatments_id INT REFERENCES treatments(id),
	INDEX fk_invoice_items_invoices_idx(invoices_id),
	INDEX fk_invoice_items_treatments_idx(treatments_id)
);

CREATE TABLE IF NOT EXISTS treatments_has_medical_histories(
	treatments_id INT REFERENCES treatments(id),
	medical_histories_id INT REFERENCES medical_histories(id),
	INDEX fk_treatments_has_medical_histories_medical_histories_idx(medical_histories_id),
	INDEX fk_treatments_has_medical_histories_treatments1_idx(treatments_Id)
);

CREATE INDEX IF NOT EXISTS fk_invoice_items_invoices_idx ON  invoice_items(invoices_id);
CREATE INDEX IF NOT EXISTS fk_invoice_items_treatments_idx ON  invoice_items(treatments_id);
CREATE INDEX IF NOT EXISTS fk_invoices_medical_histories_idx ON  invoices(medical_histories_id);
CREATE INDEX IF NOT EXISTS fk_treatments_has_medical_histories_medical_histories_idx ON treatments_has_medical_histories(medical_histories_id);
CREATE INDEX IF NOT EXISTS fk_treatments_has_medical_histories_treatments1_idx ON treatments_has_medical_histories(treatments_Id)
