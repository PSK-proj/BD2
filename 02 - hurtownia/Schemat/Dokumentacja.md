## Hurtownia Danych

### 1. Dim_Miasto

Tabela zawiera informacje o miastach.

| **Nazwa**    | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**             |
| ------------ | ---------------- | -------------- | ---------- | ------------ | ----------------- | -------------------- |
| id_miasta    | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator miasta |
| nazwa_miasta | Nie              | Nie            | Nie        | Nie          | VARCHAR2(50)      | Nazwa miasta         |

### 2. Dim_Kwiaciarnia

Tabela zawiera informacje o kwiaciarniach.

| **Nazwa**     | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**                                       |
| ------------- | ---------------- | -------------- | ---------- | ------------ | ----------------- | ---------------------------------------------- |
| id_kwiaciarni | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator kwiaciarni                       |
| nazwa         | Nie              | Nie            | Nie        | Nie          | VARCHAR2(100)     | Nazwa kwiaciarni                               |
| id_miasta     | Nie              | Tak            | Nie        | Tak          | NUMBER            | Klucz obcy odwołujący się do tabeli Dim_Miasto |

### 3. Dim_Gatunek

Tabela zawiera informacje o gatunkach kwiatów.

| **Nazwa**  | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**              |
| ---------- | ---------------- | -------------- | ---------- | ------------ | ----------------- | --------------------- |
| id_gatunku | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator gatunku |
| nazwa      | Nie              | Nie            | Nie        | Nie          | VARCHAR2(50)      | Nazwa gatunku         |

### 4. Dim_Usluga

Tabela zawiera informacje o dostępnych usługach.

| **Nazwa** | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**             |
| --------- | ---------------- | -------------- | ---------- | ------------ | ----------------- | -------------------- |
| id_uslugi | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator usługi |
| nazwa     | Nie              | Nie            | Nie        | Nie          | VARCHAR2(100)     | Nazwa usługi         |
| cena      | Nie              | Nie            | Nie        | Nie          | DECIMAL(10, 2)    | Cena usługi          |

### 5. Dim_Pracownik

Tabela zawiera informacje o pracownikach kwiaciarni.

| **Nazwa**     | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**                                            |
| ------------- | ---------------- | -------------- | ---------- | ------------ | ----------------- | --------------------------------------------------- |
| id_pracownika | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator pracownika                            |
| imie          | Nie              | Nie            | Nie        | Nie          | VARCHAR2(50)      | Imię pracownika                                     |
| nazwisko      | Nie              | Nie            | Nie        | Nie          | VARCHAR2(50)      | Nazwisko pracownika                                 |
| id_kwiaciarni | Nie              | Tak            | Nie        | Nie          | NUMBER            | Klucz obcy odwołujący się do tabeli Dim_Kwiaciarnia |

### 6. Fakty_Sprzedaż

Tabela zawiera informacje o sprzedaży usług i produktów w kwiaciarniach.

| **Nazwa**       | **Klucz główny** | **Klucz obcy** | **Unique** | **NULLable** | **Typ/Dziedzina** | **Opis**                                          |
| --------------- | ---------------- | -------------- | ---------- | ------------ | ----------------- | ------------------------------------------------- |
| id_sprzedazy    | Tak              | Nie            | Tak        | Nie          | NUMBER            | Identyfikator sprzedaży                           |
| data_sprzedazy  | Nie              | Nie            | Nie        | Nie          | DATE              | Data sprzedaży                                    |
| id_pracownika   | Nie              | Tak            | Nie        | Nie          | NUMBER            | Klucz obcy odwołujący się do tabeli Dim_Pracownik |
| id_uslugi       | Nie              | Tak            | Nie        | Nie          | NUMBER            | Klucz obcy odwołujący się do tabeli Dim_Usluga    |
| id_gatunku      | Nie              | Tak            | Nie        | Nie          | NUMBER            | Klucz obcy odwołujący się do tabeli Dim_Gatunek   |
| ilosc           | Nie              | Nie            | Nie        | Nie          | NUMBER            | Ilość sprzedanych produktów/usług                 |
| przychod_brutto | Nie              | Nie            | Nie        | Nie          | DECIMAL(10, 2)    | Przychód brutto ze sprzedaży                      |

### Schemat hurtowni danych

Hurtownia danych skupia się na przechowywaniu informacji na temat sprzedaży w kwiaciarniach. Składa się z sześciu tabel, z których cztery są tabelami wymiarowymi (`Dim_Miasto`, `Dim_Kwiaciarnia`, `Dim_Gatunek`, `Dim_Usluga` i `Dim_Pracownik`) oraz jedną tabelą faktów (`Fakty_Sprzedaż`).

#### Relacje:

- `Dim_Kwiaciarnia` zawiera klucz obcy `id_miasta`, który odnosi się do klucza głównego `id_miasta` w tabeli `Dim_Miasto`.
- `Dim_Pracownik` zawiera klucz obcy `id_kwiaciarni`, który odnosi się do klucza głównego `id_kwiaciarni` w tabeli `Dim_Kwiaciarnia`.
- `Fakty_Sprzedaż` zawiera trzy klucze obce, które odnoszą się do

 tabel wymiarowych: `id_pracownika` odwołuje się do `Dim_Pracownik`, `id_uslugi` odwołuje się do `Dim_Usluga` i `id_gatunku` odwołuje się do `Dim_Gatunek`.

Hurtownia danych umożliwia analizę informacji na temat sprzedaży, takich jak przychody, ilość sprzedanych produktów, a także relacje między lokalizacją, rodzajem produktów i usług oraz pracownikami.
