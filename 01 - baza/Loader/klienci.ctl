OPTIONS (SKIP=0)
LOAD DATA
INFILE '../Dane/klienci.csv'
INTO TABLE klienci
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_klienta,
  id_danych
)
