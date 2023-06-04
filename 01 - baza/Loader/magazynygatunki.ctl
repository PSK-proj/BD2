OPTIONS (SKIP=0)
LOAD DATA
INFILE '.\\Dane\\magazynygatunki.csv' "str '\r\n'"
INTO TABLE magazynygatunki
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_magazynygatunki,
  id_magazynu,
  id_gatunku,
  ilosc
)
