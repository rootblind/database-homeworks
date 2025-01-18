CREATE TABLE Produs (
    ID_Produs NUMBER PRIMARY KEY,
    Pret NUMBER(10, 2),
    Nume VARCHAR2(100),
    Stoc NUMBER
);

CREATE TABLE Categorie (
    ID_Categorie NUMBER PRIMARY KEY,
    Nume VARCHAR2(100)
);

CREATE TABLE produs_din_categorie (
    ID_Produs NUMBER REFERENCES Produs(ID_Produs),
    ID_Categorie NUMBER REFERENCES Categorie(ID_Categorie),
    PRIMARY KEY (ID_Produs, ID_Categorie)
);

CREATE TABLE Furnizor (
    ID_Furnizor NUMBER PRIMARY KEY,
    Nume VARCHAR2(100),
    Telefon VARCHAR2(12),
    Adresa VARCHAR2(100)
);

CREATE TABLE produs_furnizat(
    ID_Produs NUMBER REFERENCES Produs(ID_Produs),
    ID_Furnizor NUMBER REFERENCES Furnizor(ID_Furnizor),
    PRIMARY KEY (ID_Furnizor, ID_Produs)
);

CREATE TABLE Wishlist(
    ID_Wishlist NUMBER PRIMARY KEY,
    Data_creare DATE
);

CREATE TABLE produs_din_wishlist(
    ID_Produs NUMBER REFERENCES Produs(ID_Produs),
    ID_Wishlist NUMBER REFERENCES Wishlist(ID_Wishlist),
    PRIMARY KEY (ID_Produs, ID_Wishlist)
);

CREATE TABLE Cos_cumparaturi(
    ID_cos NUMBER PRIMARY KEY,
    Data_creare DATE
);

CREATE TABLE produs_in_cos(
    ID_Produs NUMBER REFERENCES Produs(ID_Produs),
    ID_cos NUMBER REFERENCES Cos_cumparaturi(ID_cos),
    PRIMARY KEY (ID_Produs, ID_cos)
);

CREATE TABLE Comanda(
    ID_Comanda NUMBER PRIMARY KEY,
    Data_creare DATE,
    Status_comanda VARCHAR2(100)
);

CREATE TABLE produs_comandat(
    ID_Comanda NUMBER REFERENCES Comanda(ID_Comanda),
    ID_Produs NUMBER REFERENCES Produs(ID_Produs),
    PRIMARY KEY (ID_Comanda, ID_Produs)
);

CREATE TABLE Utilizator(
    ID_Utilizator NUMBER PRIMARY KEY,
    Telefon VARCHAR2(12),
    Nume VARCHAR2(100),
    Email VARCHAR2(100),
    Parola VARCHAR2(255),
    Adresa VARCHAR2(100)
);

CREATE TABLE utilizator_wishlist(
    ID_Wishlist NUMBER REFERENCES Wishlist(ID_Wishlist),
    ID_Utilizator NUMBER REFERENCES Utilizator(ID_Utilizator),
    PRIMARY KEY (ID_Wishlist, ID_Utilizator)
);

CREATE TABLE Administrator(
    admin_id NUMBER REFERENCES Utilizator(ID_Utilizator),
    PRIMARY KEY (admin_id)
);

CREATE TABLE utilizatorul_are_cos (
    ID_Utilizator NUMBER REFERENCES Utilizator(ID_Utilizator),
    ID_cos NUMBER REFERENCES Cos_cumparaturi(ID_cos),
    PRIMARY KEY (ID_Utilizator, ID_cos)
);

CREATE TABLE comanda_facuta_de(
    ID_Utilizator NUMBER REFERENCES Utilizator(ID_Utilizator),
    ID_Comanda NUMBER REFERENCES Comanda(ID_Comanda),
    PRIMARY KEY (ID_Utilizator, ID_Comanda)
);

CREATE TABLE Curier(
    ID_Curier NUMBER PRIMARY KEY,
    Nume VARCHAR2(100),
    Telefon VARCHAR2(12),
    Adresa VARCHAR2(100)
);

CREATE TABLE comanda_efectuata(
    ID_Utilizator NUMBER REFERENCES Utilizator(ID_Utilizator),
    ID_Comanda NUMBER REFERENCES Comanda(ID_Comanda),
    ID_Curier NUMBER REFERENCES Curier(ID_Curier),
    PRIMARY KEY (ID_Utilizator, ID_Comanda, ID_Curier)
);

CREATE TABLE comanda_livrata_de(
    ID_Curier NUMBER REFERENCES Curier(ID_Curier),
    ID_Comanda NUMBER REFERENCES Comanda(ID_Comanda),
    PRIMARY KEY (ID_Curier, ID_Comanda)
);



INSERT INTO Produs VALUES (1, 49.99, 'Tricou', 100);
INSERT INTO Produs VALUES (2, 79.99, 'Pantaloni', 50);
INSERT INTO Produs VALUES (3, 19.99, 'Sosete', 200);
INSERT INTO Produs VALUES (4, 299.99, 'Geaca', 30);
INSERT INTO Produs VALUES (5, 99.99, 'Adidasi', 80);
INSERT INTO Produs VALUES (6, 39.99, 'Sapca', 120);
INSERT INTO Produs VALUES (7, 149.99, 'Pulover', 60);
INSERT INTO Produs VALUES (8, 59.99, 'Curea', 70);
INSERT INTO Produs VALUES (9, 89.99, 'Rochie', 40);
INSERT INTO Produs VALUES (10, 199.99, 'Costum', 25);
INSERT INTO Produs VALUES (11, 29.99, 'Manusi', 90);
INSERT INTO Produs VALUES (12, 15.99, 'Fular', 150);
INSERT INTO Produs VALUES (13, 249.99, 'Pantofi', 35);
INSERT INTO Produs VALUES (14, 10.99, 'Papuci', 100);
INSERT INTO Produs VALUES (15, 399.99, 'Palton', 20);
INSERT INTO Produs VALUES (16, 59.99, 'Camasa', 80);
INSERT INTO Produs VALUES (17, 199.99, 'Sacou', 45);
INSERT INTO Produs VALUES (18, 499.99, 'Ceas', 15);
INSERT INTO Produs VALUES (19, 25.99, 'Bluza', 70);
INSERT INTO Produs VALUES (20, 9.99, 'Cravata', 60);

