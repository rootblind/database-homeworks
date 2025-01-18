CREATE OR REPLACE PROCEDURE UpdateStatusComanda(
    ID_Comanda IN NUMBER, 
    Nou_Status IN VARCHAR2
) IS
BEGIN
    UPDATE Comanda
    SET Status_comanda = Nou_Status
    WHERE ID_Comanda = ID_Comanda;
    
    COMMIT;
END;
/
EXEC UpdateStatusComanda(1, 'In asteptare');
SELECT * FROM Comanda WHERE ID_Comanda=1;


CREATE OR REPLACE PROCEDURE AdaugaProdus (
    id IN NUMBER,
    pret IN NUMBER,
    nume IN VARCHAR2,
    stoc IN NUMBER
) IS
BEGIN
    INSERT INTO Produs (ID_Produs, Pret, Nume, Stoc)
    VALUES (id, pret, nume, stoc);
END;
/
EXEC AdaugaProdus(100, 100, 'Scaun', 20);
SELECT * FROM Produs WHERE ID_Produs=100;
