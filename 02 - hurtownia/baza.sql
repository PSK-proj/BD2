DROP TABLE Fakt_Sprzedazy
DROP TABLE Dim_Kwiaciarnia
DROP TABLE Dim_Usluga
DROP TABLE Dim_Gatunek
DROP TABLE Dim_Pracownik
DROP TABLE Dim_Klient
DROP TABLE Dim_Czas

CREATE TABLE Dim_Adres (
    id_adresu NUMBER PRIMARY KEY,
    ulica VARCHAR2(100),
    numer_budynku VARCHAR2(10),
    miasto VARCHAR2(50),
    kod_pocztowy VARCHAR2(10)
);

CREATE TABLE Dim_Kwiaciarnia (
    id_kwiaciarni NUMBER PRIMARY KEY,
    nazwa VARCHAR2(100),
    id_adresu NUMBER,
    FOREIGN KEY (id_adresu) REFERENCES DimAdres(id_adresu)
);

CREATE TABLE Dim_Gatunek (
    id_gatunku NUMBER PRIMARY KEY,
    nazwa VARCHAR2(50),
    kolor VARCHAR2(30),
    pochodzenie VARCHAR2(50)
);

CREATE TABLE Dim_Usluga (
    id_uslugi NUMBER PRIMARY KEY,
    nazwa VARCHAR2(100),
    cena DECIMAL(10, 2),
    opis VARCHAR2(500)
);

CREATE TABLE Dim_Pracownik (
    id_pracownika NUMBER PRIMARY KEY,
    imie VARCHAR2(50),
    nazwisko VARCHAR2(50),
    stanowisko VARCHAR2(50),
    data_zatrudnienia DATE
);

CREATE TABLE Dim_Klient (
    id_klienta NUMBER PRIMARY KEY,
    imie VARCHAR2(50),
    nazwisko VARCHAR2(50),
    email VARCHAR2(100)
);

CREATE TABLE Fakt_Sprzedazy (
    id NUMBER PRIMARY KEY,
    id_kwiaciarni NUMBER REFERENCES DimKwiaciarnia(id_kwiaciarni),
    id_gatunku NUMBER REFERENCES DimGatunek(id_gatunku),
    id_uslugi NUMBER REFERENCES DimUsluga(id_uslugi),
    id_pracownika NUMBER REFERENCES DimPracownik(id_pracownika),
    id_klienta NUMBER REFERENCES DimKlient(id_klienta),
    ilosc NUMBER,
    cena DECIMAL(10, 2),
    data_sprzedazy DATE
);

