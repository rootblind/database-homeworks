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
