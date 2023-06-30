# Sieć kwiaciarni

## Tabela powiązań

| **Encja 1**     | **Encja 2**              | **Typ związku** | **Powód**                                                           |
| --------------- | ------------------------ | --------------- | ------------------------------------------------------------------- |
| adresy          | kwiaciarnie              | jeden do jeden  | Każda kwiaciarnia ma jeden adres.                                   |
| adresy          | dostawcy                 | jeden do jeden  | Każdy dostawca ma jeden adres.                                      |
| adresy          | dane_personalne_adresy   | jeden do wielu  | Jednym adresem może być powiązanych wiele danych personalnych.      |
| kwiaciarnie     | magazyny                 | jeden do jeden  | Każda kwiaciarnia ma jeden magazyn.                                 |
| kwiaciarnie     | kwiaciarnieuslugi        | jeden do wielu  | Każda kwiaciarnia może oferować wiele usług.                        |
| kwiaciarnie     | zatrudnienia             | jeden do wielu  | W jednej kwiaciarni może być zatrudnionych wielu pracowników.       |
| kwiaciarnie     | rachunki                 | jeden do wielu  | Każda kwiaciarnia może wystawić wiele rachunków.                    |
| magazyny        | magazynygatunki          | jeden do wielu  | W jednym magazynie może być przechowywanych wiele gatunków kwiatów. |
| magazyny        | dostawy                  | jeden do wielu  | Do jednego magazynu może być dostarczonych wiele dostaw.            |
| gatunki         | magazynygatunki          | jeden do wielu  | Jeden gatunek kwiatu może być przechowywany w wielu magazynach.     |
| gatunki         | pozycja_paragonu_gatunek | jeden do wielu  | Jeden gatunek kwiatu może być na wielu pozycjach paragonu.          |
| gatunki         | dostawy                  | jeden do wielu  | Jeden gatunek kwiatu może być dostarczany w wielu dostawach.        |
| gatunki         | zamowieniapozycje        | jeden do wielu  | Jeden gatunek kwiatu może być na wielu pozycjach zamówienia.        |
| gatunki         | oferty_specjalne         | jeden do wielu  | Jeden gatunek kwiatu może być częścią wielu ofert specjalnych.      |
| uslugi          | kwiaciarnieuslugi        | jeden do wielu  | Jedna usługa może być oferowana w wielu kwiaciarniach.              |
| uslugi          | pozycja_paragonu_usluga  | jeden do wielu  | Jedna usługa może być na wielu pozycjach paragonu.                  |
| uslugi          | zamowieniapozycje        | jeden do wielu  | Jedna usługa może być na wielu pozycjach zamówienia.                |
| uslugi          | oferty_specjalne         | jeden do wielu  | Jedna usługa może być częścią wielu ofert specjalnych.              |
| dostawcy        | dostawy                  | jeden do wielu  | Każdy dostawca może dokonać wielu dostaw do magazynu.               |
| dane_personalne | dane_personalne_adresy   | jeden do wielu  | Jedne dane personalne mogą być powiązane z wieloma adresami.        |
| dane_personalne | pracownicy               | jeden do jeden  | Każdy pracownik ma jedne dane personalne.                           |
| dane_personalne | klienci                  | jeden do jeden  | Każdy klient ma jedne dane personalne.                              |
| pracownicy      | zatrudnienia             | jeden do wielu  | Jeden pracownik może być zatrudniony w wielu kwiaciarniach.         |
| pracownicy      | rachunki                 | jeden do wielu  | Jeden pracownik może wystawić wiele rachunków.                      |
| klienci         | rachunki                 | jeden do wielu  | Jeden klient może otrzymać wiele rachunków.                         |
| klienci         | zamowienia               | jeden do wielu  | Jeden klient może złożyć wiele zamówień.                            |
| klienci         | dostawy_klientow         | jeden do wielu  | Jeden klient może otrzymać wiele dostaw.                            |
| klienci         | reklamacje               | jeden do wielu  | Jeden klient może złożyć wiele reklamacji.                          |
| rachunki        | pozycja_paragonu_gatunek | jeden do wielu  | Jeden rachunek może zawierać wiele pozycji z gatunkami kwiatów.     |
| rachunki        | pozycja_paragonu_usluga  | jeden do wielu  | Jeden rachunek może zawierać wiele pozycji z usługami.              |
| rachunki        | reklamacje               | jeden do jeden  | Każda reklamacja jest powiązana z jednym rachunkiem.                |
| zamowienia      | klienci                  | jeden do wielu  | Klient może mieć kilka zamówień.                                    |
| zamowienia      | zamowieniapozycje        | jeden do wielu  | Jedno zamówienie może zawierać wiele pozycji (produktów lub usług). |
| zamowienia      | dostawy_klientow         | jeden do jeden  | Każde zamówienie może mieć przypisaną jedną dostawę do klienta.     |
| zamowienia      | reklamacje               | jeden do jeden  | Każde zamówienie może być podstawą do jednej reklamacji.            |

