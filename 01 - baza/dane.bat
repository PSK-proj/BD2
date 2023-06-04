@echo off
set "user=c##BD2
set "pass=123"
set "instance=xe"

sqlldr %user%/%pass%@%instance% CONTROL=./Loader/adresy.ctl
sqlldr %user%/%pass%@%instance% CONTROL=./Loader/kwiaciarnie.ctl
sqlldr %user%/%pass%@%instance% CONTROL=./Loader/magazyny.ctl
sqlldr %user%/%pass%@%instance% CONTROL=./Loader/gatunki.ctl
sqlldr %user%/%pass%@%instance% CONTROL=./Loader/magazynygatunki.ctl
sqlldr %user%/%pass%@%instance% CONTROL=./Loader/uslugi.ctl
sqlldr %user%/%pass%@%instance% CONTROL=./Loader/kwiaciarnieuslugi.ctl
sqlldr %user%/%pass%@%instance% CONTROL=./Loader/dane_personalne.ctl
sqlldr %user%/%pass%@%instance% CONTROL=./Loader/pracownicy.ctl
sqlldr %user%/%pass%@%instance% CONTROL=./Loader/zatrudnienia.ctl
sqlldr %user%/%pass%@%instance% CONTROL=./Loader/klienci.ctl
sqlldr %user%/%pass%@%instance% CONTROL=./Loader/rachunki.ctl
sqlldr %user%/%pass%@%instance% CONTROL=./Loader/pozycja_paragonu.ctl
sqlldr %user%/%pass%@%instance% CONTROL=./Loader/dostawcy.ctl
sqlldr %user%/%pass%@%instance% CONTROL=./Loader/dostawy.ctl
sqlldr %user%/%pass%@%instance% CONTROL=./Loader/zamowienia.ctl
sqlldr %user%/%pass%@%instance% CONTROL=./Loader/zamowieniapozycje.ctl
sqlldr %user%/%pass%@%instance% CONTROL=./Loader/dostawy_klientow.ctl
sqlldr %user%/%pass%@%instance% CONTROL=./Loader/oferty_specjalne.ctl
sqlldr %user%/%pass%@%instance% CONTROL=./Loader/reklamacje.ctl

move *.log ./Log
PAUSE