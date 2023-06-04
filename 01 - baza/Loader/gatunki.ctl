OPTIONS (SKIP=0)
LOAD DATA
INFILE '.\\Dane\\gatunki.csv' "str '\r\n'"
INTO TABLE gatunki
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_gatunku,
  nazwa,
  cena
)
