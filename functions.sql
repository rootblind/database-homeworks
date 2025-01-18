CREATE OR REPLACE FUNCTION TotalComenziUtilizator(ID_User IN NUMBER)
RETURN NUMBER IS
    Total NUMBER;
BEGIN
    SELECT SUM(p.Pret)
    INTO Total
    FROM produs_comandat pc
    JOIN Produs p ON pc.ID_Produs = p.ID_Produs
    JOIN comanda_facuta_de cf ON pc.ID_Comanda = cf.ID_Comanda
    WHERE cf.ID_Utilizator = ID_User;
    
    RETURN NVL(Total, 0);
END;
/

SELECT TotalComenziUtilizator(1) AS Total_Comenzi FROM dual;


CREATE OR REPLACE FUNCTION ComenziLivrateDeCurier(ID_Curier IN NUMBER)
RETURN NUMBER IS
    Total NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO Total
    FROM comanda_livrata_de
    WHERE ID_Curier = ID_Curier;
    
    RETURN Total;
END;
/
SELECT ComenziLivrateDeCurier(1) AS Total_Curier FROM dual