-- Suma sprzedaży w rozbiciu na miasta i gatunki.
SELECT a.miasto, g.nazwa AS gatunek, SUM(f.cena * f.ilosc) AS total_sales
FROM Fakt_Sprzedazy f
  JOIN Dim_Kwiaciarnia k ON f.id_kwiaciarni = k.id_kwiaciarni
  JOIN Dim_Adres a ON k.id_adresu = a.id_adresu
  JOIN Dim_Gatunek g ON f.id_gatunku = g.id_gatunku
GROUP BY ROLLUP (a.miasto, g.nazwa);
-- Sens praktyczny: Pomaga zrozumieć, jakie gatunki kwiatów są popularne w różnych miastach, co może wpłynąć na decyzje dotyczące asortymentu.

-- Suma sprzedaży w rozbiciu na miasta, gatunki i usługi.
SELECT a.miasto, g.nazwa AS gatunek, u.nazwa AS usluga, SUM(f.cena * f.ilosc) AS total_sales
FROM Fakt_Sprzedazy f
  JOIN Dim_Kwiaciarnia k ON f.id_kwiaciarni = k.id_kwiaciarni
  JOIN Dim_Adres a ON k.id_adresu = a.id_adresu
  JOIN Dim_Gatunek g ON f.id_gatunku = g.id_gatunku
  JOIN Dim_Usluga u ON f.id_uslugi = u.id_uslugi
GROUP BY ROLLUP (a.miasto, g.nazwa, u.nazwa);
-- Sens praktyczny: Umożliwia analizę sprzedaży w kontekście lokalizacji, gatunku i usług, co pomaga w optymalizacji oferty i strategii marketingowej.

-- Średnia cena sprzedaży w rozbiciu na kwiaciarnie, gatunki i pracowników.
SELECT k.nazwa AS kwiaciarnia, g.nazwa AS gatunek, p.imie || ' ' || p.nazwisko AS pracownik, AVG(f.cena) AS average_price
FROM Fakt_Sprzedazy f
  JOIN Dim_Kwiaciarnia k ON f.id_kwiaciarni = k.id_kwiaciarni
  JOIN Dim_Gatunek g ON f.id_gatunku = g.id_gatunku
  JOIN Dim_Pracownik p ON f.id_pracownika = p.id_pracownika
GROUP BY ROLLUP (k.nazwa, g.nazwa, p.imie, p.nazwisko);
-- Sens praktyczny: Pozwala na analizę, jak średnia cena sprzedaży różni się w zależności od kwiaciarni, gatunku kwiatów i pracowników, co może pomóc w ocenie wydajności i planowaniu cen.
