use accessori;
-- 1. Inserimento di un nuovo dipendente
INSERT INTO Dipendente (CF, nome, cognome, stipendio, posizione, Negozio)
VALUES ('DIP006', 'Marco', 'Rossi', 3000, 'Manager', 'PIVA001');

-- 2. Modificare i dati di un dipendente
UPDATE Dipendente
SET stipendio = 3500, posizione = 'Senior Manager'
WHERE CF = 'DIP006';

-- 3. Cancellazione di un dipendente
DELETE FROM Dipendente
WHERE CF = 'DIP006';

-- 4. Visualizzare la spesa totale di un cliente specifico
SELECT spesaTotale
FROM Cliente
WHERE CF = 'CF001';

-- 5. Visualizzare i prodotti che hanno un prezzo > 50 e materiale in tessuto
SELECT codice, prezzo, sconto, materiale, 'Borsa' AS tipo_prodotto
FROM Borse
WHERE prezzo > 50 AND materiale = 'stoffa'
UNION
SELECT codice, prezzo, sconto, materiale, 'Scarpa' AS tipo_prodotto
FROM Scarpe
WHERE prezzo > 50 AND materiale = 'stoffa';

-- 6. Visualizzare le informazioni sugli acquisti dei clienti e i prodotti acquistati
-- Per Borse
SELECT c.CF, c.nome, c.cognome, b.codice, b.prezzo, a.numeroPezzi, a.dataAcquisto
FROM Cliente c
JOIN AcquistaB a ON c.CF = a.Cliente
JOIN Borse b ON a.Borse = b.codice;

-- Per Scarpe
SELECT c.CF, c.nome, c.cognome, s.codice, s.prezzo, a.numeroPezzi, a.dataAcquisto
FROM Cliente c
JOIN AcquistaS a ON c.CF = a.Cliente
JOIN Scarpe s ON a.Scarpe = s.codice;

-- 7. Visualizzare la somma degli stipendi degli impiegati del negozio “PIVA001”
SELECT SUM(stipendio) AS somma_stipendi
FROM Dipendente
WHERE Negozio = 'PIVA001';

-- 8. Visualizzare la somma degli stipendi per ogni posizione
SELECT posizione, SUM(stipendio) AS somma_stipendi
FROM Dipendente
GROUP BY posizione;

-- 9. Visualizzare la posizione in cui la somma degli stipendi è > 3000
SELECT posizione
FROM Dipendente
GROUP BY posizione
HAVING SUM(stipendio) > 3000;

-- 10. Visualizzare la posizione con la somma degli stipendi più alta
SELECT posizione, SUM(stipendio) AS somma_stipendi
FROM Dipendente
GROUP BY posizione
ORDER BY somma_stipendi DESC
LIMIT 1;

-- 11. Visualizzare i nomi di clienti che hanno acquistato la borsa e il codice fiscale di quelli che hanno acquistato le scarpe
SELECT c.nome
FROM Cliente c
JOIN AcquistaB a ON c.CF = a.Cliente
UNION
SELECT c.cognome
FROM Cliente c
JOIN AcquistaS a ON c.CF = a.Cliente;

-- 12. Visualizzare i clienti che hanno acquistato tutti i prodotti esposti in un determinato negozio
SELECT C.CF, C.nome, C.cognome
FROM Cliente C
WHERE NOT EXISTS (
    SELECT B.codice
    FROM EsponeB E, Borse B
    WHERE E.Borse = B.codice AND E.Negozio = 'PIVA001' 
    AND NOT EXISTS (
        SELECT *
        FROM AcquistaB A
        WHERE A.Cliente = C.CF
        AND A.Borse = B.codice 
    )
);

