-- Zapytanie analizujące sprzedaż produktów według miasta i gatunku. Pozwala to na identyfikację, które miasta i gatunki produktów generują największe przychody.
SELECT dmiasto.id_miasta,
  dgatunek.id_gatunku,
  SUM(fs.ilosc) as laczna_ilosc,
  SUM(fs.suma_pln) as laczna_kwota
FROM Fakt_Sprzedazy fs
  JOIN Dim_Kwiaciarnia dkwiaciarnia ON fs.id_kwiaciarni = dkwiaciarnia.id_kwiaciarni
  JOIN Dim_Miasto dmiasto ON dkwiaciarnia.id_miasta = dmiasto.id_miasta
  JOIN Dim_Gatunek dgatunek ON fs.id_gatunku = dgatunek.id_gatunku
GROUP BY CUBE (dmiasto.id_miasta, dgatunek.id_gatunku);

-- Zapytanie analizujące wpływy z usług w różnych kwiaciarniach. Można dzięki temu zrozumieć, jakie usługi są najbardziej dochodowe w różnych lokalizacjach.
SELECT dkwiaciarnia.id_kwiaciarni,
  dusluga.id_uslugi,
  SUM(fs.ilosc) as laczna_ilosc,
  SUM(fs.suma_pln) as laczna_kwota
FROM Fakt_Sprzedazy fs
  JOIN Dim_Kwiaciarnia dkwiaciarnia ON fs.id_kwiaciarni = dkwiaciarnia.id_kwiaciarni
  JOIN Dim_Usluga dusluga ON fs.id_uslugi = dusluga.id_uslugi
GROUP BY CUBE (dkwiaciarnia.id_kwiaciarni, dusluga.id_uslugi);

-- Zapytanie analizujące wpływy od różnych klientów w zależności od gatunku produktu. Pozwala to na zrozumienie, jacy klienci wydają najwięcej pieniędzy na jakie gatunki produktów.
SELECT dklient.id_klienta,
  dgatunek.id_gatunku,
  SUM(fs.ilosc) as laczna_ilosc,
  SUM(fs.suma_pln) as laczna_kwota
FROM Fakt_Sprzedazy fs
  JOIN Dim_Klient dklient ON fs.id_klienta = dklient.id_klienta
  JOIN Dim_Gatunek dgatunek ON fs.id_gatunku = dgatunek.id_gatunku
GROUP BY CUBE (dklient.id_klienta, dgatunek.id_gatunku);
