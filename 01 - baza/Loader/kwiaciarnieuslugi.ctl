OPTIONS (SKIP=0)
LOAD DATA
INFILE '.\\Dane\\kwiaciarnieuslugi.csv' "str '\r\n'"
INTO TABLE kwiaciarnieuslugi
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_kwiaciarnieuslugi,
  id_kwiaciarni,
  id_uslugi
)
