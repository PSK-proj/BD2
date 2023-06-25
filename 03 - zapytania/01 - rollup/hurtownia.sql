-- Pozwala zrozumieć, jakie jest rozkład ilości produktów w magazynach w zależności od miasta.
SELECT nazwa_miasta, SUM(ilosc) AS calkowita_ilosc
FROM Dim_Miasto
  JOIN Dim_Kwiaciarnia ON Dim_Miasto.id_miasta = Dim_Kwiaciarnia.id_miasta
  JOIN Fakt_Sprzedazy ON Dim_Kwiaciarnia.id_kwiaciarni = Fakt_Sprzedazy.id_kwiaciarni
GROUP BY ROLLUP(nazwa_miasta);

-- Pozwala na analizę sumy sprzedaży w poszczególnych kwiaciarniach według lokalizacji (miasto).
SELECT nazwa_miasta, Dim_Kwiaciarnia.nazwa, SUM(cena) AS calkowita_sprzedaz
FROM Dim_Miasto
  JOIN Dim_Kwiaciarnia ON Dim_Miasto.id_miasta = Dim_Kwiaciarnia.id_miasta
  JOIN Fakt_Sprzedazy ON Dim_Kwiaciarnia.id_kwiaciarni = Fakt_Sprzedazy.id_kwiaciarni
GROUP BY ROLLUP(nazwa_miasta, Dim_Kwiaciarnia.nazwa);

-- Pozwala zrozumieć, jak liczba pracowników na poszczególnych stanowiskach rozkłada się w zależności od miasta.
SELECT Dim_Miasto.nazwa_miasta, Dim_Pracownik.stanowisko, COUNT(Dim_Pracownik.id_pracownika) AS liczba_pracownikow
FROM Dim_Miasto
  JOIN Dim_Kwiaciarnia ON Dim_Miasto.id_miasta = Dim_Kwiaciarnia.id_miasta
  JOIN Fakt_Sprzedazy ON Dim_Kwiaciarnia.id_kwiaciarni = Fakt_Sprzedazy.id_kwiaciarni
  JOIN Dim_Pracownik ON Fakt_Sprzedazy.id_pracownika = Dim_Pracownik.id_pracownika
GROUP BY ROLLUP(Dim_Miasto.nazwa_miasta, Dim_Pracownik.stanowisko);
