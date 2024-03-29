-- Suma sprzedaży dla każdej kwiaciarni i gatunku kwiatu w danym miesiącu.
SELECT
  k.nazwa AS kwiaciarnia,
  g.nazwa AS gatunek,
  EXTRACT(MONTH FROM r.data_sprzedazy) AS miesiac,
  SUM(ppg.ilosc * g.cena) AS calkowita_sprzedaz
FROM
  rachunki r
  JOIN
  kwiaciarnie k ON r.id_kwiaciarni = k.id_kwiaciarni
  JOIN
  pozycja_paragonu_gatunek ppg ON r.id_rachunku = ppg.id_rachunku
  JOIN
  gatunki g ON ppg.id_gatunku = g.id_gatunku
GROUP BY
    k.nazwa, g.nazwa, EXTRACT(MONTH FROM r.data_sprzedazy);
-- Sens praktyczny: Pozwala na analizę, jakie gatunki kwiatów przynoszą największe przychody w poszczególnych kwiaciarniach, co jest przydatne przy planowaniu oferty.

-- Średnia cena sprzedaży dla każdego pracownika i usługi w danym miesiącu.
SELECT
  dp.imie || ' ' || dp.nazwisko AS pracownik,
  u.nazwa AS usluga,
  EXTRACT(MONTH FROM r.data_sprzedazy) AS miesiac,
  AVG(ppu.ilosc * u.doplata) AS srednia_cena
FROM
  rachunki r
  JOIN
  pracownicy p ON r.id_pracownika = p.id_pracownika
  JOIN
  dane_personalne dp ON p.id_danych = dp.id_danych
  JOIN
  pozycja_paragonu_usluga ppu ON r.id_rachunku = ppu.id_rachunku
  JOIN
  uslugi u ON ppu.id_uslugi = u.id_uslugi
GROUP BY
    dp.imie, dp.nazwisko, u.nazwa, EXTRACT(MONTH FROM r.data_sprzedazy);
-- Sens praktyczny: Umożliwia monitorowanie wyników sprzedaży pracowników i efektywności różnych usług w celu optymalizacji zarządzania personelem i portfolio usług.

-- Liczba transakcji dla każdej kwiaciarni i klienta w danym miesiącu.
SELECT
  k.nazwa AS kwiaciarnia,
  dp.imie || ' ' || dp.nazwisko AS klient,
  EXTRACT(MONTH FROM r.data_sprzedazy) AS miesiac,
  COUNT(*) AS liczba_transakcji
FROM
  rachunki r
  JOIN
  kwiaciarnie k ON r.id_kwiaciarni = k.id_kwiaciarni
  JOIN
  klienci kl ON r.id_klienta = kl.id_klienta
  JOIN
  dane_personalne dp ON kl.id_danych = dp.id_danych
GROUP BY
    k.nazwa, dp.imie, dp.nazwisko, EXTRACT(MONTH FROM r.data_sprzedazy);
-- Sens praktyczny: Pomaga w identyfikacji najbardziej wartościowych klientów i ocenie ich wpływu na wyniki sprzedaży w poszczególnych kwiaciarniach.
