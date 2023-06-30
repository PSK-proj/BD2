OPTIONS (SKIP=0)
LOAD DATA
INFILE '.\\Dane\\dane_personalne.csv' "str '\r\n'"
INTO TABLE dane_personalne
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_danych,
  nazwisko,
  imie,
  PESEL,
  NIP,
  telefon,
  email
)
