CREATE OR REPLACE PROCEDURE load_data AS
BEGIN
  -- Wprowadź dane do Dim_Miasto
  INSERT INTO Dim_Miasto
    (id_miasta, nazwa_miasta)
  SELECT DISTINCT id_adresu, miasto
  FROM adresy;

  -- Wprowadź dane do Dim_Kwiaciarnia
  INSERT INTO Dim_Kwiaciarnia
    (id_kwiaciarni, nazwa, id_miasta)
  SELECT k.id_kwiaciarni, k.nazwa, a.id_adresu
  FROM kwiaciarnie k
    JOIN adresy a ON k.id_adresu = a.id_adresu;

  -- Wprowadź dane do Dim_Gatunek
  INSERT INTO Dim_Gatunek
    (id_gatunku, nazwa)
  SELECT id_gatunku, nazwa
  FROM gatunki;

  -- Wprowadź dane do Dim_Usluga
  INSERT INTO Dim_Usluga
    (id_uslugi, nazwa, cena)
  SELECT id_uslugi, nazwa, doplata
  FROM uslugi;

  -- Wprowadź dane do Dim_Pracownik
  INSERT INTO Dim_Pracownik
    (id_pracownika, imie, nazwisko, stanowisko, data_zatrudnienia)
  SELECT p.id_pracownika, dp.imie, dp.nazwisko, p.stanowisko, MAX(z.data_przyjecia)
  FROM pracownicy p
    JOIN dane_personalne dp ON p.id_danych = dp.id_danych
    JOIN zatrudnienia z ON p.id_pracownika = z.id_pracownika
  GROUP BY p.id_pracownika, dp.imie, dp.nazwisko, p.stanowisko;

  -- Wprowadzanie danych do Dim_Klient
  INSERT INTO Dim_Klient
    (id_klienta, imie, nazwisko, email)
  SELECT k.id_klienta, dp.imie, dp.nazwisko, dp.email
  FROM klienci k
    JOIN dane_personalne dp ON k.id_danych = dp.id_danych;

  -- Wprowadź dane do Fakt_Sprzedazy
  INSERT INTO Fakt_Sprzedazy
    (id, id_kwiaciarni, id_gatunku, id_uslugi, id_pracownika, id_klienta, ilosc, suma_pln, data_sprzedazy)
  SELECT
    rownum,
    r.id_kwiaciarni,
    pg.id_gatunku,
    pu.id_uslugi,
    r.id_pracownika,
    r.id_klienta,
    NVL(pg.ilosc, pu.ilosc),
    r.suma_pln,
    r.data_sprzedazy
  FROM rachunki r
    LEFT JOIN pozycja_paragonu_gatunek pg ON r.id_rachunku = pg.id_rachunku
    LEFT JOIN pozycja_paragonu_usluga pu ON r.id_rachunku = pu.id_rachunku;

  COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE
  ('An error occurred: ' || SQLCODE || ' ' || SQLERRM);
END;
/
EXECUTE load_data
();