## Opis elementów modelu

### 1. Adresy

#### Opis 1

Zawiera dane adresowe.

| **Nazwa**     | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**         |
| ------------- | ---------------- | -------------- | ---------- | ------------ | ----------------- | ---------------- |
| id_adresu     | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator    |
| kraj          | Nie              | Nie            | Nie        | Nie          | VARCHAR2(70)      | Kraj             |
| miasto        | Nie              | Nie            | Nie        | Nie          | VARCHAR2(70)      | Miasto           |
| ulica         | Nie              | Nie            | Nie        | Nie          | VARCHAR2(70)      | Ulica            |
| nr_budynku    | Nie              | Nie            | Nie        | Nie          | SMALLINT          | Numer budynku    |
| nr_mieszkania | Nie              | Nie            | Nie        | Tak          | SMALLINT          | Numer mieszkania |

### 2. Kwiaciarnie

#### Opis 2

Zawiera budynki kwiaciarni.

| **Nazwa**     | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**                 |
| ------------- | ---------------- | -------------- | ---------- | ------------ | ----------------- | ------------------------ |
| id_kwiaciarni | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator            |
| id_adresu     | Nie              | Tak (Adresy)   | Tak        | Nie          | NUMBER            | Klucz obcy do adresu     |
| nazwa         | Nie              | Nie            | Nie        | Nie          | VARCHAR2(70)      | Nazwa budynku kwiaciarni |

### 3. Magazyny

#### Opis 3

Zawiera informacje o magazynach.

| **Nazwa**     | **Klucz główny** | **Klucz obcy**    | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**                 |
| ------------- | ---------------- | ----------------- | ---------- | ------------ | ----------------- | ------------------------ |
| id_magazynu   | Tak              | Nie               | Tak        | Nie          | NUMBER            | Identyfikator            |
| id_kwiaciarni | Nie              | Tak (Kwiaciarnie) | Tak        | Nie          | NUMBER            | Klucz obcy do kwiaciarni |

### 4. Gatunki

#### Opis 4

Zawiera informacje o gatunkach kwiatów.

| **Nazwa**  | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**      |
| ---------- | ---------------- | -------------- | ---------- | ------------ | ----------------- | ------------- |
| id_gatunku | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator |
| nazwa      | Nie              | Nie            | Nie        | Nie          | VARCHAR2(30)      | Nazwa gatunku |
| cena       | Nie              | Nie            | Nie        | Nie          | DECIMAL(10,2)     | Cena gatunku  |

### 5. Magazynygatunki

#### Opis 5

Zawiera informacje o ilości danego gatunku kwiatów w magazynie.

| **Nazwa**          | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**               |
| ------------------ | ---------------- | -------------- | ---------- | ------------ | ----------------- | ---------------------- |
| id_magazynygatunki | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator          |
| id_magazynu        | Nie              | Tak (Magazyny) | Nie        | Nie          | NUMBER            | Klucz obcy do magazynu |
| id_gatunku         | Nie              | Tak (Gatunki)  | Nie        | Nie          | NUMBER            | Klucz obcy do gatunku  |
| ilosc              | Nie              | Nie            | Nie        | Nie          | SMALLINT          | Ilość danego gatunku   |

### 6. Uslugi

#### Opis 6

Zawiera informacje o usługach oferowanych przez kwiaciarnię.

| **Nazwa** | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**          |
| --------- | ---------------- | -------------- | ---------- | ------------ | ----------------- | ----------------- |
| id_uslugi | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator     |
| nazwa     | Nie              | Nie            | Tak        | Nie          | VARCHAR2(50)      | Nazwa usługi      |
| doplata   | Nie              | Nie            | Nie        | Nie          | DECIMAL(10,2)     | Dopłata za usługę |

### 7. Kwiaciarnieuslugi

#### Opis 7

Zawiera informacje o usługach oferowanych przez poszczególne kwiaciarnie.

