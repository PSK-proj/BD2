OPTIONS (SKIP=0)
LOAD DATA
INFILE '../Dane/dostawy_klientow.csv'
INTO TABLE dostawy_klientow
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_dostawy,
  id_zamowienia,
  id_klienta,
  id_adresu,
  data_dostawy,
  status
)
