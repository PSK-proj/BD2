-- To zapytanie pokazuje łączną ilość sprzedanych produktów i łączną kwotę sprzedaży dla każdej kwiaciarni w każdym mieście. Dzięki użyciu ROLLUP można także zobaczyć sumę dla każdego miasta oraz ogólną sumę dla wszystkich miast.
SELECT a.id_adresu,
  a.miasto,
  k.id_kwiaciarni,
  sum(ppg.ilosc) as laczna_ilosc,
  sum(r.suma_pln) as laczna_kwota
FROM adresy a
  JOIN kwiaciarnie k ON a.id_adresu = k.id_adresu
  JOIN rachunki r ON k.id_kwiaciarni = r.id_kwiaciarni
  JOIN pozycja_paragonu_gatunek ppg ON r.id_rachunku = ppg.id_rachunku
GROUP BY ROLLUP (a.id_adresu, a.miasto, k.id_kwiaciarni);

-- To zapytanie pokazuje łączną ilość sprzedanych produktów dla każdego pracownika w podziale na gatunki. Pozwala to na analizę, który pracownik sprzedaje jakie produkty i w jakiej ilości.
SELECT
  prac.id_pracownika,
  dane.imie,
  dane.nazwisko,
  gatunki.id_gatunku,
  gatunki.nazwa as nazwa_gatunku,
  SUM(pozycja_gatunek.ilosc) as laczna_ilosc
FROM
  pracownicy prac
  JOIN dane_personalne dane ON prac.id_danych = dane.id_danych
  JOIN rachunki rach ON prac.id_pracownika = rach.id_pracownika
  JOIN pozycja_paragonu_gatunek pozycja_gatunek ON rach.id_rachunku = pozycja_gatunek.id_rachunku
  JOIN gatunki ON pozycja_gatunek.id_gatunku = gatunki.id_gatunku
GROUP BY ROLLUP (prac.id_pracownika, dane.imie, dane.nazwisko, gatunki.id_gatunku, gatunki.nazwa);

-- Zapytanie pokazuje, ile razy każda usługa została zakupiona przez poszczególnych klientów. Dzięki temu można analizować, które usługi są najbardziej popularne wśród klientów.
SELECT us.id_uslugi,
  us.nazwa AS nazwa_uslugi,
  dp.id_danych AS id_klienta,
  dp.imie,
  dp.nazwisko,
  SUM(ppu.ilosc) AS ilosc_uslug
FROM uslugi us
  JOIN pozycja_paragonu_usluga ppu ON us.id_uslugi = ppu.id_uslugi
  JOIN rachunki r ON ppu.id_rachunku = r.id_rachunku
  JOIN klienci k ON r.id_klienta = k.id_klienta
  JOIN dane_personalne dp ON k.id_danych = dp.id_danych
GROUP BY ROLLUP (us.id_uslugi, us.nazwa, dp.id_danych, dp.imie, dp.nazwisko);
