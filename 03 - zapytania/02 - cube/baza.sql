-- Zapytanie analizujące sprzedaż produktów według miasta i gatunku. Pozwala to na identyfikację, które miasta i gatunki produktów generują największe przychody.
SELECT
  adresy.miasto,
  gatunki.id_gatunku,
  SUM(pozycja_paragonu_gatunek.ilosc) AS laczna_ilosc,
  SUM(pozycja_paragonu_gatunek.ilosc * gatunki.cena) AS laczna_kwota
FROM
  pozycja_paragonu_gatunek
  JOIN
  rachunki ON pozycja_paragonu_gatunek.id_rachunku = rachunki.id_rachunku
  JOIN
  kwiaciarnie ON rachunki.id_kwiaciarni = kwiaciarnie.id_kwiaciarni
  JOIN
  adresy ON kwiaciarnie.id_adresu = adresy.id_adresu
  JOIN
  gatunki ON pozycja_paragonu_gatunek.id_gatunku = gatunki.id_gatunku
GROUP BY
    CUBE (adresy.miasto, gatunki.id_gatunku);


-- Zapytanie analizujące wpływy z usług w różnych kwiaciarniach. Można dzięki temu zrozumieć, jakie usługi są najbardziej dochodowe w różnych lokalizacjach.
SELECT
  kwiaciarnie.id_kwiaciarni,
  uslugi.id_uslugi,
  SUM(pozycja_paragonu_usluga.ilosc) AS laczna_ilosc,
  SUM(pozycja_paragonu_usluga.ilosc * uslugi.doplata) AS laczna_kwota
FROM
  pozycja_paragonu_usluga
  JOIN
  rachunki ON pozycja_paragonu_usluga.id_rachunku = rachunki.id_rachunku
  JOIN
  kwiaciarnie ON rachunki.id_kwiaciarni = kwiaciarnie.id_kwiaciarni
  JOIN
  uslugi ON pozycja_paragonu_usluga.id_uslugi = uslugi.id_uslugi
GROUP BY
    CUBE (kwiaciarnie.id_kwiaciarni, uslugi.id_uslugi);

-- Zapytanie analizujące wpływy od różnych klientów w zależności od gatunku produktu. Pozwala to na zrozumienie, jacy klienci wydają najwięcej pieniędzy na jakie gatunki produktów.
SELECT
  klienci.id_klienta,
  gatunki.id_gatunku,
  SUM(pozycja_paragonu_gatunek.ilosc) AS laczna_ilosc,
  SUM(pozycja_paragonu_gatunek.ilosc * gatunki.cena) AS laczna_kwota
FROM
  pozycja_paragonu_gatunek
  JOIN
  rachunki ON pozycja_paragonu_gatunek.id_rachunku = rachunki.id_rachunku
  JOIN
  klienci ON rachunki.id_klienta = klienci.id_klienta
  JOIN
  gatunki ON pozycja_paragonu_gatunek.id_gatunku = gatunki.id_gatunku
GROUP BY
CUBE (klienci.id_klienta, gatunki.id_gatunku);