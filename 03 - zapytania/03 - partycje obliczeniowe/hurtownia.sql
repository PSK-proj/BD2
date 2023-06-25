-- Suma sprzedaży dla każdej kwiaciarni i gatunku kwiatu w danym miesiącu.
SELECT k.nazwa AS kwiaciarnia, g.nazwa AS gatunek, EXTRACT(MONTH FROM f.data_sprzedazy) AS miesiac, SUM(f.cena) AS calkowita_sprzedaz
FROM Fakt_Sprzedazy f
  JOIN Dim_Kwiaciarnia k ON f.id_kwiaciarni = k.id_kwiaciarni
  JOIN Dim_Gatunek g ON f.id_gatunku = g.id_gatunku
GROUP BY k.nazwa, g.nazwa, EXTRACT(MONTH FROM f.data_sprzedazy);
-- Sens praktyczny: Pozwala na analizę, jakie gatunki kwiatów przynoszą największe przychody w poszczególnych kwiaciarniach, co jest przydatne przy planowaniu oferty.

-- Średnia cena sprzedaży dla każdego pracownika i usługi w danym miesiącu.
SELECT p.imie || ' ' || p.nazwisko AS pracownik, u.nazwa AS usluga, EXTRACT(MONTH FROM f.data_sprzedazy) AS miesiac, AVG(f.cena) AS srednia_cena
FROM Fakt_Sprzedazy f
  JOIN Dim_Pracownik p ON f.id_pracownika = p.id_pracownika
  JOIN Dim_Usluga u ON f.id_uslugi = u.id_uslugi
GROUP BY p.imie, p.nazwisko, u.nazwa, EXTRACT(MONTH FROM f.data_sprzedazy);
-- Sens praktyczny: Umożliwia monitorowanie wyników sprzedaży pracowników i efektywności różnych usług w celu optymalizacji zarządzania personelem i portfolio usług.

-- Liczba transakcji dla każdej kwiaciarni i klienta w danym miesiącu.
SELECT k.nazwa AS kwiaciarnia, c.imie || ' ' || c.nazwisko AS klient, EXTRACT(MONTH FROM f.data_sprzedazy) AS miesiac, COUNT(*) AS liczba_transakcji
FROM Fakt_Sprzedazy f
  JOIN Dim_Kwiaciarnia k ON f.id_kwiaciarni = k.id_kwiaciarni
  JOIN Dim_Klient c ON f.id_klienta = c.id_klienta
GROUP BY k.nazwa, c.imie, c.nazwisko, EXTRACT(MONTH FROM f.data_sprzedazy);
-- Sens praktyczny: Pomaga w identyfikacji najbardziej wartościowych klientów i ocenie ich wpływu na wyniki sprzedaży w poszczególnych kwiaciarniach.
