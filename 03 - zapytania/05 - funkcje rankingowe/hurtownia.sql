-- Ranga pracowników w kwiaciarniach na podstawie ilości sprzedanych kwiatów:
SELECT dp.imie AS imie_pracownika,
  dp.nazwisko AS nazwisko_pracownika,
  dk.nazwa AS nazwa_kwiaciarni,
  SUM(fs.ilosc) AS ilosc_sprzedanych_kwiatow,
  RANK() OVER (PARTITION BY fs.id_kwiaciarni ORDER BY SUM(fs.ilosc) DESC) AS ranga
FROM Fakt_Sprzedazy fs
  JOIN Dim_Pracownik dp ON fs.id_pracownika = dp.id_pracownika
  JOIN Dim_Kwiaciarnia dk ON fs.id_kwiaciarni = dk.id_kwiaciarni
GROUP BY fs.id_pracownika, dp.imie, dp.nazwisko, dk.nazwa;
-- Sens praktyczny: Pozwala na porównanie wyników sprzedaży pracowników w ramach danej kwiaciarni, co może być wykorzystane do motywowania personelu.

-- Przydzielanie klientom poziomów lojalnościowych na podstawie wydanej kwoty:
SELECT dk.imie AS imie_klienta,
  dk.nazwisko AS nazwisko_klienta,
  SUM(fs.cena * fs.ilosc) AS calkowita_kwota,
  NTILE(3) OVER (ORDER BY SUM(fs.cena * fs.ilosc) DESC) AS poziom_lojalnosci
FROM Fakt_Sprzedazy fs
  JOIN Dim_Klient dk ON fs.id_klienta = dk.id_klienta
GROUP BY fs.id_klienta, dk.imie, dk.nazwisko;
-- Sens praktyczny: Pozwala na segmentację klientów według wydanej kwoty, co może być użyte do wprowadzenia programów lojalnościowych.

-- Znalezienie 3 najpopularniejszych gatunków kwiatów w każdej kwiaciarni:
SELECT dk.nazwa AS nazwa_kwiaciarni,
  dg.nazwa AS gatunek_kwiatu,
  SUM(fs.ilosc) AS ilosc_sprzedanych,
  RANK() OVER (PARTITION BY fs.id_kwiaciarni ORDER BY SUM(fs.ilosc) DESC) AS ranga
FROM Fakt_Sprzedazy fs
  JOIN Dim_Gatunek dg ON fs.id_gatunku = dg.id_gatunku
  JOIN Dim_Kwiaciarnia dk ON fs.id_kwiaciarni = dk.id_kwiaciarni
GROUP BY fs.id_kwiaciarni, dg.nazwa, dk.nazwa
HAVING RANK() OVER (PARTITION BY fs.id_kwiaciarni ORDER BY SUM(fs.ilosc) DESC) <= 3;
-- Sens praktyczny: Pozwala na zrozumienie, jakie gatunki kwiatów cieszą się największą popularnością w poszczególnych kwiaciarniach, co może wpłynąć na decyzje zakupowe.