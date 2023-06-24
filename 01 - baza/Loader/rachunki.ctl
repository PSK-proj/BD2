OPTIONS (SKIP=0)
LOAD DATA
INFILE '.\\Dane\\rachunki.csv' "str '\r\n'"
INTO TABLE rachunki
FIELDS TERMINATED BY ','
TRAILING NULLCOLS
(
  id_rachunku,
  id_kwiaciarni,
  id_pracownika,
  id_klienta,
  typ_rachunku,
  data_sprzedazy,
  suma_pln CHAR "TO_NUMBER(:suma_pln, '99999999.99', 'NLS_NUMERIC_CHARACTERS='',.''')"
)
