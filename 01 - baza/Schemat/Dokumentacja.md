# Sieć kwiaciarni

## Tabela powiązań

| **Encja 1**       | **Encja 2**        | **Typ związku** | **Powód**                                                                       |
| ----------------- | ------------------ | --------------- | ------------------------------------------------------------------------------- |
| Adresy            | Kwiaciarnie        | jeden do jeden  | Każda kwiaciarnia ma jeden adres.                                               |
| Adresy            | DanePersonalne     | jeden do jeden  | Każde dane personalne mają jeden adres.                                         |
| Adresy            | Dostawcy           | jeden do jeden  | Każdy dostawca ma jeden adres.                                                  |
| Adresy            | DostawyKlientow    | jeden do jeden  | Każda dostawa do klienta ma jeden adres dostawy.                                |
| Kwiaciarnie       | Magazyny           | jeden do jeden  | Każda kwiaciarnia ma jeden magazyn.                                             |
| Kwiaciarnie       | Zatrudnienia       | jeden do wielu  | Kwiaciarnia może mieć wielu zatrudnionych pracowników.                          |
| Kwiaciarnie       | Rachunki           | jeden do wielu  | Kwiaciarnia może wystawić wiele rachunków.                                      |
| Kwiaciarnie       | KwiaciarnieUslugi  | jeden do wielu  | Kwiaciarnia może oferować wiele usług.                                          |
| Magazyny          | MagazynyGatunki    | jeden do wielu  | W jednym magazynie może być wiele gatunków kwiatów.                             |
| Magazyny          | Dostawy            | jeden do wielu  | Do jednego magazynu może przypadać wiele dostaw.                                |
| Gatunki           | MagazynyGatunki    | jeden do wielu  | Jeden gatunek kwiatów może być w wielu magazynach.                              |
| Gatunki           | PozycjaParagonu    | jeden do wielu  | Jeden gatunek kwiatów może wystąpić na wielu pozycjach paragonu.                |
| Gatunki           | Dostawy            | jeden do wielu  | Jeden gatunek kwiatów może być dostarczany wielokrotnie.                        |
| Gatunki           | ZamowieniaPozycje  | jeden do wielu  | Jeden gatunek kwiatów może wystąpić w wielu pozycjach zamówień.                 |
| Gatunki           | OfertySpecjalne    | jeden do wielu  | Jeden gatunek kwiatów może być częścią wielu ofert specjalnych.                 |
| Uslugi            | KwiaciarnieUslugi  | jeden do wielu  | Jedna usługa może być oferowana w wielu kwiaciarniach.                          |
| Uslugi            | PozycjaParagonu    | jeden do wielu  | Jedna usługa może wystąpić na wielu pozycjach paragonu.                         |
| Uslugi            | ZamowieniaPozycje  | jeden do wielu  | Jedna usługa może wystąpić w wielu pozycjach zamówień.                          |
| Uslugi            | OfertySpecjalne    | jeden do wielu  | Jedna usługa może być częścią wielu ofert specjalnych.                          |
| DanePersonalne    | Pracownicy         | jeden do jeden  | Każdy pracownik ma swoje dane personalne.                                       |
| DanePersonalne    | Klienci            | jeden do jeden  | Każdy klient ma swoje dane personalne.                                          |
| Pracownicy        | Zatrudnienia       | jeden do wielu  | Pracownik może być zatrudniony w wielu miejscach.                               |
| Pracownicy        | Rachunki           | jeden do wielu  | Pracownik może wystawić wiele rachunków.                                        |
| Klienci           | Rachunki           | jeden do wielu  | Klient może otrzymać wiele rachunków.                                           |
| Klienci           | Zamowienia         | jeden do wielu  | Klient może złożyć wiele zamówień.                                              |
| Klienci           | DostawyKlientow    | jeden do wielu  | Klient może otrzymać wiele dostaw.                                              |
| Klienci           | Reklamacje         | jeden do wielu  | Klient może złożyć wiele reklamacji.                                            |
| Rachunki          | PozycjaParagonu    | jeden do wielu  | Na jeden rachunek może przypadać wiele pozycji.                                 |
| Rachunki          | Reklamacje         | jeden do wielu  | Na jeden rachunek może przypadać wiele reklamacji.                              |
| Dostawcy          | Dostawy            | jeden do wielu  | Dostawca może dostarczyć wiele partii kwiatów.                                  |
| Dostawy           | Magazyny i Gatunki | jeden do jeden  | Każda dostawa jest powiązana z jednym gatunkiem kwiatów w magazynie.            |
| Zamowienia        | ZamowieniaPozycje  | jeden do wielu  | Na jedno zamówienie może przypadać wiele pozycji.                               |
| Zamowienia        | DostawyKlientow    | jeden do jeden  | Każde zamówienie ma jedną dostawę do klienta.                                   |
| Zamowienia        | Reklamacje         | jeden do wielu  | Na jedno zamówienie może przypadać wiele reklamacji.                            |
| ZamowieniaPozycje | Magazyny i Gatunki | jeden do jeden  | Każda pozycja zamówienia jest powiązana z jednym gatunkiem kwiatów w magazynie. |
| OfertySpecjalne   | PozycjaParagonu    | jeden do wielu  | Jedna oferta specjalna może wystąpić na wielu pozycjach paragonu.               |

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

