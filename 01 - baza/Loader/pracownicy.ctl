OPTIONS (SKIP=0)
LOAD DATA
INFILE '.\\Dane\\pracownicy.csv' "str '\r\n'"
INTO TABLE pracownicy
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_pracownika,
  id_danych,
  stanowisko
)
