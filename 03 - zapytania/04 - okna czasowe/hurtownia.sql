-- Suma sprzedaży w bieżącym i poprzednim miesiącu dla każdej kwiaciarni.
SELECT k.nazwa AS kwiaciarnia,
  EXTRACT(MONTH FROM f.data_sprzedazy) AS miesiac,
  SUM(f.cena * f.ilosc) OVER (PARTITION BY k.nazwa ORDER BY EXTRACT(MONTH FROM f.data_sprzedazy) ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS suma_sprzedazy
FROM Fakt_Sprzedazy f
  JOIN Dim_Kwiaciarnia k ON f.id_kwiaciarni = k.id_kwiaciarni;
-- Sens praktyczny: Pomaga monitorować miesięczne zmiany w przychodach i identyfikować sezonowe trendy lub skuteczność działań promocyjnych.

-- Średnia cena sprzedaży dla każdego gatunku kwiatu w danym miesiącu oraz w całym roku.
SELECT g.nazwa AS gatunek,
  EXTRACT(MONTH FROM f.data_sprzedazy) AS miesiac,
  AVG(f.cena) OVER (PARTITION BY g.nazwa ORDER BY EXTRACT(MONTH FROM f.data_sprzedazy) RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS srednia_roczna,
  AVG(f.cena) OVER (PARTITION BY g.nazwa ORDER BY EXTRACT(MONTH FROM f.data_sprzedazy)) AS srednia_miesieczna
FROM Fakt_Sprzedazy f
  JOIN Dim_Gatunek g ON f.id_gatunku = g.id_gatunku;
-- Sens praktyczny: Umożliwia analizę popularności gatunków kwiatów w różnych okresach, co jest przydatne przy planowaniu zakupów i ustalaniu strategii cenowych.

-- Różnica w liczbie transakcji pomiędzy bieżącym a poprzednim miesiącem dla każdej kwiaciarni.
SELECT k.nazwa AS kwiaciarnia,
  EXTRACT(MONTH FROM f.data_sprzedazy) AS miesiac,
  COUNT(*) - LAG(COUNT(*), 1, 0) OVER (PARTITION BY k.nazwa ORDER BY EXTRACT(MONTH FROM f.data_sprzedazy)) AS roznica_transakcji
FROM Fakt_Sprzedazy f
  JOIN Dim_Kwiaciarnia k ON f.id_kwiaciarni = k.id_kwiaciarni
GROUP BY k.nazwa, EXTRACT(MONTH FROM f.data_sprzedazy);
-- Sens praktyczny: Pomaga w identyfikacji kwiaciarni z rosnącą lub malejącą liczbą transakcji, co może wpłynąć na decyzje dotyczące alokacji zasobów i planowania promocji.