INSERT INTO Categorie VALUES (1, 'Imbracaminte');
INSERT INTO Categorie VALUES (2, 'Incaltaminte');
INSERT INTO Categorie VALUES (3, 'Accesorii');
INSERT INTO Categorie VALUES (4, 'Outerwear');
INSERT INTO Categorie VALUES (5, 'Formale');

INSERT INTO produs_din_categorie VALUES (1, 1);
INSERT INTO produs_din_categorie VALUES (2, 1);
INSERT INTO produs_din_categorie VALUES (3, 1);
INSERT INTO produs_din_categorie VALUES (4, 4);
INSERT INTO produs_din_categorie VALUES (5, 2);
INSERT INTO produs_din_categorie VALUES (6, 3);
INSERT INTO produs_din_categorie VALUES (7, 1);
INSERT INTO produs_din_categorie VALUES (8, 3);
INSERT INTO produs_din_categorie VALUES (9, 1);
INSERT INTO produs_din_categorie VALUES (10, 5);
INSERT INTO produs_din_categorie VALUES (11, 3);
INSERT INTO produs_din_categorie VALUES (12, 3);
INSERT INTO produs_din_categorie VALUES (13, 2);
INSERT INTO produs_din_categorie VALUES (14, 2);
INSERT INTO produs_din_categorie VALUES (15, 4);
INSERT INTO produs_din_categorie VALUES (16, 1);
INSERT INTO produs_din_categorie VALUES (17, 5);
INSERT INTO produs_din_categorie VALUES (18, 3);
INSERT INTO produs_din_categorie VALUES (19, 1);
INSERT INTO produs_din_categorie VALUES (20, 3);

INSERT INTO Furnizor VALUES (1, 'Furnizor1', '0721000000', 'Adresa 1');
INSERT INTO Furnizor VALUES (2, 'Furnizor2', '0722000000', 'Adresa 2');
INSERT INTO Furnizor VALUES (3, 'Furnizor3', '0723000000', 'Adresa 3');
INSERT INTO Furnizor VALUES (4, 'Furnizor4', '0724000000', 'Adresa 4');
INSERT INTO Furnizor VALUES (5, 'Furnizor5', '0725000000', 'Adresa 5');
INSERT INTO Furnizor VALUES (6, 'Furnizor6', '0726000000', 'Adresa 6');
INSERT INTO Furnizor VALUES (7, 'Furnizor7', '0727000000', 'Adresa 7');
INSERT INTO Furnizor VALUES (8, 'Furnizor8', '0728000000', 'Adresa 8');
INSERT INTO Furnizor VALUES (9, 'Furnizor9', '0729000000', 'Adresa 9');
INSERT INTO Furnizor VALUES (10, 'Furnizor10', '0730000000', 'Adresa 10');
INSERT INTO Furnizor VALUES (11, 'Furnizor11', '0731000000', 'Adresa 11');
INSERT INTO Furnizor VALUES (12, 'Furnizor12', '0732000000', 'Adresa 12');
INSERT INTO Furnizor VALUES (13, 'Furnizor13', '0733000000', 'Adresa 13');
INSERT INTO Furnizor VALUES (14, 'Furnizor14', '0734000000', 'Adresa 14');
INSERT INTO Furnizor VALUES (15, 'Furnizor15', '0735000000', 'Adresa 15');
INSERT INTO Furnizor VALUES (16, 'Furnizor16', '0736000000', 'Adresa 16');
INSERT INTO Furnizor VALUES (17, 'Furnizor17', '0737000000', 'Adresa 17');
INSERT INTO Furnizor VALUES (18, 'Furnizor18', '0738000000', 'Adresa 18');
INSERT INTO Furnizor VALUES (19, 'Furnizor19', '0739000000', 'Adresa 19');
INSERT INTO Furnizor VALUES (20, 'Furnizor20', '0740000000', 'Adresa 20');

INSERT INTO produs_furnizat VALUES (1, 1);
INSERT INTO produs_furnizat VALUES (2, 2);
INSERT INTO produs_furnizat VALUES (3, 3);
INSERT INTO produs_furnizat VALUES (4, 4);
INSERT INTO produs_furnizat VALUES (5, 5);
INSERT INTO produs_furnizat VALUES (6, 6);
INSERT INTO produs_furnizat VALUES (7, 7);
INSERT INTO produs_furnizat VALUES (8, 8);
INSERT INTO produs_furnizat VALUES (9, 9);
INSERT INTO produs_furnizat VALUES (10, 10);
INSERT INTO produs_furnizat VALUES (11, 11);
INSERT INTO produs_furnizat VALUES (12, 12);
INSERT INTO produs_furnizat VALUES (13, 13);
INSERT INTO produs_furnizat VALUES (14, 14);
INSERT INTO produs_furnizat VALUES (15, 15);
INSERT INTO produs_furnizat VALUES (16, 16);
INSERT INTO produs_furnizat VALUES (17, 17);
INSERT INTO produs_furnizat VALUES (18, 18);
INSERT INTO produs_furnizat VALUES (19, 19);
INSERT INTO produs_furnizat VALUES (20, 20);

