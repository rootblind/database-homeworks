CREATE OR REPLACE TRIGGER ActualizareProdusComandat
AFTER INSERT ON Comanda
FOR EACH ROW
DECLARE
    id_produs NUMBER;
BEGIN
    SELECT ID_Produs INTO id_produs FROM Produs WHERE ID_Produs = :NEW.ID_Comanda;

    INSERT INTO produs_comandat (ID_Comanda, ID_Produs)
    VALUES (:NEW.ID_Comanda, id_produs);
END;
/

INSERT INTO Comanda (ID_Comanda, Data_creare, Status_comanda) VALUES (100, TO_DATE('2025-01-01', 'YYYY-MM-DD'), 'In procesare');

SELECT * FROM produs_comandat WHERE ID_Comanda=100;