| **Nazwa**            | **Klucz główny** | **Klucz obcy**    | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**                 |
| -------------------- | ---------------- | ----------------- | ---------- | ------------ | ----------------- | ------------------------ |
| id_kwiaciarnieuslugi | Tak              | Nie               | Tak        | Nie          | NUMBER            | Identyfikator            |
| id_kwiaciarni        | Nie              | Tak (Kwiaciarnie) | Nie        | Nie          | NUMBER            | Klucz obcy do kwiaciarni |
| id_uslugi            | Nie              | Tak (Uslugi)      | Nie        | Nie          | NUMBER            | Klucz obcy do usługi     |

### 8. Dane_personalne

#### Opis 8

Zawiera podstawowe dane personalne osób związanych z kwiaciarnią (klienci, pracownicy).

| **Nazwa** | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**       |
| --------- | ---------------- | -------------- | ---------- | ------------ | ----------------- | -------------- |
| id_danych | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator  |
| nazwisko  | Nie              | Nie            | Nie        | Nie          | VARCHAR2(30)      | Nazwisko       |
| imie      | Nie              | Nie            | Tak        | Tak          | VARCHAR2(30)      | Imię           |
| PESEL     | Nie              | Nie            | Tak        | Tak          | NUMBER(11)        | Numer PESEL    |
| NIP       | Nie              | Nie            | Tak        | Tak          | NUMBER(10)        | Numer NIP      |
| telefon   | Nie              | Nie            | Tak        | Tak          | VARCHAR2(50)      | Numer telefonu |
| email     | Nie              | Nie            | Tak        | Tak          | VARCHAR2(50)      | Adres email    |

### 9. Dane_personalneAdresy

#### Opis 9

Zawiera informacje o adresach połączonych z danymi personalnymi.

| **Nazwa** | **Klucz główny** | **Klucz obcy**        | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**      |
| --------- | ---------------- | --------------------- | ---------- | ------------ | ----------------- | ------------- |
| id_danych | Tak              | Tak (Dane_personalne) | Tak        | Nie          | NUMBER            | Identyfikator |
| id_adresu | Tak              | Tak (Adresy)          | Tak        | Nie          | NUMBER            | Identyfikator |

### 10. Pracownicy

#### Opis 10

Zawiera informacje o pracownikach kwiaciarni.

| **Nazwa**     | **Klucz główny** | **Klucz obcy**        | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**                          |
| ------------- | ---------------- | --------------------- | ---------- | ------------ | ----------------- | --------------------------------- |
| id_pracownika | Tak              | Nie                   | Tak        | Nie          | NUMBER            | Identyfikator                     |
| id_danych     | Nie              | Tak (Dane_personalne) | Nie        | Nie          | NUMBER            | Klucz obcy do danych personalnych |
| stanowisko    | Nie              | Nie                   | Nie        | Tak          | VARCHAR2(50)      | Stanowisko pracownika             |

### 11. Zatrudnienia

#### Opis 11

Zawiera informacje o zatrudnieniach pracowników w kwiaciarniach.

| **Nazwa**         | **Klucz główny** | **Klucz obcy**    | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**                 |
| ----------------- | ---------------- | ----------------- | ---------- | ------------ | ----------------- | ------------------------ |
| id_zatrudnienia   | Tak              | Nie               | Tak        | Nie          | NUMBER            | Identyfikator            |
| id_kwiaciarni     | Nie              | Tak (Kwiaciarnie) | Nie        | Nie          | NUMBER            | Klucz obcy do kwiaciarni |
| id_pracownika     | Nie              | Tak (Pracownicy)  | Nie        | Nie          | NUMBER            | Klucz obcy do pracownika |
| data_zatrudnienia | Nie              | Nie               | Nie        | Nie          | DATE              | Data zatrudnienia        |
| data_zwolnienia   | Nie              | Nie               | Nie        | Tak          | DATE              | Data zwolnienia          |

### 12. Klienci

#### Opis 12

Zawiera informacje o klientach kwiaciarni.

| **Nazwa**  | **Klucz główny** | **Klucz obcy**        | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**                          |
| ---------- | ---------------- | --------------------- | ---------- | ------------ | ----------------- | --------------------------------- |
| id_klienta | Tak              | Nie                   | Tak        | Nie          | NUMBER            | Identyfikator                     |
| id_danych  | Nie              | Tak (Dane_personalne) | Tak        | Nie          | NUMBER            | Klucz obcy do danych personalnych |

### 13. Rachunki

#### Opis 13

Zawiera informacje o rachunkach wystawionych przez kwiaciarnię.

