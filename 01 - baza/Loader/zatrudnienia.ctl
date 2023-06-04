OPTIONS (SKIP=0)
LOAD DATA
INFILE '.\\Dane\\zatrudnienia.csv' "str '\r\n'"
INTO TABLE zatrudnienia
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_zatrudnienia,
  id_kwiaciarni,
  id_pracownika,
  data_przyjecia,
  czy_na_urlopie,
  czy_zwolniony,
  data_zwolnienia
)