INSERT INTO Wishlist VALUES (1, TO_DATE('2025-01-01', 'YYYY-MM-DD'));
INSERT INTO Wishlist VALUES (2, TO_DATE('2025-01-02', 'YYYY-MM-DD'));
INSERT INTO Wishlist VALUES (3, TO_DATE('2025-01-03', 'YYYY-MM-DD'));
INSERT INTO Wishlist VALUES (4, TO_DATE('2025-01-04', 'YYYY-MM-DD'));
INSERT INTO Wishlist VALUES (5, TO_DATE('2025-01-05', 'YYYY-MM-DD'));
INSERT INTO Wishlist VALUES (6, TO_DATE('2025-01-06', 'YYYY-MM-DD'));
INSERT INTO Wishlist VALUES (7, TO_DATE('2025-01-07', 'YYYY-MM-DD'));
INSERT INTO Wishlist VALUES (8, TO_DATE('2025-01-08', 'YYYY-MM-DD'));
INSERT INTO Wishlist VALUES (9, TO_DATE('2025-01-09', 'YYYY-MM-DD'));
INSERT INTO Wishlist VALUES (10, TO_DATE('2025-01-10', 'YYYY-MM-DD'));
INSERT INTO Wishlist VALUES (11, TO_DATE('2025-01-11', 'YYYY-MM-DD'));
INSERT INTO Wishlist VALUES (12, TO_DATE('2025-01-12', 'YYYY-MM-DD'));
INSERT INTO Wishlist VALUES (13, TO_DATE('2025-01-13', 'YYYY-MM-DD'));
INSERT INTO Wishlist VALUES (14, TO_DATE('2025-01-14', 'YYYY-MM-DD'));
INSERT INTO Wishlist VALUES (15, TO_DATE('2025-01-15', 'YYYY-MM-DD'));
INSERT INTO Wishlist VALUES (16, TO_DATE('2025-01-16', 'YYYY-MM-DD'));
INSERT INTO Wishlist VALUES (17, TO_DATE('2025-01-17', 'YYYY-MM-DD'));
INSERT INTO Wishlist VALUES (18, TO_DATE('2025-01-18', 'YYYY-MM-DD'));
INSERT INTO Wishlist VALUES (19, TO_DATE('2025-01-19', 'YYYY-MM-DD'));
INSERT INTO Wishlist VALUES (20, TO_DATE('2025-01-20', 'YYYY-MM-DD'));

INSERT INTO produs_din_wishlist VALUES (1, 1);
INSERT INTO produs_din_wishlist VALUES (2, 1);
INSERT INTO produs_din_wishlist VALUES (3, 2);
INSERT INTO produs_din_wishlist VALUES (4, 2);
INSERT INTO produs_din_wishlist VALUES (5, 3);
INSERT INTO produs_din_wishlist VALUES (6, 3);
INSERT INTO produs_din_wishlist VALUES (7, 4);
INSERT INTO produs_din_wishlist VALUES (8, 4);
INSERT INTO produs_din_wishlist VALUES (9, 5);
INSERT INTO produs_din_wishlist VALUES (10, 5);
INSERT INTO produs_din_wishlist VALUES (11, 6);
INSERT INTO produs_din_wishlist VALUES (12, 6);
INSERT INTO produs_din_wishlist VALUES (13, 7);
INSERT INTO produs_din_wishlist VALUES (14, 7);
INSERT INTO produs_din_wishlist VALUES (15, 8);
INSERT INTO produs_din_wishlist VALUES (16, 8);
INSERT INTO produs_din_wishlist VALUES (17, 9);
INSERT INTO produs_din_wishlist VALUES (18, 9);
INSERT INTO produs_din_wishlist VALUES (19, 10);
INSERT INTO produs_din_wishlist VALUES (20, 10);

INSERT INTO Cos_cumparaturi VALUES (1, TO_DATE('2025-01-01', 'YYYY-MM-DD'));
INSERT INTO Cos_cumparaturi VALUES (2, TO_DATE('2025-01-02', 'YYYY-MM-DD'));
INSERT INTO Cos_cumparaturi VALUES (3, TO_DATE('2025-01-03', 'YYYY-MM-DD'));
INSERT INTO Cos_cumparaturi VALUES (4, TO_DATE('2025-01-04', 'YYYY-MM-DD'));
INSERT INTO Cos_cumparaturi VALUES (5, TO_DATE('2025-01-05', 'YYYY-MM-DD'));
INSERT INTO Cos_cumparaturi VALUES (6, TO_DATE('2025-01-06', 'YYYY-MM-DD'));
INSERT INTO Cos_cumparaturi VALUES (7, TO_DATE('2025-01-07', 'YYYY-MM-DD'));
INSERT INTO Cos_cumparaturi VALUES (8, TO_DATE('2025-01-08', 'YYYY-MM-DD'));
INSERT INTO Cos_cumparaturi VALUES (9, TO_DATE('2025-01-09', 'YYYY-MM-DD'));
INSERT INTO Cos_cumparaturi VALUES (10, TO_DATE('2025-01-10', 'YYYY-MM-DD'));
INSERT INTO Cos_cumparaturi VALUES (11, TO_DATE('2025-01-11', 'YYYY-MM-DD'));
INSERT INTO Cos_cumparaturi VALUES (12, TO_DATE('2025-01-12', 'YYYY-MM-DD'));
INSERT INTO Cos_cumparaturi VALUES (13, TO_DATE('2025-01-13', 'YYYY-MM-DD'));
INSERT INTO Cos_cumparaturi VALUES (14, TO_DATE('2025-01-14', 'YYYY-MM-DD'));
INSERT INTO Cos_cumparaturi VALUES (15, TO_DATE('2025-01-15', 'YYYY-MM-DD'));
INSERT INTO Cos_cumparaturi VALUES (16, TO_DATE('2025-01-16', 'YYYY-MM-DD'));
INSERT INTO Cos_cumparaturi VALUES (17, TO_DATE('2025-01-17', 'YYYY-MM-DD'));
INSERT INTO Cos_cumparaturi VALUES (18, TO_DATE('2025-01-18', 'YYYY-MM-DD'));
INSERT INTO Cos_cumparaturi VALUES (19, TO_DATE('2025-01-19', 'YYYY-MM-DD'));
INSERT INTO Cos_cumparaturi VALUES (20, TO_DATE('2025-01-20', 'YYYY-MM-DD'));


