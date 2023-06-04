OPTIONS (SKIP=0)
LOAD DATA
INFILE '../Dane/rachunki.csv'
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
  suma_pln
)
