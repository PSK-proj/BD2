-- To zapytanie pokazuje łączną ilość sprzedanych produktów i łączną kwotę sprzedaży dla każdej kwiaciarni w każdym mieście. Dzięki użyciu ROLLUP można także zobaczyć sumę dla każdego miasta oraz ogólną sumę dla wszystkich miast.
SELECT d.id_miasta,
  d.nazwa_miasta,
  k.id_kwiaciarni,
  sum(f.ilosc) as laczna_ilosc,
  sum(f.suma_pln) as laczna_kwota
FROM Dim_Miasto d
  JOIN Dim_Kwiaciarnia k ON d.id_miasta = k.id_miasta
  JOIN Fakt_Sprzedazy f ON k.id_kwiaciarni = f.id_kwiaciarni
GROUP BY ROLLUP (d.id_miasta, d.nazwa_miasta, k.id_kwiaciarni);

-- To zapytanie pokazuje łączną ilość sprzedanych produktów dla każdego pracownika w podziale na gatunki. Pozwala to na analizę, który pracownik sprzedaje jakie produkty i w jakiej ilości.
SELECT p.id_pracownika,
  p.imie,
  p.nazwisko,
  g.id_gatunku,
  g.nazwa,
  sum(f.ilosc) as laczna_ilosc
FROM Dim_Pracownik p
  JOIN Fakt_Sprzedazy f ON p.id_pracownika = f.id_pracownika
  JOIN Dim_Gatunek g ON f.id_gatunku = g.id_gatunku
GROUP BY ROLLUP (p.id_pracownika, p.imie, p.nazwisko, g.id_gatunku, g.nazwa);

-- Zapytanie pokazuje, ile razy każda usługa została zakupiona przez poszczególnych klientów. Dzięki temu można analizować, które usługi są najbardziej popularne wśród klientów.
SELECT u.id_uslugi,
  u.nazwa,
  k.id_klienta,
  k.imie,
  k.nazwisko,
  sum(f.ilosc) as ilosc_uslug
FROM Dim_Usluga u
  JOIN Fakt_Sprzedazy f ON u.id_uslugi = f.id_uslugi
  JOIN Dim_Klient k ON f.id_klienta = k.id_klienta
GROUP BY ROLLUP (u.id_uslugi, u.nazwa, k.id_klienta, k.imie, k.nazwisko);
