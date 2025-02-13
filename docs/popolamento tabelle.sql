use accessori;
-- Inserimento dati nella tabella Cliente
insert into Cliente (CF, nome, cognome, spesaTotale) values
('CF001', 'Mario', 'Rossi', 150.50),
('CF002', 'Luca', 'Bianchi', 200.75),
('CF003', 'Giulia', 'Verdi', 350.25),
('CF004', 'Anna', 'Neri', 420.00),
('CF005', 'Marco', 'Gialli', 180.80);

-- Inserimento dati nella tabella Telefono
insert into Telefono (numero, Cliente) values
('320123456', 'CF001'),
('329987654', 'CF002'),
('331234567', 'CF003'),
('328987654', 'CF004'),
('339123456', 'CF005');


-- Inserimento dati nella tabella Borse
insert into Borse (codice, prezzo, sconto, materiale, dimensione, tipo, numeroScomparti, lunghezzaTracolla) values
('B001', 100.99, 10, 'pelle', 30, 'a tracolla', 3, '120 cm'),
('B002', 150.50, 15, 'stoffa', 25, 'a mano', 2, '100 cm'),
('B003', 200.00, 0, 'nylon', 20, 'a spalla', 1, '110 cm'),
('B004', 80.75, 5, 'cuoio', 35, 'a tracolla', 4, '130 cm'),
('B005', 130.00, 12, 'similpelle', 28, 'a mano', 3, '115 cm');

-- Inserimento dati nella tabella Scarpe
insert into Scarpe (codice, prezzo, sconto, materiale, taglia, categoria, collezione) values
('S001', 75.50, 5, 'pelle', '42', 'sportiva', 'inverno2023'),
('S002', 85.75, 10, 'stoffa', '38', 'elegante', 'estate2024'),
('S003', 120.00, 15, 'nylon', '40', 'casual', 'autunno2023'),
('S004', 60.00, 0, 'cuoio', '44', 'sportiva', 'inverno2023'),
('S005', 95.99, 20, 'gomma', '39', 'elegante', 'primavera2024');

-- Inserimento dati nella tabella AcquistaB (acquisto borse)
insert into AcquistaB (Cliente, Borse, numeroPezzi, dataAcquisto) values
('CF001', 'B001', 2, '2024-09-01'),
('CF002', 'B003', 1, '2024-09-02'),
('CF003', 'B002', 3, '2024-09-03'),
('CF004', 'B005', 1, '2024-09-05'),
('CF005', 'B004', 2, '2024-09-06');

-- Inserimento dati nella tabella AcquistaS (acquisto scarpe)
insert into AcquistaS (Cliente, Scarpe, numeroPezzi, dataAcquisto) values
('CF001', 'S002', 1, '2024-09-07'),
('CF002', 'S003', 2, '2024-09-08'),
('CF003', 'S001', 1, '2024-09-09'),
('CF004', 'S005', 3, '2024-09-10'),
('CF005', 'S004', 1, '2024-09-11');

-- Inserimento dati nella tabella Negozio
insert into Negozio (PIVA, nome, via, numeroCivico, citta) values
('PIVA001', 'FashionShop', 'Via Roma', '10', 'Milano'),
('PIVA002', 'LuxuryStore', 'Corso Italia', '25', 'Roma'),
('PIVA003', 'TrendyOutlet', 'Via Napoli', '15', 'Napoli'),
('PIVA004', 'ChicBoutique', 'Via Firenze', '8', 'Firenze'),
('PIVA005', 'StyleCenter', 'Viale Torino', '12', 'Torino');

-- Inserimento dati nella tabella EsponeB (borse esposte nei negozi)
insert into EsponeB (Negozio, Borse) values
('PIVA001', 'B001'),
('PIVA002', 'B002'),
('PIVA003', 'B003'),
('PIVA004', 'B004'),
('PIVA005', 'B005');

-- Inserimento dati nella tabella EsponeS (scarpe esposte nei negozi)
insert into EsponeS (Negozio, Scarpe) values
('PIVA001', 'S001'),
('PIVA002', 'S002'),
('PIVA003', 'S003'),
('PIVA004', 'S004'),
('PIVA005', 'S005');

-- Inserimento dati nella tabella Dipendente
insert into Dipendente (CF, nome, cognome, stipendio, posizione, Negozio) values
('DIP001', 'Luca', 'Neri', 1500, 'commesso', 'PIVA001'),
('DIP002', 'Gianni', 'Rossi', 1800, 'store manager', 'PIVA002'),
('DIP003', 'Maria', 'Bianchi', 1300, 'cassiere', 'PIVA003'),
('DIP004', 'Sara', 'Verdi', 1700, 'responsabile', 'PIVA004'),
('DIP005', 'Marco', 'Blu', 1600, 'commesso', 'PIVA005');