INSERT INTO produs_in_cos VALUES (1, 1);
INSERT INTO produs_in_cos VALUES (2, 1);
INSERT INTO produs_in_cos VALUES (3, 2);
INSERT INTO produs_in_cos VALUES (4, 2);
INSERT INTO produs_in_cos VALUES (5, 3);
INSERT INTO produs_in_cos VALUES (6, 3);
INSERT INTO produs_in_cos VALUES (7, 4);
INSERT INTO produs_in_cos VALUES (8, 4);
INSERT INTO produs_in_cos VALUES (9, 5);
INSERT INTO produs_in_cos VALUES (10, 5);
INSERT INTO produs_in_cos VALUES (11, 6);
INSERT INTO produs_in_cos VALUES (12, 6);
INSERT INTO produs_in_cos VALUES (13, 7);
INSERT INTO produs_in_cos VALUES (14, 7);
INSERT INTO produs_in_cos VALUES (15, 8);
INSERT INTO produs_in_cos VALUES (16, 8);
INSERT INTO produs_in_cos VALUES (17, 9);
INSERT INTO produs_in_cos VALUES (18, 9);
INSERT INTO produs_in_cos VALUES (19, 10);
INSERT INTO produs_in_cos VALUES (20, 10);



INSERT INTO Comanda (ID_Comanda, Data_creare, Status_comanda) VALUES (1, TO_DATE('2025-01-01', 'YYYY-MM-DD'), 'In procesare');
INSERT INTO Comanda (ID_Comanda, Data_creare, Status_comanda) VALUES (2, TO_DATE('2025-01-02', 'YYYY-MM-DD'), 'Livrata');
INSERT INTO Comanda (ID_Comanda, Data_creare, Status_comanda) VALUES (3, TO_DATE('2025-01-03', 'YYYY-MM-DD'), 'Anulata');
INSERT INTO Comanda (ID_Comanda, Data_creare, Status_comanda) VALUES (4, TO_DATE('2025-01-04', 'YYYY-MM-DD'), 'In asteptare');
INSERT INTO Comanda (ID_Comanda, Data_creare, Status_comanda) VALUES (5, TO_DATE('2025-01-05', 'YYYY-MM-DD'), 'Expediata');
INSERT INTO Comanda (ID_Comanda, Data_creare, Status_comanda) VALUES (6, TO_DATE('2025-02-01', 'YYYY-MM-DD'), 'In procesare');
INSERT INTO Comanda (ID_Comanda, Data_creare, Status_comanda) VALUES (7, TO_DATE('2025-03-02', 'YYYY-MM-DD'), 'Livrata');
INSERT INTO Comanda (ID_Comanda, Data_creare, Status_comanda) VALUES (8, TO_DATE('2025-04-03', 'YYYY-MM-DD'), 'Anulata');
INSERT INTO Comanda (ID_Comanda, Data_creare, Status_comanda) VALUES (9, TO_DATE('2025-05-04', 'YYYY-MM-DD'), 'In asteptare');
INSERT INTO Comanda (ID_Comanda, Data_creare, Status_comanda) VALUES (10, TO_DATE('2025-06-05', 'YYYY-MM-DD'), 'Expediata');
INSERT INTO Comanda (ID_Comanda, Data_creare, Status_comanda) VALUES (11, TO_DATE('2025-07-01', 'YYYY-MM-DD'), 'In procesare');
INSERT INTO Comanda (ID_Comanda, Data_creare, Status_comanda) VALUES (12, TO_DATE('2025-08-02', 'YYYY-MM-DD'), 'Livrata');
INSERT INTO Comanda (ID_Comanda, Data_creare, Status_comanda) VALUES (13, TO_DATE('2025-09-03', 'YYYY-MM-DD'), 'Anulata');
INSERT INTO Comanda (ID_Comanda, Data_creare, Status_comanda) VALUES (14, TO_DATE('2025-01-14', 'YYYY-MM-DD'), 'In asteptare');
INSERT INTO Comanda (ID_Comanda, Data_creare, Status_comanda) VALUES (15, TO_DATE('2025-01-15', 'YYYY-MM-DD'), 'Expediata');
INSERT INTO Comanda (ID_Comanda, Data_creare, Status_comanda) VALUES (16, TO_DATE('2025-01-11', 'YYYY-MM-DD'), 'In procesare');
INSERT INTO Comanda (ID_Comanda, Data_creare, Status_comanda) VALUES (17, TO_DATE('2025-01-12', 'YYYY-MM-DD'), 'Livrata');
INSERT INTO Comanda (ID_Comanda, Data_creare, Status_comanda) VALUES (18, TO_DATE('2025-01-13', 'YYYY-MM-DD'), 'Anulata');
INSERT INTO Comanda (ID_Comanda, Data_creare, Status_comanda) VALUES (19, TO_DATE('2025-01-14', 'YYYY-MM-DD'), 'In asteptare');
INSERT INTO Comanda (ID_Comanda, Data_creare, Status_comanda) VALUES (20, TO_DATE('2025-01-15', 'YYYY-MM-DD'), 'Expediata');

