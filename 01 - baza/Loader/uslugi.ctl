OPTIONS (SKIP=0)
LOAD DATA
INFILE '.\\Dane\\uslugi.csv' "str '\r\n'"
INTO TABLE uslugi
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_uslugi,
  nazwa,
  doplata CHAR "TO_NUMBER(:doplata, '99999999.99', 'NLS_NUMERIC_CHARACTERS='',.''')"
)
