DROP TABLE reklamacje CASCADE CONSTRAINTS;
DROP TABLE oferty_specjalne CASCADE CONSTRAINTS;
DROP TABLE dostawy_klientow CASCADE CONSTRAINTS;
DROP TABLE zamowieniapozycje CASCADE CONSTRAINTS;
DROP TABLE zamowienia CASCADE CONSTRAINTS;
DROP TABLE dostawy CASCADE CONSTRAINTS;
DROP TABLE dostawcy CASCADE CONSTRAINTS;
DROP TABLE pozycja_paragonu CASCADE CONSTRAINTS;
DROP TABLE rachunki CASCADE CONSTRAINTS;
DROP TABLE klienci CASCADE CONSTRAINTS;
DROP TABLE zatrudnienia CASCADE CONSTRAINTS;
DROP TABLE pracownicy CASCADE CONSTRAINTS;
DROP TABLE dane_personalne CASCADE CONSTRAINTS;
DROP TABLE kwiaciarnieuslugi CASCADE CONSTRAINTS;
DROP TABLE uslugi CASCADE CONSTRAINTS;
DROP TABLE magazynygatunki CASCADE CONSTRAINTS;
DROP TABLE gatunki CASCADE CONSTRAINTS;
DROP TABLE magazyny CASCADE CONSTRAINTS;
DROP TABLE kwiaciarnie CASCADE CONSTRAINTS;
DROP TABLE adresy CASCADE CONSTRAINTS;
/
CREATE TABLE adresy(
    id_adresu NUMBER CONSTRAINT adres_pk PRIMARY KEY,
    typ_adresu VARCHAR2(18) NOT NULL,
    kraj VARCHAR2(20) NOT NULL,
    miasto VARCHAR2(30) NOT NULL,
    ulica VARCHAR2(50) NOT NULL,
    nr_budynku SMALLINT NOT NULL,
    nr_mieszkania SMALLINT
)
/
CREATE TABLE kwiaciarnie(
    id_kwiaciarni NUMBER CONSTRAINT kwiaciarnia_pk PRIMARY KEY,
    id_adresu NUMBER CONSTRAINT kwiaciarnie_adresy_fk REFERENCES adresy(id_adresu) UNIQUE NOT NULL,
    nazwa VARCHAR2(20) NOT NULL
)
/
CREATE TABLE magazyny(
    id_magazynu NUMBER CONSTRAINT magazyn_pk PRIMARY KEY,
    id_kwiaciarni NUMBER CONSTRAINT magazyny_kwiaciarnie_fk REFERENCES kwiaciarnie(id_kwiaciarni) UNIQUE NOT NULL
)
/
CREATE TABLE gatunki(
    id_gatunku NUMBER CONSTRAINT gatunek_pk PRIMARY KEY,
    nazwa VARCHAR2(30) NOT NULL,
    cena DECIMAL(10,2) NOT NULL
)
/
CREATE TABLE magazynygatunki(
    id_magazynygatunki NUMBER CONSTRAINT magazyngatunek_pk PRIMARY KEY,
    id_magazynu NUMBER CONSTRAINT magazynygatunki_magazyny_fk REFERENCES magazyny(id_magazynu) NOT NULL,
    id_gatunku NUMBER CONSTRAINT magazynygatunki_gatunki_fk REFERENCES gatunki(id_gatunku) NOT NULL,
    ilosc SMALLINT NOT NULL
)
/
CREATE TABLE uslugi(
    id_uslugi NUMBER CONSTRAINT usluga_pk PRIMARY KEY,
    nazwa VARCHAR2(50) UNIQUE,
    doplata DECIMAL(10,2) NOT NULL
)
/
CREATE TABLE kwiaciarnieuslugi(
    id_kwiaciarnieuslugi NUMBER CONSTRAINT kwiaciarniausluga_pk PRIMARY KEY,
    id_kwiaciarni NUMBER CONSTRAINT kwiaciarnieuslugi_kwiaciarnie_fk REFERENCES kwiaciarnie(id_kwiaciarni) NOT NULL,
    id_uslugi NUMBER CONSTRAINT kwiaciarnieuslugi_uslugi_fk REFERENCES uslugi(id_uslugi) NOT NULL
)
/
CREATE TABLE dane_personalne(
    id_danych NUMBER CONSTRAINT dane_pk PRIMARY KEY,
    id_adresu NUMBER CONSTRAINT dane_adresy_fk REFERENCES adresy(id_adresu) NOT NULL,
    nazwisko VARCHAR2(30) NOT NULL,
    imie VARCHAR2(30),
    PESEL NUMBER(11),
    NIP NUMBER(10),
    telefon VARCHAR2(50),
    email VARCHAR2(50)
)
/
CREATE TABLE pracownicy(
    id_pracownika NUMBER CONSTRAINT pracownik_pk PRIMARY KEY,
    id_danych NUMBER CONSTRAINT pracownicy_dane_fk REFERENCES dane_personalne(id_danych) NOT NULL,
    stanowisko VARCHAR2(50)
)
/
CREATE TABLE zatrudnienia(
    id_zatrudnienia NUMBER CONSTRAINT zatrudnienie_pk PRIMARY KEY,
    id_kwiaciarni NUMBER CONSTRAINT zatrudnienia_kwiaciarnie_fk REFERENCES kwiaciarnie(id_kwiaciarni) NOT NULL,
    id_pracownika NUMBER CONSTRAINT zatrudnienia_pracownicy_fk REFERENCES pracownicy(id_pracownika) NOT NULL,
    data_przyjecia DATE NOT NULL,
    czy_na_urlopie NUMBER(1) NOT NULL,
    czy_zwolniony NUMBER(1) NOT NULL,
    data_zwolnienia DATE
)
/
CREATE TABLE klienci(
    id_klienta NUMBER CONSTRAINT klient_pk PRIMARY KEY,
    id_danych NUMBER CONSTRAINT klienci_dane_fk REFERENCES dane_personalne(id_danych) UNIQUE NOT NULL
)
/
CREATE TABLE rachunki(
    id_rachunku NUMBER CONSTRAINT rachunek_pk PRIMARY KEY,
    id_kwiaciarni NUMBER CONSTRAINT rachunki_kwiaciarnie_fk REFERENCES kwiaciarnie(id_kwiaciarni) NOT NULL,
    id_pracownika NUMBER CONSTRAINT rachunki_pracownicy_fk REFERENCES pracownicy(id_pracownika) NOT NULL,
    id_klienta NUMBER CONSTRAINT rachunki_klienci_fk REFERENCES klienci(id_klienta),
    typ_rachunku VARCHAR2(7) NOT NULL,
    data_sprzedazy DATE NOT NULL,
    suma_pln DECIMAL(10,2) NOT NULL
)
/
CREATE TABLE pozycja_paragonu(
    id_pozycji_paragonu NUMBER CONSTRAINT pozycja_paragonu_pk PRIMARY KEY,
    id_rachunku NUMBER CONSTRAINT pozycja_paragonu_rachunki_fk REFERENCES rachunki(id_rachunku) NOT NULL,
    id_gatunku NUMBER CONSTRAINT pozycja_paragonu_gatunki_fk REFERENCES gatunki(id_gatunku),
    id_uslugi NUMBER CONSTRAINT pozycja_paragonu_uslugi_fk REFERENCES uslugi(id_uslugi),
    ilosc SMALLINT NOT NULL
) 
/
CREATE TABLE dostawcy(
    id_dostawcy NUMBER CONSTRAINT dostawca_pk PRIMARY KEY,
    nazwa VARCHAR2(50) NOT NULL,
    telefon VARCHAR2(50),
    email VARCHAR2(50),
    id_adresu NUMBER CONSTRAINT dostawcy_adresy_fk REFERENCES adresy(id_adresu) NOT NULL
)
/
CREATE TABLE dostawy(
    id_dostawy NUMBER CONSTRAINT dostawa_pk PRIMARY KEY,
    id_dostawcy NUMBER CONSTRAINT dostawy_dostawcy_fk REFERENCES dostawcy(id_dostawcy) NOT NULL,
    id_gatunku NUMBER CONSTRAINT dostawy_gatunki_fk REFERENCES gatunki(id_gatunku) NOT NULL,
    id_magazynu NUMBER CONSTRAINT dostawy_magazyny_fk REFERENCES magazyny(id_magazynu) NOT NULL,
    ilosc SMALLINT NOT NULL,
    data_dostawy DATE NOT NULL
)
/
CREATE TABLE zamowienia(
    id_zamowienia NUMBER CONSTRAINT zamowienie_pk PRIMARY KEY,
    id_klienta NUMBER CONSTRAINT zamowienia_klienci_fk REFERENCES klienci(id_klienta) NOT NULL,
    data_zamowienia DATE NOT NULL,
    status VARCHAR2(20) NOT NULL
)
/
CREATE TABLE zamowieniapozycje(
    id_zamowieniapozycje NUMBER CONSTRAINT zamowieniapozycje_pk PRIMARY KEY,
    id_zamowienia NUMBER CONSTRAINT zamowieniapozycje_zamowienia_fk REFERENCES zamowienia(id_zamowienia) NOT NULL,
    id_gatunku NUMBER CONSTRAINT zamowieniapozycje_gatunki_fk REFERENCES gatunki(id_gatunku),
    id_uslugi NUMBER CONSTRAINT zamowieniapozycje_uslugi_fk REFERENCES uslugi(id_uslugi),
    ilosc SMALLINT NOT NULL
)
/
CREATE TABLE dostawy_klientow(
    id_dostawy NUMBER CONSTRAINT dostawa_klienta_pk PRIMARY KEY,
    id_zamowienia NUMBER CONSTRAINT dostawy_klientow_zamowienia_fk REFERENCES zamowienia(id_zamowienia) NOT NULL,
    id_klienta NUMBER CONSTRAINT dostawy_klientow_klienci_fk REFERENCES klienci(id_klienta) NOT NULL,
    id_adresu NUMBER CONSTRAINT dostawy_klientow_adresy_fk REFERENCES adresy(id_adresu) NOT NULL,
    data_dostawy DATE NOT NULL,
    status VARCHAR2(20) NOT NULL
)
/
CREATE TABLE oferty_specjalne(
    id_oferty NUMBER CONSTRAINT oferta_pk PRIMARY KEY,
    id_gatunku NUMBER CONSTRAINT ofertyspecjalne_gatunki_fk REFERENCES gatunki(id_gatunku),
    id_uslugi NUMBER CONSTRAINT ofertyspecjalne_uslugi_fk REFERENCES uslugi(id_uslugi),
    cena DECIMAL(10,2) NOT NULL,
    data_rozpoczecia DATE NOT NULL,
    data_zakonczenia DATE NOT NULL
)
/
CREATE TABLE reklamacje(
    id_reklamacji NUMBER CONSTRAINT reklamacja_pk PRIMARY KEY,
    id_klienta NUMBER CONSTRAINT reklamacje_klienci_fk REFERENCES klienci(id_klienta) NOT NULL,
    id_rachunku NUMBER CONSTRAINT reklamacje_rachunki_fk REFERENCES rachunki(id_rachunku),
    id_zamowienia NUMBER CONSTRAINT reklamacje_zamowienia_fk REFERENCES zamowienia(id_zamowienia),
    data_reklamacji DATE NOT NULL,
    status VARCHAR2(20) NOT NULL,
    opis VARCHAR2(500)
)
/
