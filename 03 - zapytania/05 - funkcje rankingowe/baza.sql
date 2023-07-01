-- Ranga pracowników w kwiaciarniach na podstawie ilości sprzedanych kwiatów.
WITH
  RangaSprzedazy
  AS
  (
    SELECT
      dp.imie AS imie_pracownika,
      dp.nazwisko AS nazwisko_pracownika,
      k.nazwa AS nazwa_kwiaciarni,
      SUM(ppg.ilosc) AS ilosc_sprzedanych_kwiatow,
      RANK() OVER (PARTITION BY r.id_kwiaciarni ORDER BY SUM(ppg.ilosc) DESC) AS ranga
    FROM
      pozycja_paragonu_gatunek ppg
      JOIN rachunki r ON ppg.id_rachunku = r.id_rachunku
      JOIN pracownicy pr ON r.id_pracownika = pr.id_pracownika
      JOIN dane_personalne dp ON pr.id_danych = dp.id_danych
      JOIN kwiaciarnie k ON r.id_kwiaciarni = k.id_kwiaciarni
    WHERE ppg.id_gatunku IS NOT NULL
    GROUP BY
        r.id_kwiaciarni, dp.imie, dp.nazwisko, k.nazwa
  )
SELECT
  imie_pracownika,
  nazwisko_pracownika,
  nazwa_kwiaciarni,
  ilosc_sprzedanych_kwiatow,
  ranga
FROM
  RangaSprzedazy;
-- Sens praktyczny: Pozwala na porównanie wyników sprzedaży pracowników w ramach danej kwiaciarni, co może być wykorzystane do motywowania personelu.

-- Przydzielanie klientom poziomów lojalnościowych na podstawie wydanej kwoty:
SELECT dp.imie AS imie_klienta,
  dp.nazwisko AS nazwisko_klienta,
  SUM(r.suma_pln) AS calkowita_kwota,
  NTILE(3) OVER (ORDER BY SUM(r.suma_pln) DESC) AS poziom_lojalnosci
FROM rachunki r
  JOIN klienci k ON r.id_klienta = k.id_klienta
  JOIN dane_personalne dp ON k.id_danych = dp.id_danych
GROUP BY dp.imie, dp.nazwisko;
-- Sens praktyczny: Pozwala na segmentację klientów według wydanej kwoty, co może być użyte do wprowadzenia programów lojalnościowych.

-- Znalezienie 3 najpopularniejszych gatunków kwiatów w każdej kwiaciarni:
WITH
  RangaGatunku
  AS
  (
    SELECT
      k.nazwa AS nazwa_kwiaciarni,
      g.nazwa AS gatunek_kwiatu,
      SUM(ppg.ilosc) AS ilosc_sprzedanych,
      RANK() OVER (PARTITION BY r.id_kwiaciarni ORDER BY SUM(ppg.ilosc) DESC) AS ranga
    FROM
      pozycja_paragonu_gatunek ppg
      JOIN rachunki r ON ppg.id_rachunku = r.id_rachunku
      JOIN gatunki g ON ppg.id_gatunku = g.id_gatunku
      JOIN kwiaciarnie k ON r.id_kwiaciarni = k.id_kwiaciarni
    WHERE ppg.id_gatunku IS NOT NULL
    GROUP BY
      r.id_kwiaciarni, g.nazwa, k.nazwa
  )
SELECT
  nazwa_kwiaciarni,
  gatunek_kwiatu,
  ilosc_sprzedanych,
  ranga
FROM
  RangaGatunku
WHERE
      ranga <= 3
ORDER BY
      nazwa_kwiaciarni,
      ranga;
-- Sens praktyczny: Pozwala na zrozumienie, jakie gatunki kwiatów cieszą się największą popularnością w poszczególnych kwiaciarniach, co może wpłynąć na decyzje zakupowe.