INSERT INTO produs_comandat (ID_Comanda, ID_Produs) VALUES (1, 1);
INSERT INTO produs_comandat (ID_Comanda, ID_Produs) VALUES (1, 2);
INSERT INTO produs_comandat (ID_Comanda, ID_Produs) VALUES (2, 3);
INSERT INTO produs_comandat (ID_Comanda, ID_Produs) VALUES (3, 4);
INSERT INTO produs_comandat (ID_Comanda, ID_Produs) VALUES (4, 5);
INSERT INTO produs_comandat (ID_Comanda, ID_Produs) VALUES (5, 1);
INSERT INTO produs_comandat (ID_Comanda, ID_Produs) VALUES (5, 2);
INSERT INTO produs_comandat (ID_Comanda, ID_Produs) VALUES (6, 1);
INSERT INTO produs_comandat (ID_Comanda, ID_Produs) VALUES (6, 2);
INSERT INTO produs_comandat (ID_Comanda, ID_Produs) VALUES (7, 6);
INSERT INTO produs_comandat (ID_Comanda, ID_Produs) VALUES (20, 20);
INSERT INTO produs_comandat (ID_Comanda, ID_Produs) VALUES (11, 13);
INSERT INTO produs_comandat (ID_Comanda, ID_Produs) VALUES (12, 9);
INSERT INTO produs_comandat (ID_Comanda, ID_Produs) VALUES (1, 20);
INSERT INTO produs_comandat (ID_Comanda, ID_Produs) VALUES (14, 14);
INSERT INTO produs_comandat (ID_Comanda, ID_Produs) VALUES (2, 18);
INSERT INTO produs_comandat (ID_Comanda, ID_Produs) VALUES (19, 19);
INSERT INTO produs_comandat (ID_Comanda, ID_Produs) VALUES (15, 3);
INSERT INTO produs_comandat (ID_Comanda, ID_Produs) VALUES (10, 4);
INSERT INTO produs_comandat (ID_Comanda, ID_Produs) VALUES (8, 5);



INSERT INTO Utilizator (ID_Utilizator, Telefon, Nume, Email, Parola, Adresa) VALUES (1, '0712345678', 'Ion Popescu', 'ion.popescu@example.com', 'parola1', 'Strada Libertatii 10');
INSERT INTO Utilizator (ID_Utilizator, Telefon, Nume, Email, Parola, Adresa) VALUES (2, '0723456789', 'Maria Ionescu', 'maria.ionescu@example.com', 'parola2', 'Strada Sperantei 5');
INSERT INTO Utilizator (ID_Utilizator, Telefon, Nume, Email, Parola, Adresa) VALUES (3, '0734567890', 'Andrei Georgescu', 'andrei.georgescu@example.com', 'parola3', 'Strada Pacii 15');
INSERT INTO Utilizator (ID_Utilizator, Telefon, Nume, Email, Parola, Adresa) VALUES (4, '0745678901', 'Elena Vasilescu', 'elena.vasilescu@example.com', 'parola4', 'Strada Unirii 20');
INSERT INTO Utilizator (ID_Utilizator, Telefon, Nume, Email, Parola, Adresa) VALUES (5, '0756789012', 'Mihai Dumitrescu', 'mihai.dumitrescu@example.com', 'parola5', 'Strada Florilor 25');
INSERT INTO Utilizator (ID_Utilizator, Telefon, Nume, Email, Parola, Adresa) VALUES (6, '0761234567', 'Alexandra Pavel', 'alexandra.pavel@example.com', 'parola6', 'Strada Soarelui 2');
INSERT INTO Utilizator (ID_Utilizator, Telefon, Nume, Email, Parola, Adresa) VALUES (7, '0772345678', 'Dan Marinescu', 'dan.marinescu@example.com', 'parola7', 'Strada Luna 3');
INSERT INTO Utilizator (ID_Utilizator, Telefon, Nume, Email, Parola, Adresa) VALUES (8, '0783456789', 'Cristina Popa', 'cristina.popa@example.com', 'parola8', 'Strada Florilor 8');
INSERT INTO Utilizator (ID_Utilizator, Telefon, Nume, Email, Parola, Adresa) VALUES (9, '0794567890', 'Vlad Enache', 'vlad.enache@example.com', 'parola9', 'Strada Vantului 12');
INSERT INTO Utilizator (ID_Utilizator, Telefon, Nume, Email, Parola, Adresa) VALUES (10, '0705678901', 'Diana Lungu', 'diana.lungu@example.com', 'parola10', 'Strada Lalelelor 15');
INSERT INTO Utilizator (ID_Utilizator, Telefon, Nume, Email, Parola, Adresa) VALUES (11, '0716789012', 'Razvan Iliescu', 'razvan.iliescu@example.com', 'parola11', 'Strada Mare 18');
INSERT INTO Utilizator (ID_Utilizator, Telefon, Nume, Email, Parola, Adresa) VALUES (12, '0727890123', 'Anca Dima', 'anca.dima@example.com', 'parola12', 'Strada Verde 20');
INSERT INTO Utilizator (ID_Utilizator, Telefon, Nume, Email, Parola, Adresa) VALUES (13, '0738901234', 'George Matei', 'george.matei@example.com', 'parola13', 'Strada Dunarii 25');
INSERT INTO Utilizator (ID_Utilizator, Telefon, Nume, Email, Parola, Adresa) VALUES (14, '0749012345', 'Bianca Nica', 'bianca.nica@example.com', 'parola14', 'Strada Sperantei 30');
INSERT INTO Utilizator (ID_Utilizator, Telefon, Nume, Email, Parola, Adresa) VALUES (15, '0750123456', 'Victor Stoica', 'victor.stoica@example.com', 'parola15', 'Strada Libertatii 35');
INSERT INTO Utilizator (ID_Utilizator, Telefon, Nume, Email, Parola, Adresa) VALUES (16, '0761234567', 'Raluca Serban', 'raluca.serban@example.com', 'parola16', 'Strada Plopilor 40');
INSERT INTO Utilizator (ID_Utilizator, Telefon, Nume, Email, Parola, Adresa) VALUES (17, '0772345678', 'Ionut Vasile', 'ionut.vasile@example.com', 'parola17', 'Strada Stejarului 45');
INSERT INTO Utilizator (ID_Utilizator, Telefon, Nume, Email, Parola, Adresa) VALUES (18, '0783456789', 'Alina Dumitru', 'alina.dumitru@example.com', 'parola18', 'Strada Teiului 50');
INSERT INTO Utilizator (ID_Utilizator, Telefon, Nume, Email, Parola, Adresa) VALUES (19, '0794567890', 'Sorin Barbu', 'sorin.barbu@example.com', 'parola19', 'Strada Paltinului 55');
INSERT INTO Utilizator (ID_Utilizator, Telefon, Nume, Email, Parola, Adresa) VALUES (20, '0705678901', 'Claudia Mihail', 'claudia.mihail@example.com', 'parola20', 'Strada Castanilor 60');


