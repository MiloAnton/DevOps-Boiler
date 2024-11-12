CREATE TABLE cars (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    available BOOLEAN
);

INSERT INTO cars (name, available) VALUES 
('Toyota Camry', true),
('Honda Accord', false),
('Ford Mustang', true),
('Chevrolet Corvette', false),
('Dodge Charger', true),
('Jeep Wrangler', false),
('Tesla Model S', true),
('Nissan Altima', false),
('Subaru Outback', true),
('Volkswagen Jetta', false);
