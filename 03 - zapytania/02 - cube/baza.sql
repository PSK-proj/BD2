-- Suma sprzedaży w rozbiciu na gatunki i usługi.
SELECT g.nazwa AS gatunek, u.nazwa AS usluga, SUM(g.cena * pp.ilosc + (CASE WHEN pp.id_uslugi IS NOT NULL THEN u.doplata ELSE 0 END) * pp.ilosc) AS total_sales
FROM pozycja_paragonu pp
  JOIN gatunki g ON pp.id_gatunku = g.id_gatunku
  LEFT JOIN uslugi u ON pp.id_uslugi = u.id_uslugi
  JOIN rachunki r ON pp.id_rachunku = r.id_rachunku
GROUP BY ROLLUP (g.nazwa, u.nazwa);
-- Sens praktyczny: Umożliwia analizę sprzedaży według kombinacji gatunków kwiatów i usług, co pomaga w planowaniu i optymalizacji oferty.

-- Suma sprzedaży w rozbiciu na kwiaciarnie, gatunki i usługi.
SELECT k.nazwa AS kwiaciarnia, g.nazwa AS gatunek, u.nazwa AS usluga, SUM(g.cena * pp.ilosc + (CASE WHEN pp.id_uslugi IS NOT NULL THEN u.doplata ELSE 0 END) * pp.ilosc) AS total_sales
FROM pozycja_paragonu pp
  JOIN gatunki g ON pp.id_gatunku = g.id_gatunku
  LEFT JOIN uslugi u ON pp.id_uslugi = u.id_uslugi
  JOIN rachunki r ON pp.id_rachunku = r.id_rachunku
  JOIN kwiaciarnie k ON r.id_kwiaciarni = k.id_kwiaciarni
GROUP BY CUBE (k.nazwa, g.nazwa, u.nazwa);
-- Sens praktyczny: Pozwala na szczegółową analizę sprzedaży według kwiaciarni, gatunków i usług, co jest przydatne do identyfikacji wzorców sprzedaży i planowania strategii biznesowych.

-- Suma sprzedaży w rozbiciu na kwiaciarnie, miasta i gatunki.
SELECT k.nazwa AS kwiaciarnia, a.miasto AS miasto, g.nazwa AS gatunek, SUM(g.cena * pp.ilosc) AS total_sales
FROM pozycja_paragonu pp
  JOIN gatunki g ON pp.id_gatunku = g.id_gatunku
  JOIN rachunki r ON pp.id_rachunku = r.id_rachunku
  JOIN kwiaciarnie k ON r.id_kwiaciarni = k.id_kwiaciarni
  JOIN adresy a ON k.id_adresu = a.id_adresu
GROUP BY CUBE (k.nazwa, a.miasto, g.nazwa);
-- Sens praktyczny: Pomaga w zrozumieniu, jak lokalizacja i gatunki kwiatów wpływają na wyniki sprzedaży, co jest użyteczne przy podejmowaniu decyzji dotyczących lokalizacji sklepów i oferty produktów.