OPTIONS (SKIP=0)
LOAD DATA
INFILE '../Dane/dane_personalne.csv'
INTO TABLE dane_personalne
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_danych,
  id_adresu,
  nazwisko,
  imie,
  PESEL,
  NIP,
  telefon,
  email
)