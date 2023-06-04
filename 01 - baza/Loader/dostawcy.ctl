OPTIONS (SKIP=0)
LOAD DATA
INFILE '.\\Dane\\dostawcy.csv' "str '\r\n'"
INTO TABLE dostawcy
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_dostawcy,
  nazwa,
  telefon,
  email,
  id_adresu
)
