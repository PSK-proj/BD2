OPTIONS (SKIP=0)
LOAD DATA
INFILE '../Dane/gatunki.csv'
INTO TABLE gatunki
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_gatunku,
  nazwa,
  cena
)
