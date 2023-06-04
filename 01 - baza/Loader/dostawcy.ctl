OPTIONS (SKIP=0)
LOAD DATA
INFILE '../Dane/dostawcy.csv'
INTO TABLE dostawcy
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_dostawcy,
  nazwa,
  telefon,
  email,
  id_adresu
)
