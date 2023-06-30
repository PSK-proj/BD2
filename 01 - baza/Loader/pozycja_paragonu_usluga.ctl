OPTIONS (SKIP=0)
LOAD DATA
INFILE '.\\Dane\\pozycja_paragonu_usluga.csv' "str '\r\n'"
INTO TABLE pozycja_paragonu_usluga
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_pozycji_paragonu,
  id_rachunku,
  id_uslugi,
  ilosc
)
