OPTIONS (SKIP=0)
LOAD DATA
INFILE '.\\Dane\\dostawy.csv' "str '\r\n'"
INTO TABLE dostawy
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_dostawy,
  id_dostawcy,
  id_gatunku,
  id_magazynu,
  ilosc,
  data_dostawy
)