| **Nazwa** | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**             |
| --------- | ---------------- | -------------- | ---------- | ------------ | ----------------- | -------------------- |
| id_danych | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator        |
| id_adresu | Nie              | Tak (Adresy)   | Nie        | Nie          | NUMBER            | Klucz obcy do adresu |
| nazwisko  | Nie              | Nie            | Nie        | Nie          | VARCHAR2(30)      | Nazwisko             |
| imie      | Nie              | Nie            | Tak        | Tak          | VARCHAR2(30)      | Imię                 |
| PESEL     | Nie              | Nie            | Tak        | Tak          | NUMBER(11)        | Numer PESEL          |
| NIP       | Nie              | Nie            | Tak        | Tak          | NUMBER(10)        | Numer NIP            |
| telefon   | Nie              | Nie            | Tak        | Tak          | VARCHAR2(50)      | Numer telefonu       |
| email     | Nie              | Nie            | Tak        | Tak          | VARCHAR2(50)      | Adres email          |

### 9. Pracownicy

#### Opis 9

Zawiera informacje o pracownikach kwiaciarni.

| **Nazwa**     | **Klucz główny** | **Klucz obcy**        | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**                          |
| ------------- | ---------------- | --------------------- | ---------- | ------------ | ----------------- | --------------------------------- |
| id_pracownika | Tak              | Nie                   | Tak        | Nie          | NUMBER            | Identyfikator                     |
| id_danych     | Nie              | Tak (Dane_personalne) | Nie        | Nie          | NUMBER            | Klucz obcy do danych personalnych |
| stanowisko    | Nie              | Nie                   | Nie        | Tak          | VARCHAR2(50)      | Stanowisko pracownika             |

### 10. Zatrudnienia

#### Opis 10

Zawiera informacje o zatrudnieniach pracowników w kwiaciarniach.

| **Nazwa**         | **Klucz główny** | **Klucz obcy**    | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**                 |
| ----------------- | ---------------- | ----------------- | ---------- | ------------ | ----------------- | ------------------------ |
| id_zatrudnienia   | Tak              | Nie               | Tak        | Nie          | NUMBER            | Identyfikator            |
| id_kwiaciarni     | Nie              | Tak (Kwiaciarnie) | Nie        | Nie          | NUMBER            | Klucz obcy do kwiaciarni |
| id_pracownika     | Nie              | Tak (Pracownicy)  | Nie        | Nie          | NUMBER            | Klucz obcy do pracownika |
| data_zatrudnienia | Nie              | Nie               | Nie        | Nie          | DATE              | Data zatrudnienia        |
| data_zwolnienia   | Nie              | Nie               | Nie        | Tak          | DATE              | Data zwolnienia          |

### 11. Klienci

#### Opis 11

Zawiera informacje o klientach kwiaciarni.

| **Nazwa**  | **Klucz główny** | **Klucz obcy**        | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**                          |
| ---------- | ---------------- | --------------------- | ---------- | ------------ | ----------------- | --------------------------------- |
| id_klienta | Tak              | Nie                   | Tak        | Nie          | NUMBER            | Identyfikator                     |
| id_danych  | Nie              | Tak (Dane_personalne) | Tak        | Nie          | NUMBER            | Klucz obcy do danych personalnych |

### 12. Rachunki

#### Opis 12

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

### 13. Pozycja paragonu

#### Opis 13

Zawiera szczegóły dotyczące każdej pozycji na paragonie.

| **Nazwa**           | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**               |
| ------------------- | ---------------- | -------------- | ---------- | ------------ | ----------------- | ---------------------- |
| id_pozycji_paragonu | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator          |
| id_rachunku         | Nie              | Tak (Rachunki) | Nie        | Nie          | NUMBER            | Klucz obcy do rachunku |
| id_gatunku          | Nie              | Tak (Gatunki)  | Nie        | Tak          | NUMBER            | Klucz obcy do gatunku  |
| id_uslugi           | Nie              | Tak (Uslugi)   | Nie        | Tak          | NUMBER            | Klucz obcy do usługi   |
| ilosc               | Nie              | Nie            | Nie        | Nie          | SMALLINT          | Ilość                  |

### 14. Dostawcy

#### Opis 14

Zawiera informacje o dostawcach dla kwiaciarni.

| **Nazwa**   | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**             |
| ----------- | ---------------- | -------------- | ---------- | ------------ | ----------------- | -------------------- |
| id_dostawcy | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator        |
| nazwa       | Nie              | Nie            | Nie        | Nie          | VARCHAR2(50)      | Nazwa dostawcy       |
| telefon     | Nie              | Nie            | Nie        | Tak          | VARCHAR2(50)      | Numer telefonu       |
| email       | Nie              | Nie            | Nie        | Tak          | VARCHAR2(50)      | Adres email          |
| id_adresu   | Nie              | Tak (Adresy)   | Nie        | Nie          | NUMBER            | Klucz obcy do adresu |

