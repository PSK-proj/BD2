OPTIONS (SKIP=0)
LOAD DATA
INFILE '../Dane/magazyny.csv'
INTO TABLE magazyny
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_magazynu,
  id_kwiaciarni
)
