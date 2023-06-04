OPTIONS (SKIP=0)
LOAD DATA
INFILE '.\\Dane\\adresy.csv' "str '\r\n'"
INTO TABLE adresy
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_adresu,
  typ_adresu,
  kraj,
  miasto,
  ulica,
  nr_budynku,
  nr_mieszkania
)
