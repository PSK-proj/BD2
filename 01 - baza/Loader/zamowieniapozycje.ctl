OPTIONS (SKIP=0)
LOAD DATA
INFILE '../Dane/zamowieniapozycje.csv'
INTO TABLE zamowieniapozycje
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_zamowieniapozycje,
  id_zamowienia,
  id_gatunku,
  id_uslugi,
  ilosc
)
