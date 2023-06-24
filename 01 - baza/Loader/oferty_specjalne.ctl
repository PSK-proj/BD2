OPTIONS (SKIP=0)
LOAD DATA
INFILE '.\\Dane\\oferty_specjalne.csv' "str '\r\n'"
INTO TABLE oferty_specjalne
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_oferty,
  id_gatunku,
  id_uslugi,
  cena CHAR "TO_NUMBER(:cena, '99999999.99', 'NLS_NUMERIC_CHARACTERS='',.''')",
  data_rozpoczecia,
  data_zakonczenia
)
