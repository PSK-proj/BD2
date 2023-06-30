OPTIONS (SKIP=0)
LOAD DATA
INFILE '.\\Dane\\dane_personalneadresy.csv' "str '\r\n'"
INTO TABLE dane_personalneadresy
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_danych,
  id_adresu
)
