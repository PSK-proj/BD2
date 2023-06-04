OPTIONS (SKIP=0)
LOAD DATA
INFILE '.\\Dane\\zamowienia.csv' "str '\r\n'"
INTO TABLE zamowienia
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_zamowienia,
  id_klienta,
  data_zamowienia,
  status
)
