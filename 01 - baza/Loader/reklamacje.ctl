OPTIONS (SKIP=0)
LOAD DATA
INFILE '.\\Dane\\reklamacje.csv' "str '\r\n'"
INTO TABLE reklamacje
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_reklamacji,
  id_klienta,
  id_rachunku,
  id_zamowienia,
  data_reklamacji,
  status,
  opis
)
