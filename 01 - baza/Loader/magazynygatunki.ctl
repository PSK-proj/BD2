OPTIONS (SKIP=0)
LOAD DATA
INFILE '../Dane/magazynygatunki.csv'
INTO TABLE magazynygatunki
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_magazynygatunki,
  id_magazynu,
  id_gatunku,
  ilosc
)
