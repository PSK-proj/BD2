OPTIONS (SKIP=0)
LOAD DATA
INFILE '.\\Dane\\uslugi.csv' "str '\r\n'"
INTO TABLE uslugi
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_uslugi,
  nazwa,
  doplata
)