INSERT INTO utilizator_wishlist (ID_Wishlist, ID_Utilizator) VALUES (1, 1);
INSERT INTO utilizator_wishlist (ID_Wishlist, ID_Utilizator) VALUES (2, 2);
INSERT INTO utilizator_wishlist (ID_Wishlist, ID_Utilizator) VALUES (3, 3);
INSERT INTO utilizator_wishlist (ID_Wishlist, ID_Utilizator) VALUES (4, 4);
INSERT INTO utilizator_wishlist (ID_Wishlist, ID_Utilizator) VALUES (5, 5);
INSERT INTO utilizator_wishlist (ID_Wishlist, ID_Utilizator) VALUES (6, 6);
INSERT INTO utilizator_wishlist (ID_Wishlist, ID_Utilizator) VALUES (7, 7);
INSERT INTO utilizator_wishlist (ID_Wishlist, ID_Utilizator) VALUES (8,8);
INSERT INTO utilizator_wishlist (ID_Wishlist, ID_Utilizator) VALUES (9, 9);
INSERT INTO utilizator_wishlist (ID_Wishlist, ID_Utilizator) VALUES (10, 10);
INSERT INTO utilizator_wishlist (ID_Wishlist, ID_Utilizator) VALUES (11, 11);
INSERT INTO utilizator_wishlist (ID_Wishlist, ID_Utilizator) VALUES (12, 12);
INSERT INTO utilizator_wishlist (ID_Wishlist, ID_Utilizator) VALUES (13, 13);
INSERT INTO utilizator_wishlist (ID_Wishlist, ID_Utilizator) VALUES (14, 14);
INSERT INTO utilizator_wishlist (ID_Wishlist, ID_Utilizator) VALUES (15, 15);
INSERT INTO utilizator_wishlist (ID_Wishlist, ID_Utilizator) VALUES (16, 16);
INSERT INTO utilizator_wishlist (ID_Wishlist, ID_Utilizator) VALUES (17, 17);
INSERT INTO utilizator_wishlist (ID_Wishlist, ID_Utilizator) VALUES (18, 18);
INSERT INTO utilizator_wishlist (ID_Wishlist, ID_Utilizator) VALUES (19, 19);
INSERT INTO utilizator_wishlist (ID_Wishlist, ID_Utilizator) VALUES (20, 20);

INSERT INTO Administrator (admin_id) VALUES (1);
INSERT INTO Administrator (admin_id) VALUES (2);

INSERT INTO utilizatorul_are_cos (ID_Utilizator, ID_cos) VALUES (1, 1);
INSERT INTO utilizatorul_are_cos (ID_Utilizator, ID_cos) VALUES (2, 2);
INSERT INTO utilizatorul_are_cos (ID_Utilizator, ID_cos) VALUES (3, 3);
INSERT INTO utilizatorul_are_cos (ID_Utilizator, ID_cos) VALUES (4, 4);
INSERT INTO utilizatorul_are_cos (ID_Utilizator, ID_cos) VALUES (5, 5);
INSERT INTO utilizatorul_are_cos (ID_Utilizator, ID_cos) VALUES (6, 6);
INSERT INTO utilizatorul_are_cos (ID_Utilizator, ID_cos) VALUES (7, 8);
INSERT INTO utilizatorul_are_cos (ID_Utilizator, ID_cos) VALUES (8, 7);
INSERT INTO utilizatorul_are_cos (ID_Utilizator, ID_cos) VALUES (9, 9);
INSERT INTO utilizatorul_are_cos (ID_Utilizator, ID_cos) VALUES (10, 10);
INSERT INTO utilizatorul_are_cos (ID_Utilizator, ID_cos) VALUES (11, 11);
INSERT INTO utilizatorul_are_cos (ID_Utilizator, ID_cos) VALUES (12, 12);
INSERT INTO utilizatorul_are_cos (ID_Utilizator, ID_cos) VALUES (13, 13);
INSERT INTO utilizatorul_are_cos (ID_Utilizator, ID_cos) VALUES (14, 14);
INSERT INTO utilizatorul_are_cos (ID_Utilizator, ID_cos) VALUES (15, 15);
INSERT INTO utilizatorul_are_cos (ID_Utilizator, ID_cos) VALUES (16, 16);
INSERT INTO utilizatorul_are_cos (ID_Utilizator, ID_cos) VALUES (17, 17);
INSERT INTO utilizatorul_are_cos (ID_Utilizator, ID_cos) VALUES (18, 18);
INSERT INTO utilizatorul_are_cos (ID_Utilizator, ID_cos) VALUES (19, 19);
INSERT INTO utilizatorul_are_cos (ID_Utilizator, ID_cos) VALUES (20, 20);

