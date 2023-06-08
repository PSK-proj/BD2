-- Suma sprzedaży w rozbiciu na gatunki i usługi.
SELECT g.nazwa AS gatunek, u.nazwa AS usluga, SUM(f.cena * f.ilosc) AS total_sales
FROM Fakt_Sprzedazy f
  JOIN Dim_Gatunek g ON f.id_gatunku = g.id_gatunku
  JOIN Dim_Usluga u ON f.id_uslugi = u.id_uslugi
GROUP BY CUBE (g.nazwa, u.nazwa);
-- Sens praktyczny: Umożliwia analizę sprzedaży według kombinacji gatunków kwiatów i usług, co pomaga w planowaniu i optymalizacji oferty.

-- Suma sprzedaży w rozbiciu na kwiaciarnie, gatunki i usługi.
SELECT k.nazwa AS kwiaciarnia, g.nazwa AS gatunek, u.nazwa AS usluga, SUM(f.cena * f.ilosc) AS total_sales
FROM Fakt_Sprzedazy f
  JOIN Dim_Kwiaciarnia k ON f.id_kwiaciarni = k.id_kwiaciarni
  JOIN Dim_Gatunek g ON f.id_gatunku = g.id_gatunku
  JOIN Dim_Usluga u ON f.id_uslugi = u.id_uslugi
GROUP BY CUBE (k.nazwa, g.nazwa, u.nazwa);
-- Sens praktyczny: Pozwala na szczegółową analizę sprzedaży według kwiaciarni, gatunków i usług, co jest przydatne do identyfikacji wzorców sprzedaży i planowania strategii biznesowych.

-- Suma sprzedaży w rozbiciu na kwiaciarnie, miasta i gatunki.
SELECT k.nazwa AS kwiaciarnia, a.miasto, g.nazwa AS gatunek, SUM(f.cena * f.ilosc) AS total_sales
FROM Fakt_Sprzedazy f
  JOIN Dim_Kwiaciarnia k ON f.id_kwiaciarni = k.id_kwiaciarni
  JOIN Dim_Adres a ON k.id_adresu = a.id_adresu
  JOIN Dim_Gatunek g ON f.id_gatunku = g.id_gatunku
GROUP BY CUBE (k.nazwa, a.miasto, g.nazwa);
-- Sens praktyczny: Pomaga w zrozumieniu, jak lokalizacja i gatunki kwiatów wpływają na wyniki sprzedaży, co jest użyteczne przy podejmowaniu decyzji dotyczących lokalizacji sklepów i oferty produktów.
