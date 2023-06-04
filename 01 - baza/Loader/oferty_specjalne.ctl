OPTIONS (SKIP=0)
LOAD DATA
INFILE '../Dane/oferty_specjalne.csv'
INTO TABLE oferty_specjalne
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_oferty,
  id_gatunku,
  id_uslugi,
  cena,
  data_rozpoczecia,
  data_zakonczenia
)
