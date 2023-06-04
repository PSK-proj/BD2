OPTIONS (SKIP=0)
LOAD DATA
INFILE '../Dane/kwiaciarnie.csv'
INTO TABLE kwiaciarnie
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_kwiaciarni,
  id_adresu,
  nazwa
)