INSERT INTO comanda_facuta_de (ID_Utilizator, ID_Comanda) VALUES (1, 1);
INSERT INTO comanda_facuta_de (ID_Utilizator, ID_Comanda) VALUES (2, 2);
INSERT INTO comanda_facuta_de (ID_Utilizator, ID_Comanda) VALUES (3, 3);
INSERT INTO comanda_facuta_de (ID_Utilizator, ID_Comanda) VALUES (4, 4);
INSERT INTO comanda_facuta_de (ID_Utilizator, ID_Comanda) VALUES (5, 5);
INSERT INTO comanda_facuta_de (ID_Utilizator, ID_Comanda) VALUES (6, 6);
INSERT INTO comanda_facuta_de (ID_Utilizator, ID_Comanda) VALUES (7, 7);
INSERT INTO comanda_facuta_de (ID_Utilizator, ID_Comanda) VALUES (8, 8);
INSERT INTO comanda_facuta_de (ID_Utilizator, ID_Comanda) VALUES (9, 9);
INSERT INTO comanda_facuta_de (ID_Utilizator, ID_Comanda) VALUES (10, 10);
INSERT INTO comanda_facuta_de (ID_Utilizator, ID_Comanda) VALUES (11, 11);
INSERT INTO comanda_facuta_de (ID_Utilizator, ID_Comanda) VALUES (12, 12);
INSERT INTO comanda_facuta_de (ID_Utilizator, ID_Comanda) VALUES (13, 13);
INSERT INTO comanda_facuta_de (ID_Utilizator, ID_Comanda) VALUES (14, 14);
INSERT INTO comanda_facuta_de (ID_Utilizator, ID_Comanda) VALUES (15, 15);
INSERT INTO comanda_facuta_de (ID_Utilizator, ID_Comanda) VALUES (16, 16);
INSERT INTO comanda_facuta_de (ID_Utilizator, ID_Comanda) VALUES (17, 17);
INSERT INTO comanda_facuta_de (ID_Utilizator, ID_Comanda) VALUES (18, 18);
INSERT INTO comanda_facuta_de (ID_Utilizator, ID_Comanda) VALUES (19, 19);
INSERT INTO comanda_facuta_de (ID_Utilizator, ID_Comanda) VALUES (20, 20);

INSERT INTO Curier (ID_Curier, Nume, Telefon, Adresa) VALUES (1, 'Curier Rapid', '0765432109', 'Strada Rapida 10');
INSERT INTO Curier (ID_Curier, Nume, Telefon, Adresa) VALUES (2, 'Curier Express', '0776543210', 'Strada Expres 15');
INSERT INTO Curier (ID_Curier, Nume, Telefon, Adresa) VALUES (3, 'Curier Eco', '0787654321', 'Strada Verde 20');
INSERT INTO Curier (ID_Curier, Nume, Telefon, Adresa) VALUES (4, 'Curier Local', '0798765432', 'Strada Locala 25');
INSERT INTO Curier (ID_Curier, Nume, Telefon, Adresa) VALUES (5, 'Curier Premium', '0709876543', 'Strada Premium 30');
INSERT INTO Curier (ID_Curier, Nume, Telefon, Adresa) VALUES (6, 'Curier Avansat', '0701111111', 'Strada Noua 1');
INSERT INTO Curier (ID_Curier, Nume, Telefon, Adresa) VALUES (7, 'Curier Turbo', '0712222222', 'Strada Turbo 7');
INSERT INTO Curier (ID_Curier, Nume, Telefon, Adresa) VALUES (8, 'Curier Flex', '0723333333', 'Strada Flexibila 8');
INSERT INTO Curier (ID_Curier, Nume, Telefon, Adresa) VALUES (9, 'Curier Economy', '0734444444', 'Strada Economica 9');
INSERT INTO Curier (ID_Curier, Nume, Telefon, Adresa) VALUES (10, 'Curier Star', '0745555555', 'Strada Stelara 10');
INSERT INTO Curier (ID_Curier, Nume, Telefon, Adresa) VALUES (11, 'Curier Ultra', '0756666666', 'Strada Ultrapida 11');
INSERT INTO Curier (ID_Curier, Nume, Telefon, Adresa) VALUES (12, 'Curier Pro', '0767777777', 'Strada Profesionala 12');
INSERT INTO Curier (ID_Curier, Nume, Telefon, Adresa) VALUES (13, 'Curier Max', '0778888888', 'Strada Maxima 13');
INSERT INTO Curier (ID_Curier, Nume, Telefon, Adresa) VALUES (14, 'Curier Mini', '0789999999', 'Strada Minima 14');
INSERT INTO Curier (ID_Curier, Nume, Telefon, Adresa) VALUES (15, 'Curier Prima', '0790000000', 'Strada Primara 15');
INSERT INTO Curier (ID_Curier, Nume, Telefon, Adresa) VALUES (16, 'Curier Fast', '0701010101', 'Strada Rapida 16');
INSERT INTO Curier (ID_Curier, Nume, Telefon, Adresa) VALUES (17, 'Curier Go', '0712020202', 'Strada Mobila 17');
INSERT INTO Curier (ID_Curier, Nume, Telefon, Adresa) VALUES (18, 'Curier Delux', '0723030303', 'Strada Delux 18');
INSERT INTO Curier (ID_Curier, Nume, Telefon, Adresa) VALUES (19, 'Curier Prime', '0734040404', 'Strada Prime 19');
INSERT INTO Curier (ID_Curier, Nume, Telefon, Adresa) VALUES (20, 'Curier Speed', '0745050505', 'Strada Rapida 20');

