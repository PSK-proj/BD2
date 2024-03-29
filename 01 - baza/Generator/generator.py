from faker import Faker
from datetime import datetime
import random
import csv
import sys

if sys.stdout.encoding != 'utf-8':
    sys.stdout.reconfigure(encoding='utf-8')

# Inicjalizacja biblioteki Faker
fake = Faker('pl_PL')

# Ilość danych do wygenerowania
num_of_rows = 1000

#* Generowanie danych dla tabeli 'adresy'
with open('../Dane/adresy.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    for _ in range(num_of_rows):
        id_adresu = _
        kraj = fake.country()
        miasto = fake.city()
        ulica = fake.street_name()
        nr_budynku = random.randint(1, 900)
        nr_mieszkania = random.randint(0, 100)
        writer.writerow([id_adresu, kraj, miasto, ulica, nr_budynku, nr_mieszkania])

#* Generowanie danych dla tabeli 'kwiaciarnie'
with open('../Dane/kwiaciarnie.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    for _ in range(100):
        id_kwiaciarni = _
        id_adresu = _
        nazwa = fake.company()
        writer.writerow([id_kwiaciarni, id_adresu, nazwa])

#* Generowanie danych dla tabeli 'magazyny'
with open('../Dane/magazyny.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    for _ in range(100):
        id_magazynu = _
        id_kwiaciarni = _
        writer.writerow([id_magazynu, id_kwiaciarni])

#* Generowanie danych dla tabeli 'gatunki'
with open('../Dane/gatunki.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    for _ in range(100):
        id_gatunku = _
        porzadkowy = str(_)
        nazwa = fake.random_element(elements=('Róże_', 'Tulipany_', 'Storczyki_', 'Goździki_', 'Gerbery_')) + porzadkowy
        cena = round(random.uniform(5.5, 30.0), 2)
        writer.writerow([id_gatunku, nazwa, cena])

#* Generowanie danych dla tabeli 'magazynygatunki'
with open('../Dane/magazynygatunki.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    for _ in range(num_of_rows * 10):
        id_magazynygatunki = _
        id_magazynu = random.randint(0, 100 - 1)
        id_gatunku = random.randint(0, 100 - 1)
        ilosc = random.randint(0, 200)
        writer.writerow([id_magazynygatunki, id_magazynu, id_gatunku, ilosc])

#* Generowanie danych dla tabeli 'uslugi'
with open('../Dane/uslugi.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    for _ in range(100):
        id_uslugi = _
        nazwa = fake.bs()
        doplata = round(random.uniform(0.0, 50.0), 2)
        writer.writerow([id_uslugi, nazwa, doplata])

#* Generowanie danych dla tabeli 'kwiaciarnieuslugi'
with open('../Dane/kwiaciarnieuslugi.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    for _ in range(num_of_rows * 10):
        id_kwiaciarnieuslugi = _
        id_kwiaciarni = random.randint(0, 100 - 1)
        id_uslugi = random.randint(0, 100 - 1)
        writer.writerow([id_kwiaciarnieuslugi, id_kwiaciarni, id_uslugi])

#* Generowanie danych dla tabeli 'dane_personalne'
with open('../Dane/dane_personalne.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    for _ in range(num_of_rows):
        id_danych = _
        nazwisko = fake.last_name()
        imie = fake.first_name()
        PESEL = fake.random_number(digits=11, fix_len=True)
        NIP = fake.random_number(digits=10, fix_len=True)
        telefon = fake.phone_number()
        email = fake.email()
        writer.writerow([id_danych, nazwisko, imie, PESEL, NIP, telefon, email])

#* Generowanie danych dla tabeli 'dane_personalneadresy'
with open('../Dane/dane_personalneadresy.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    for _ in range(num_of_rows):
        id_danych = _
        id_adresu = random.randint(1, num_of_rows - 1)
        writer.writerow([id_danych, id_adresu])

#* Generowanie danych dla tabeli 'pracownicy'
with open('../Dane/pracownicy.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    for _ in range(100):
        id_pracownika = _
        id_danych = _ + 801
        stanowisko = fake.random_element(elements=('Kasjer', 'Florysta', 'Manager', 'Kurier'))
        writer.writerow([id_pracownika, id_danych, stanowisko])

#* Generowanie danych dla tabeli 'zatrudnienia'
with open('../Dane/zatrudnienia.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    for _ in range(num_of_rows):
        id_zatrudnienia = _
        id_kwiaciarni = random.randint(0, 100 - 1)
        id_pracownika = random.randint(0, 100 - 1)
        data_przyjecia = fake.date_between(start_date='-10y', end_date='today')
        data_przyjecia = datetime.strptime(str(data_przyjecia), '%Y-%m-%d').strftime('%d-%m-%y')
        czy_na_urlopie = random.randint(0, 1)
        czy_zwolniony = random.randint(0, 1)
        data_zwolnienia = fake.date_between(start_date='-1y', end_date='today') if czy_zwolniony else None
        data_zwolnienia = datetime.strptime(str(data_zwolnienia), '%Y-%m-%d').strftime('%d-%m-%y')  if czy_zwolniony else None
        writer.writerow([id_zatrudnienia, id_kwiaciarni, id_pracownika, data_przyjecia, czy_na_urlopie, czy_zwolniony, data_zwolnienia])

#* Generowanie danych dla tabeli 'klienci'
with open('../Dane/klienci.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    for _ in range(800):
        id_klienta = _
        id_danych = _
        writer.writerow([id_klienta, id_danych])

#* Generowanie danych dla tabeli 'rachunki'
with open('../Dane/rachunki.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    for _ in range(num_of_rows):
        id_rachunku = _
        id_kwiaciarni = random.randint(0, 100 - 1)
        id_pracownika = random.randint(0, 100 - 1)
        id_klienta = random.randint(0, 800 - 1)
        typ_rachunku = random.choice(['faktura', 'paragon'])
        data_sprzedazy = fake.date_between(start_date='-1y', end_date='today')
        data_sprzedazy = datetime.strptime(str(data_sprzedazy), '%Y-%m-%d').strftime('%d-%m-%y')
        suma_pln = round(random.uniform(10, 1000), 2)
        writer.writerow([id_rachunku, id_kwiaciarni, id_pracownika, id_klienta, typ_rachunku, data_sprzedazy, suma_pln])

#* Generowanie danych dla tabeli 'pozycja_paragonu_gatunek'
with open('../Dane/pozycja_paragonu_gatunek.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    for _ in range(num_of_rows):
        id_pozycji_paragonu = _
        id_rachunku = random.randint(0, num_of_rows - 1)
        id_gatunku = random.randint(0, 100 - 1)
        ilosc = random.randint(1, 10)
        writer.writerow([id_pozycji_paragonu, id_rachunku, id_gatunku, ilosc])

#* Generowanie danych dla tabeli 'pozycja_paragonu_usluga'
with open('../Dane/pozycja_paragonu_usluga.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    for _ in range(num_of_rows):
        id_pozycji_paragonu = _
        id_rachunku = random.randint(0, num_of_rows - 1)
        id_uslugi = random.randint(0, 100 - 1)
        ilosc = random.randint(1, 10)
        writer.writerow([id_pozycji_paragonu, id_rachunku, id_uslugi, ilosc])

#* Generowanie danych dla tabeli 'dostawcy'
with open('../Dane/dostawcy.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    for _ in range(num_of_rows):
        id_dostawcy = _
        nazwa = fake.company()
        telefon = fake.phone_number()
        email = fake.email()
        id_adresu = random.randint(101, num_of_rows - 1)
        writer.writerow([id_dostawcy, nazwa, telefon, email, id_adresu])

#* Generowanie danych dla tabeli 'dostawy'
with open('../Dane/dostawy.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    for _ in range(num_of_rows):
        id_dostawy = _
        id_dostawcy = random.randint(0, num_of_rows - 1)
        id_gatunku = random.randint(0, 100 - 1)
        id_magazynu = random.randint(0, 100 - 1)
        ilosc = random.randint(1, 10)
        data_dostawy = fake.date_between(start_date='-1y', end_date='today')
        data_dostawy = datetime.strptime(str(data_dostawy), '%Y-%m-%d').strftime('%d-%m-%y')
        writer.writerow([id_dostawy, id_dostawcy, id_gatunku, id_magazynu, ilosc, data_dostawy])

#* Generowanie danych dla tabeli 'zamowienia'
with open('../Dane/zamowienia.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    for _ in range(num_of_rows):
        id_zamowienia = _
        id_klienta = random.randint(0, 800 - 1)
        data_zamowienia = fake.date_between(start_date='-1y', end_date='today')
        data_zamowienia = datetime.strptime(str(data_zamowienia), '%Y-%m-%d').strftime('%d-%m-%y')
        status = random.choice(['oczekuje', 'zrealizowano', 'nie zrealizowano'])
        writer.writerow([id_zamowienia, id_klienta, data_zamowienia, status])

#* Generowanie danych dla tabeli 'zamowieniapozycje'
with open('../Dane/zamowieniapozycje.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    for _ in range(num_of_rows * 10):
        id_zamowieniapozycje = _
        id_zamowienia = random.randint(0, num_of_rows - 1)
        id_gatunku = random.randint(0, 100 - 1)
        id_uslugi = random.randint(0, 100 - 1)
        ilosc = random.randint(1, 10)
        writer.writerow([id_zamowieniapozycje, id_zamowienia, id_gatunku, id_uslugi, ilosc])

#* Generowanie danych dla tabeli 'dostawy_klientów'
with open('../Dane/dostawy_klientow.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    for _ in range(num_of_rows):
        id_dostawy = _
        id_zamowienia = random.randint(0, num_of_rows - 1)
        id_klienta = random.randint(0, 800 - 1)
        id_adresu = random.randint(101, num_of_rows - 1)
        data_dostawy  = fake.date_between(start_date='-1y', end_date='today')
        data_dostawy = datetime.strptime(str(data_dostawy), '%Y-%m-%d').strftime('%d-%m-%y')
        status = random.choice(['oczekuje', 'dostarczono', 'nie dostarczono'])
        writer.writerow([id_dostawy, id_zamowienia, id_klienta, id_adresu, data_dostawy, status])

#* Generowanie danych dla tabeli 'oferty_specjalne'
with open('../Dane/oferty_specjalne.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    for _ in range(num_of_rows):
        id_oferty = _
        id_gatunku = random.randint(0, 100 - 1)
        id_uslugi = random.randint(0, 100 - 1)
        cena = round(random.uniform(50.0, 800.0), 2)
        data_rozpoczecia  = fake.date_between(start_date='-1y', end_date='-6m')
        data_rozpoczecia2 = datetime.strptime(str(data_rozpoczecia), '%Y-%m-%d').strftime('%d-%m-%y')
        data_zakonczenia = fake.date_between(start_date=data_rozpoczecia, end_date='today')
        data_zakonczenia = datetime.strptime(str(data_zakonczenia), '%Y-%m-%d').strftime('%d-%m-%y')
        writer.writerow([id_oferty, id_gatunku, id_uslugi, cena, data_rozpoczecia2, data_zakonczenia])

#* Generowanie danych dla tabeli 'reklamacje'
with open('../Dane/reklamacje.csv', 'w', newline='', encoding='utf-8') as file:
    writer = csv.writer(file)
    for _ in range(num_of_rows):
        id_reklamacji = _
        id_klienta = random.randint(0, 800 - 1)
        id_rachunku = random.randint(0, num_of_rows - 1)
        id_zamowienia = random.randint(0, num_of_rows - 1)
        data_reklamacji  = fake.date_between(start_date='-1y', end_date='today')
        data_reklamacji = datetime.strptime(str(data_reklamacji), '%Y-%m-%d').strftime('%d-%m-%y')
        status = random.choice(['oczekuje', 'przyjęto', 'odrzucono'])
        opis = random.choice([
          'Aut eum deleniti praesentium explicabo non est. Rerum reiciendis et sint ut. Fuga saepe aut.',
          'Et doloremque praesentium est. Aut sint quos autem. Magnam ut placeat quia deserunt.',
          'Aliquam voluptatem porro quo eligendi dolores incidunt. Molestiae ipsam architecto.'])
        writer.writerow([id_reklamacji, id_klienta, id_rachunku, id_zamowienia, data_reklamacji, status, opis])
