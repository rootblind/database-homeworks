SELECT * FROM Utilizator;

SELECT * FROM Comanda WHERE Status_comanda = 'In procesare';

SELECT p.ID_Produs, p.Nume, p.Pret
FROM produs_comandat pc
JOIN Produs p ON pc.ID_Produs = p.ID_Produs
WHERE pc.ID_Comanda = 1;

SELECT c.ID_Comanda, c.Data_creare, u.Nume, u.Email
FROM Comanda c
JOIN comanda_facuta_de cf ON c.ID_Comanda = cf.ID_Comanda
JOIN Utilizator u ON cf.ID_Utilizator = u.ID_Utilizator;


SELECT c.ID_Comanda, u.Nume AS Utilizator, cr.Nume AS Curier
FROM comanda_livrata_de cl
JOIN Comanda c ON cl.ID_Comanda = c.ID_Comanda
JOIN Utilizator u ON c.ID_Comanda = u.ID_Utilizator
JOIN Curier cr ON cl.ID_Curier = cr.ID_Curier
WHERE cr.Nume = 'Curier Rapid';

SELECT COUNT(*) AS Total_Comenzi FROM Comanda;


SELECT u.Nume, SUM(p.Pret) AS Total
FROM produs_comandat pc
JOIN Produs p ON pc.ID_Produs = p.ID_Produs
JOIN comanda_facuta_de cf ON pc.ID_Comanda = cf.ID_Comanda
JOIN Utilizator u ON cf.ID_Utilizator = u.ID_Utilizator
GROUP BY u.Nume;

SELECT Nume
FROM Produs
WHERE ID_Produs IN (
    SELECT ID_Produs
    FROM produs_comandat pc
    JOIN comanda_facuta_de cf ON pc.ID_Comanda = cf.ID_Comanda
    WHERE cf.ID_Utilizator = 1
);

SELECT Nume FROM Utilizator
WHERE ID_Utilizator NOT IN (SELECT ID_Utilizator FROM comanda_facuta_de);


SELECT u.Nume, COUNT(cf.ID_Comanda) AS Total_Comenzi
FROM comanda_facuta_de cf
JOIN Utilizator u ON cf.ID_Utilizator = u.ID_Utilizator
GROUP BY u.Nume
ORDER BY Total_Comenzi DESC
FETCH FIRST 3 ROWS ONLY;


SELECT c.ID_Comanda, c.Status_comanda, cr.Nume AS Curier
FROM comanda_livrata_de cl
JOIN Comanda c ON cl.ID_Comanda = c.ID_Comanda
JOIN Curier cr ON cl.ID_Curier = cr.ID_Curier
WHERE c.Status_comanda = 'Livrata';


SELECT cr.Nume, COUNT(cl.ID_Comanda) AS Total_Comenzi
FROM comanda_livrata_de cl
JOIN Curier cr ON cl.ID_Curier = cr.ID_Curier
GROUP BY cr.Nume;

SELECT DISTINCT u.Nume
FROM utilizator_wishlist uw
JOIN Utilizator u ON uw.ID_Utilizator = u.ID_Utilizator;

SELECT Nume FROM Produs WHERE Pret > 100;