| **Nazwa**      | **Klucz główny** | **Klucz obcy**    | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**                 |
| -------------- | ---------------- | ----------------- | ---------- | ------------ | ----------------- | ------------------------ |
| id_rachunku    | Tak              | Nie               | Tak        | Nie          | NUMBER            | Identyfikator            |
| id_kwiaciarni  | Nie              | Tak (Kwiaciarnie) | Nie        | Nie          | NUMBER            | Klucz obcy do kwiaciarni |
| id_pracownika  | Nie              | Tak (Pracownicy)  | Nie        | Nie          | NUMBER            | Klucz obcy do pracownika |
| id_klienta     | Nie              | Tak (Klienci)     | Nie        | Tak          | NUMBER            | Klucz obcy do klienta    |
| typ_rachunku   | Nie              | Nie               | Nie        | Nie          | VARCHAR2(7)       | Typ rachunku             |
| data_sprzedazy | Nie              | Nie               | Nie        | Nie          | DATE              | Data sprzedaży           |
| suma_pln       | Nie              | Nie               | Nie        | Nie          | DECIMAL(10,2)     | Suma do zapłaty w PLN    |

### 14. Pozycja paragonu_gatunek

#### Opis 14

Zawiera szczegóły dotyczące każdej pozycji gatunku na paragonie.

| **Nazwa**           | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**               |
| ------------------- | ---------------- | -------------- | ---------- | ------------ | ----------------- | ---------------------- |
| id_pozycji_paragonu | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator          |
| id_rachunku         | Nie              | Tak (Rachunki) | Nie        | Nie          | NUMBER            | Klucz obcy do rachunku |
| id_gatunku          | Nie              | Tak (Gatunki)  | Nie        | Tak          | NUMBER            | Klucz obcy do gatunku  |
| ilosc               | Nie              | Nie            | Nie        | Nie          | SMALLINT          | Ilość                  |

### 15. Pozycja paragonu_usługa

#### Opis 15

Zawiera szczegóły dotyczące każdej pozycji usług na paragonie.

| **Nazwa**           | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**               |
| ------------------- | ---------------- | -------------- | ---------- | ------------ | ----------------- | ---------------------- |
| id_pozycji_paragonu | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator          |
| id_rachunku         | Nie              | Tak (Rachunki) | Nie        | Nie          | NUMBER            | Klucz obcy do rachunku |
| id_uslugi           | Nie              | Tak (Uslugi)   | Nie        | Tak          | NUMBER            | Klucz obcy do usługi   |
| ilosc               | Nie              | Nie            | Nie        | Nie          | SMALLINT          | Ilość                  |

### 16. Dostawcy

#### Opis 16

Zawiera informacje o dostawcach dla kwiaciarni.

| **Nazwa**   | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**             |
| ----------- | ---------------- | -------------- | ---------- | ------------ | ----------------- | -------------------- |
| id_dostawcy | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator        |
| nazwa       | Nie              | Nie            | Nie        | Nie          | VARCHAR2(50)      | Nazwa dostawcy       |
| telefon     | Nie              | Nie            | Nie        | Tak          | VARCHAR2(50)      | Numer telefonu       |
| email       | Nie              | Nie            | Nie        | Tak          | VARCHAR2(50)      | Adres email          |
| id_adresu   | Nie              | Tak (Adresy)   | Nie        | Nie          | NUMBER            | Klucz obcy do adresu |

### 17. Dostawy

#### Opis 17

Zawiera informacje o dostawach roślin do magazynów kwiaciarni.

| **Nazwa**    | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**                   |
| ------------ | ---------------- | -------------- | ---------- | ------------ | ----------------- | -------------------------- |
| id_dostawy   | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator              |
| id_dostawcy  | Nie              | Tak (Dostawcy) | Nie        | Nie          | NUMBER            | Klucz obcy do dostawcy     |
| id_gatunku   | Nie              | Tak (Gatunki)  | Nie        | Nie          | NUMBER            | Klucz obcy do gatunku      |
| id_magazynu  | Nie              | Tak (Magazyny) | Nie        | Nie          | NUMBER            | Klucz obcy do magazynu     |
| ilosc        | Nie              | Nie            | Nie        | Nie          | SMALLINT          | Ilość dostarczonych roślin |
| data_dostawy | Nie              | Nie            | Nie        | Nie          | DATE              | Data dostawy               |

### 18. Zamówienia

#### Opis 18

Zawiera informacje o zamówieniach klientów.

| **Nazwa**       | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**              |
| --------------- | ---------------- | -------------- | ---------- | ------------ | ----------------- | --------------------- |
| id_zamowienia   | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator         |
| id_klienta      | Nie              | Tak (Klienci)  | Nie        | Nie          | NUMBER            | Klucz obcy do klienta |
| data_zamowienia | Nie              | Nie            | Nie        | Nie          | DATE              | Data zamówienia       |
| status          | Nie              | Nie            | Nie        | Nie          | VARCHAR2(20)      | Status zamówienia     |

