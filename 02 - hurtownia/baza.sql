CREATE SEQUENCE fakt_sprzedazy_seq
    START WITH 1
    INCREMENT BY 1;

DROP TABLE Fakt_Sprzedazy;
DROP TABLE Dim_Kwiaciarnia;
DROP TABLE Dim_Usluga;
DROP TABLE Dim_Gatunek;
DROP TABLE Dim_Pracownik;
DROP TABLE Dim_Klient;
DROP TABLE Dim_Miasto;

CREATE TABLE Dim_Miasto
(
    id_miasta NUMBER PRIMARY KEY,
    nazwa_miasta VARCHAR2(50)
)
/
CREATE TABLE Dim_Kwiaciarnia
(
    id_kwiaciarni NUMBER PRIMARY KEY,
    nazwa VARCHAR2(100),
    id_miasta NUMBER,
    FOREIGN KEY (id_miasta) REFERENCES Dim_Miasto(id_miasta)
)
/
CREATE TABLE Dim_Gatunek
(
    id_gatunku NUMBER PRIMARY KEY,
    nazwa VARCHAR2(50)
)
/
CREATE TABLE Dim_Usluga
(
    id_uslugi NUMBER PRIMARY KEY,
    nazwa VARCHAR2(100),
    cena DECIMAL(10, 2)
)
/
CREATE TABLE Dim_Pracownik
(
    id_pracownika NUMBER PRIMARY KEY,
    imie VARCHAR2(50),
    nazwisko VARCHAR2(50),
    stanowisko VARCHAR2(50),
    data_zatrudnienia DATE
)
/
CREATE TABLE Dim_Klient
(
    id_klienta NUMBER PRIMARY KEY,
    imie VARCHAR2(50),
    nazwisko VARCHAR2(50),
    email VARCHAR2(100)
)
/
CREATE TABLE Fakt_Sprzedazy
(
    id NUMBER PRIMARY KEY,
    id_kwiaciarni NUMBER REFERENCES Dim_Kwiaciarnia(id_kwiaciarni),
    id_gatunku NUMBER REFERENCES Dim_Gatunek(id_gatunku),
    id_uslugi NUMBER REFERENCES Dim_Usluga(id_uslugi),
    id_pracownika NUMBER REFERENCES Dim_Pracownik(id_pracownika),
    id_klienta NUMBER REFERENCES Dim_Klient(id_klienta),
    ilosc NUMBER,
    suma_pln DECIMAL(10, 2),
    data_sprzedazy DATE
)
/