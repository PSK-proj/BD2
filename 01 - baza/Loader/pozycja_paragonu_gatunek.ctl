OPTIONS (SKIP=0)
LOAD DATA
INFILE '.\\Dane\\pozycja_paragonu_gatunek.csv' "str '\r\n'"
INTO TABLE pozycja_paragonu_gatunek
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_pozycji_paragonu,
  id_rachunku,
  id_gatunku,
  ilosc
)