INSERT INTO comanda_efectuata (ID_Utilizator, ID_Comanda, ID_Curier) VALUES (1, 1, 1);
INSERT INTO comanda_efectuata (ID_Utilizator, ID_Comanda, ID_Curier) VALUES (2, 2, 2);
INSERT INTO comanda_efectuata (ID_Utilizator, ID_Comanda, ID_Curier) VALUES (3, 3, 3);
INSERT INTO comanda_efectuata (ID_Utilizator, ID_Comanda, ID_Curier) VALUES (4, 4, 4);
INSERT INTO comanda_efectuata (ID_Utilizator, ID_Comanda, ID_Curier) VALUES (5, 5, 5);
INSERT INTO comanda_efectuata (ID_Utilizator, ID_Comanda, ID_Curier) VALUES (6, 6, 6);
INSERT INTO comanda_efectuata (ID_Utilizator, ID_Comanda, ID_Curier) VALUES (7, 7, 7);
INSERT INTO comanda_efectuata (ID_Utilizator, ID_Comanda, ID_Curier) VALUES (8, 8, 8);
INSERT INTO comanda_efectuata (ID_Utilizator, ID_Comanda, ID_Curier) VALUES (9, 9, 9);
INSERT INTO comanda_efectuata (ID_Utilizator, ID_Comanda, ID_Curier) VALUES (10, 10, 10);
INSERT INTO comanda_efectuata (ID_Utilizator, ID_Comanda, ID_Curier) VALUES (11, 11, 11);
INSERT INTO comanda_efectuata (ID_Utilizator, ID_Comanda, ID_Curier) VALUES (12, 12, 12);
INSERT INTO comanda_efectuata (ID_Utilizator, ID_Comanda, ID_Curier) VALUES (13, 13, 13);
INSERT INTO comanda_efectuata (ID_Utilizator, ID_Comanda, ID_Curier) VALUES (14, 14, 14);
INSERT INTO comanda_efectuata (ID_Utilizator, ID_Comanda, ID_Curier) VALUES (15, 15, 15);
INSERT INTO comanda_efectuata (ID_Utilizator, ID_Comanda, ID_Curier) VALUES (16, 16, 16);
INSERT INTO comanda_efectuata (ID_Utilizator, ID_Comanda, ID_Curier) VALUES (17, 17, 17);
INSERT INTO comanda_efectuata (ID_Utilizator, ID_Comanda, ID_Curier) VALUES (18, 18, 18);
INSERT INTO comanda_efectuata (ID_Utilizator, ID_Comanda, ID_Curier) VALUES (19, 19, 19);
INSERT INTO comanda_efectuata (ID_Utilizator, ID_Comanda, ID_Curier) VALUES (20, 20, 20);

INSERT INTO comanda_livrata_de (ID_Curier, ID_Comanda) VALUES (1, 1);
INSERT INTO comanda_livrata_de (ID_Curier, ID_Comanda) VALUES (2, 2);
INSERT INTO comanda_livrata_de (ID_Curier, ID_Comanda) VALUES (3, 3);
INSERT INTO comanda_livrata_de (ID_Curier, ID_Comanda) VALUES (4, 4);
INSERT INTO comanda_livrata_de (ID_Curier, ID_Comanda) VALUES (5, 5);
INSERT INTO comanda_livrata_de (ID_Curier, ID_Comanda) VALUES (6, 6);
INSERT INTO comanda_livrata_de (ID_Curier, ID_Comanda) VALUES (7, 7);
INSERT INTO comanda_livrata_de (ID_Curier, ID_Comanda) VALUES (8, 8);
INSERT INTO comanda_livrata_de (ID_Curier, ID_Comanda) VALUES (9, 9);
INSERT INTO comanda_livrata_de (ID_Curier, ID_Comanda) VALUES (10, 10);
INSERT INTO comanda_livrata_de (ID_Curier, ID_Comanda) VALUES (11, 11);
INSERT INTO comanda_livrata_de (ID_Curier, ID_Comanda) VALUES (12, 12);
INSERT INTO comanda_livrata_de (ID_Curier, ID_Comanda) VALUES (13, 13);
INSERT INTO comanda_livrata_de (ID_Curier, ID_Comanda) VALUES (14, 14);
INSERT INTO comanda_livrata_de (ID_Curier, ID_Comanda) VALUES (15, 15);
INSERT INTO comanda_livrata_de (ID_Curier, ID_Comanda) VALUES (16, 16);
INSERT INTO comanda_livrata_de (ID_Curier, ID_Comanda) VALUES (17, 17);
INSERT INTO comanda_livrata_de (ID_Curier, ID_Comanda) VALUES (18, 18);
INSERT INTO comanda_livrata_de (ID_Curier, ID_Comanda) VALUES (19, 19);
INSERT INTO comanda_livrata_de (ID_Curier, ID_Comanda) VALUES (20, 20);

CREATE INDEX idx_utilizator_email ON Utilizator(Email);



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
