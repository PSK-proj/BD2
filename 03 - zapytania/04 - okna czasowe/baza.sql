-- Suma sprzedaży w bieżącym i poprzednim miesiącu dla każdej kwiaciarni.
SELECT k.nazwa AS kwiaciarnia,
  EXTRACT(MONTH FROM r.data_sprzedazy) AS miesiac,
  SUM(r.suma_pln) OVER (PARTITION BY k.nazwa ORDER BY EXTRACT(MONTH FROM r.data_sprzedazy) ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS suma_sprzedazy
FROM rachunki r
  JOIN kwiaciarnie k ON r.id_kwiaciarni = k.id_kwiaciarni;
-- Sens praktyczny: Pomaga monitorować miesięczne zmiany w przychodach i identyfikować sezonowe trendy lub skuteczność działań promocyjnych.

-- Średnia cena sprzedaży dla każdego gatunku kwiatu w danym miesiącu oraz w całym roku.
SELECT g.nazwa AS gatunek,
  EXTRACT(MONTH FROM r.data_sprzedazy) AS miesiac,
  AVG(g.cena) OVER (PARTITION BY g.nazwa ORDER BY EXTRACT(MONTH FROM r.data_sprzedazy) RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS srednia_roczna,
  AVG(g.cena) OVER (PARTITION BY g.nazwa ORDER BY EXTRACT(MONTH FROM r.data_sprzedazy)) AS srednia_miesieczna
FROM pozycja_paragonu pp
  JOIN rachunki r ON pp.id_rachunku = r.id_rachunku
  JOIN gatunki g ON pp.id_gatunku = g.id_gatunku;
-- Sens praktyczny: Umożliwia analizę popularności gatunków kwiatów w różnych okresach, co jest przydatne przy planowaniu zakupów i ustalaniu strategii cenowych.

-- Różnica w liczbie transakcji pomiędzy bieżącym a poprzednim miesiącem dla każdej kwiaciarni.
SELECT k.nazwa AS kwiaciarnia,
  EXTRACT(MONTH FROM r.data_sprzedazy) AS miesiac,
  COUNT(*) - LAG(COUNT(*), 1, 0) OVER (PARTITION BY k.nazwa ORDER BY EXTRACT(MONTH FROM r.data_sprzedazy)) AS roznica_transakcji
FROM rachunki r
  JOIN kwiaciarnie k ON r.id_kwiaciarni = k.id_kwiaciarni
GROUP BY k.nazwa, EXTRACT(MONTH FROM r.data_sprzedazy);
-- Sens praktyczny: Pomaga w identyfikacji kwiaciarni z rosnącą lub malejącą liczbą transakcji, co może wpłynąć na decyzje dotyczące alokacji zasobów i planowania promocji.
