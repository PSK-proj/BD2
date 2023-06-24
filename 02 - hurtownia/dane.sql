CREATE OR REPLACE PROCEDURE load_data AS
BEGIN
  -- Wprowadzanie danych do Dim_Miasto
  INSERT INTO Dim_Miasto
    (id_miasta, nazwa_miasta)
  SELECT id_adresu, miasto
  FROM adresy;

  -- Wprowadzanie danych do Dim_Kwiaciarnia
  INSERT INTO Dim_Kwiaciarnia
    (id_kwiaciarni, nazwa, id_miasta)
  SELECT id_kwiaciarni, nazwa, id_adresu
  FROM kwiaciarnie;

  -- Wprowadzanie danych do Dim_Gatunek
  INSERT INTO Dim_Gatunek
    (id_gatunku, nazwa)
  SELECT id_gatunku, nazwa
  FROM gatunki;

  -- Wprowadzanie danych do Dim_Usluga
  INSERT INTO Dim_Usluga
    (id_uslugi, nazwa, cena)
  SELECT id_uslugi, nazwa, doplata
  FROM uslugi;

  -- Wprowadzanie danych do Dim_Pracownik
  INSERT INTO Dim_Pracownik
    (id_pracownika, imie, nazwisko, stanowisko, data_zatrudnienia)
  SELECT p.id_pracownika, dp.imie, dp.nazwisko, p.stanowisko, z.data_przyjecia
  FROM pracownicy p
    JOIN dane_personalne dp ON p.id_danych = dp.id_danych
    JOIN zatrudnienia z ON p.id_pracownika = z.id_pracownika;

  -- Wprowadzanie danych do Dim_Klient
  INSERT INTO Dim_Klient
    (id_klienta, imie, nazwisko, email)
  SELECT k.id_klienta, dp.imie, dp.nazwisko, dp.email
  FROM klienci k
    JOIN dane_personalne dp ON k.id_danych = dp.id_danych;

  -- Wprowadzanie danych do Fakt_Sprzedazy
  INSERT INTO Fakt_Sprzedazy
    (id, id_kwiaciarni, id_gatunku, id_uslugi, id_pracownika, id_klienta, ilosc, cena, data_sprzedazy)
  SELECT r.id_rachunku, r.id_kwiaciarni, pp.id_gatunku, pp.id_uslugi, r.id_pracownika, r.id_klienta, pp.ilosc, g.cena, r.data_sprzedazy
  FROM rachunki r
    JOIN pozycja_paragonu pp ON r.id_rachunku = pp.id_rachunku
    JOIN gatunki g ON pp.id_gatunku = g.id_gatunku;

  COMMIT;
  EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLCODE || ' ' || SQLERRM);
END;
/
EXECUTE load_data();