### 19. Zamówienia Pozycje

#### Opis 19

Zawiera szczegółowe informacje o zamówionych pozycjach (gatunki roślin i usługi).

| **Nazwa**             | **Klucz główny** | **Klucz obcy**   | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**                    |
| --------------------- | ---------------- | ---------------- | ---------- | ------------ | ----------------- | --------------------------- |
| id_zamowienia_pozycje | Tak              | Nie              | Tak        | Nie          | NUMBER            | Identyfikator               |
| id_zamowienia         | Nie              | Tak (Zamówienia) | Nie        | Nie          | NUMBER            | Klucz obcy do zamówienia    |
| id_gatunku            | Nie              | Tak (Gatunki)    | Nie        | Tak          | NUMBER            | Klucz obcy do gatunku       |
| id_uslugi             | Nie              | Tak (Usługi)     | Nie        | Tak          | NUMBER            | Klucz obcy do usługi        |
| ilosc                 | Nie              | Nie              | Nie        | Nie          | SMALLINT          | Ilość zamówionych elementów |

### 20. Dostawy Klientów

#### Opis 20

Zawiera informacje o dostawach zamówień do klientów.

| **Nazwa**     | **Klucz główny** | **Klucz obcy**   | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**                 |
| ------------- | ---------------- | ---------------- | ---------- | ------------ | ----------------- | ------------------------ |
| id_dostawy    | Tak              | Nie              | Tak        | Nie          | NUMBER            | Identyfikator            |
| id_zamowienia | Nie              | Tak (Zamówienia) | Nie        | Nie          | NUMBER            | Klucz obcy do zamówienia |
| id_klienta    | Nie              | Tak (Klienci)    | Nie        | Nie          | NUMBER            | Klucz obcy do klienta    |
| id_adresu     | Nie              | Tak (Adresy)     | Nie        | Nie          | NUMBER            | Klucz obcy do adresu     |
| data_dostawy  | Nie              | Nie              | Nie        | Nie          | DATE              | Data dostawy             |
| status        | Nie              | Nie              | Nie        | Nie          | VARCHAR2(20)      | Status dostawy           |

### 21. Oferty Specjalne

#### Opis 21

Zawiera informacje o specjalnych ofertach kwiaciarni na określone gatunki roślin lub usługi.

| **Nazwa**        | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**                |
| ---------------- | ---------------- | -------------- | ---------- | ------------ | ----------------- | ----------------------- |
| id_oferty        | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator           |
| id_gatunku       | Nie              | Tak (Gatunki)  | Nie        | Tak          | NUMBER            | Klucz obcy do gatunku   |
| id_uslugi        | Nie              | Tak (Usługi)   | Nie        | Tak          | NUMBER            | Klucz obcy do usługi    |
| cena             | Nie              | Nie            | Nie        | Nie          | DECIMAL(10,2)     | Cena w ofercie          |
| data_rozpoczecia | Nie              | Nie            | Nie        | Nie          | DATE              | Data rozpoczęcia oferty |
| data_zakonczenia | Nie              | Nie            | Nie        | Nie          | DATE              | Data zakończenia oferty |

### 22. Reklamacje

#### Opis 22

Zawiera informacje o reklamacjach złożonych przez klientów.

| **Nazwa**       | **Klucz główny** | **Klucz obcy**   | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**                 |
| --------------- | ---------------- | ---------------- | ---------- | ------------ | ----------------- | ------------------------ |
| id_reklamacji   | Tak              | Nie              | Tak        | Nie          | NUMBER            | Identyfikator            |
| id_klienta      | Nie              | Tak (Klienci)    | Nie        | Nie          | NUMBER            | Klucz obcy do klienta    |
| id_rachunku     | Nie              | Tak (Rachunki)   | Nie        | Tak          | NUMBER            | Klucz obcy do rachunku   |
| id_zamowienia   | Nie              | Tak (Zamówienia) | Nie        | Tak          | NUMBER            | Klucz obcy do zamówienia |
| data_reklamacji | Nie              | Nie              | Nie        | Nie          | DATE              | Data złożenia reklamacji |
| status          | Nie              | Nie              | Nie        | Nie          | VARCHAR2(20)      | Status reklamacji        |
| opis            | Nie              | Nie              | Nie        | Tak          | VARCHAR2(500)     | Opis reklamacji          |
