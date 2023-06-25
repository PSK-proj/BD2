-- Pozwala zrozumieć, jakie jest rozkład ilości produktów w magazynach w zależności od miasta.
SELECT miasto, SUM(ilosc) AS calkowita_ilosc
FROM adresy
  JOIN kwiaciarnie ON adresy.id_adresu = kwiaciarnie.id_adresu
  JOIN magazyny ON kwiaciarnie.id_kwiaciarni = magazyny.id_kwiaciarni
  JOIN magazynygatunki ON magazyny.id_magazynu = magazynygatunki.id_magazynu
GROUP BY ROLLUP(miasto);

-- Pozwala na analizę sumy sprzedaży w poszczególnych kwiaciarniach według lokalizacji (miasto).
SELECT miasto, nazwa, SUM(suma_pln) AS calkowita_sprzedaz
FROM adresy
  JOIN kwiaciarnie ON adresy.id_adresu = kwiaciarnie.id_adresu
  JOIN rachunki ON kwiaciarnie.id_kwiaciarni = rachunki.id_kwiaciarni
GROUP BY ROLLUP(miasto, nazwa);

-- Pozwala zrozumieć, jak liczba pracowników na poszczególnych stanowiskach rozkłada się w zależności od miasta.
SELECT miasto, stanowisko, COUNT(pracownicy.id_pracownika) AS liczba_pracownikow
FROM adresy
  JOIN kwiaciarnie ON adresy.id_adresu = kwiaciarnie.id_adresu
  JOIN zatrudnienia ON kwiaciarnie.id_kwiaciarni = zatrudnienia.id_kwiaciarni
  JOIN pracownicy ON zatrudnienia.id_pracownika = pracownicy.id_pracownika
GROUP BY ROLLUP(miasto, stanowisko);
