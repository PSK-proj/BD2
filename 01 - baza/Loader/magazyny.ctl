OPTIONS (SKIP=0)
LOAD DATA
INFILE '.\\Dane\\magazyny.csv' "str '\r\n'"
INTO TABLE magazyny
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_magazynu,
  id_kwiaciarni
)