### 15. Dostawy

#### Opis 15

Zawiera informacje o dostawach roślin do magazynów kwiaciarni.

| **Nazwa**    | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**                   |
| ------------ | ---------------- | -------------- | ---------- | ------------ | ----------------- | -------------------------- |
| id_dostawy   | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator              |
| id_dostawcy  | Nie              | Tak (Dostawcy) | Nie        | Nie          | NUMBER            | Klucz obcy do dostawcy     |
| id_gatunku   | Nie              | Tak (Gatunki)  | Nie        | Nie          | NUMBER            | Klucz obcy do gatunku      |
| id_magazynu  | Nie              | Tak (Magazyny) | Nie        | Nie          | NUMBER            | Klucz obcy do magazynu     |
| ilosc        | Nie              | Nie            | Nie        | Nie          | SMALLINT          | Ilość dostarczonych roślin |
| data_dostawy | Nie              | Nie            | Nie        | Nie          | DATE              | Data dostawy               |

### 16. Zamówienia

#### Opis 16

Zawiera informacje o zamówieniach klientów.

| **Nazwa**       | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**              |
| --------------- | ---------------- | -------------- | ---------- | ------------ | ----------------- | --------------------- |
| id_zamowienia   | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator         |
| id_klienta      | Nie              | Tak (Klienci)  | Nie        | Nie          | NUMBER            | Klucz obcy do klienta |
| data_zamowienia | Nie              | Nie            | Nie        | Nie          | DATE              | Data zamówienia       |
| status          | Nie              | Nie            | Nie        | Nie          | VARCHAR2(20)      | Status zamówienia     |

### 17. Zamówienia Pozycje

#### Opis 17

Zawiera szczegółowe informacje o zamówionych pozycjach (gatunki roślin i usługi).

| **Nazwa**             | **Klucz główny** | **Klucz obcy**   | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**                    |
| --------------------- | ---------------- | ---------------- | ---------- | ------------ | ----------------- | --------------------------- |
| id_zamowienia_pozycje | Tak              | Nie              | Tak        | Nie          | NUMBER            | Identyfikator               |
| id_zamowienia         | Nie              | Tak (Zamówienia) | Nie        | Nie          | NUMBER            | Klucz obcy do zamówienia    |
| id_gatunku            | Nie              | Tak (Gatunki)    | Nie        | Tak          | NUMBER            | Klucz obcy do gatunku       |
| id_uslugi             | Nie              | Tak (Usługi)     | Nie        | Tak          | NUMBER            | Klucz obcy do usługi        |
| ilosc                 | Nie              | Nie              | Nie        | Nie          | SMALLINT          | Ilość zamówionych elementów |

### 18. Dostawy Klientów

#### Opis 18

Zawiera informacje o dostawach zamówień do klientów.

| **Nazwa**     | **Klucz główny** | **Klucz obcy**   | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**                 |
| ------------- | ---------------- | ---------------- | ---------- | ------------ | ----------------- | ------------------------ |
| id_dostawy    | Tak              | Nie              | Tak        | Nie          | NUMBER            | Identyfikator            |
| id_zamowienia | Nie              | Tak (Zamówienia) | Nie        | Nie          | NUMBER            | Klucz obcy do zamówienia |
| id_klienta    | Nie              | Tak (Klienci)    | Nie        | Nie          | NUMBER            | Klucz obcy do klienta    |
| id_adresu     | Nie              | Tak (Adresy)     | Nie        | Nie          | NUMBER            | Klucz obcy do adresu     |
| data_dostawy  | Nie              | Nie              | Nie        | Nie          | DATE              | Data dostawy             |
| status        | Nie              | Nie              | Nie        | Nie          | VARCHAR2(20)      | Status dostawy           |

### 19. Oferty Specjalne

#### Opis 19

Zawiera informacje o specjalnych ofertach kwiaciarni na określone gatunki roślin lub usługi.

| **Nazwa**        | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**                |
| ---------------- | ---------------- | -------------- | ---------- | ------------ | ----------------- | ----------------------- |
| id_oferty        | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator           |
| id_gatunku       | Nie              | Tak (Gatunki)  | Nie        | Tak          | NUMBER            | Klucz obcy do gatunku   |
| id_uslugi        | Nie              | Tak (Usługi)   | Nie        | Tak          | NUMBER            | Klucz obcy do usługi    |
| cena             | Nie              | Nie            | Nie        | Nie          | DECIMAL(10,2)     | Cena w ofercie          |
| data_rozpoczecia | Nie              | Nie            | Nie        | Nie          | DATE              | Data rozpoczęcia oferty |
| data_zakonczenia | Nie              | Nie            | Nie        | Nie          | DATE              | Data zakończenia oferty |

### 20. Reklamacje

#### Opis 20

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
