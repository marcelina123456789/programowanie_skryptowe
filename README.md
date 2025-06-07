---
[LISTA4](/lab4)
- bash


[tworzenie nowego komputera](lab4/lab4.1.sh)

Napisz skrypt w bash, który pomoże administratorowi i przyśpieszy
tworzenie nowego komputera w organizacji. Podziel zadania na
odpowiednie funkcje:
- Sprawdzenie aktualizacji systemu i ich instalacja
- Instalacja klienta pocztowego np. Thunderbird
- Dodanie nowego użytkownika
- Utworzenie katalogów dla nowego pracownika (Documents, Pictures,
Videos)
- Wyświetlenie informacji o wersji systemu, adresu ip, adresu mac 

[Eicar - api - virustotal](lab4/lab4.2.sh)

Załóż konto na VirusTotal i napisz automatyzację w bashu sprawdzającą
reputację plików, która:
- Obliczy sumę kontrolną wskazanego pliku (MD5 lub SHA256).
- Wyśle zapytanie do API VirusTotal za pomocą polecenia curl.
- Zinterpretuje odpowiedź API i wyświetli informację, czy plik jest
bezpieczny, czy nie.

Sprawdź, czy wyniki są zgodne z oczekiwaniami - pobierz plik EICAR oraz
utwórz nowy plik testowy.

---
[LISTA5](lab5.ps1)
-powershell
-procesy


[hash - procesy](lab5.ps1)

- Utwórz nowy pusty plik za pomocą odpowiedniej komendy PowerShell
- Zmień nazwę utworzonego pliku
- Sprawdź sumę kontrolną (hash) utworzonego pliku (za pomocą
komendy)
- Za pomocą komendy uruchom notepad
- W domyślnym folderze wyświetl listę plików posortowaną od najkrótszej
do najdłuższej nazwy
- Przypisz do zmiennej wynik komendy sprawdzającą obecną lokalizację
- Zapisz do pliku wartości przechowywane przez utworzoną wcześniej
zmienną
- Z listy procesów wyświetl 5 pierwszych wyników tylko z dwoma
kolumnami – Nazwa i ID
- Wyświetl 5 procesów z najwyższym zużyciem pamięci
-  *** Wyświetl 5 procesów z najniższym zużyciem pamięci, podmień
nazwę kolumny WS na „MemoryUsage”. Wynik może być ograniczony
do nazwy procesu i zużycia pamięci.

---
[Lista6](/lab6)
-powershell


[Zmienne](/lab6/lab6.1.ps1)

Napisz skrypt wymagający podania długości i wysokości trójkąta w
argumencie, obliczający pole powierzchni trójkąta. Wynik wyświetl na
ekranie


[Instrukcje warunkowe](/lab6/lab6.2.ps1)

Napisz skrypt, który zapyta użytkownika o liczbę i sprawdzi, czy jest większa
od 10. Jeśli tak, wyświetli komunikat "Liczba jest większa od 10", w
przeciwnym razie wyświetli komunikat "Liczba jest mniejsza od 10".

[Operatory logiczne](/lab6/lab6.3.ps1)

Napisz skrypt, który poprosi użytkownika o podanie nazwy użytkownika i
hasła, a następnie sprawdzi, czy podane dane są poprawne (np. nazwa
użytkownika to "admin" i hasło to "password"). Zastosuj maskowanie
wprowadzanego hasła.

[Pętle](/lab6/lab6.4.ps1)

Napisz skrypt generujący 10 adresów IP za pomocą pętli, które będą
różniły się czwartym oktetem rosnąco w adresie 192.168.1.X

[Funkcje](/lab6/lab6.5.ps1)

Utwórz skrypt wyświetlający informacje o systemie: Aktualna data, Wersja
systemu, Użytkownik, AdresIP.
Każda informacja powinna znajdować się w osobnej funkcji. Użyj jednej
zmiennej z nazwą komputera w każdej funkcji.
Przykład: „Aktualna data na (Nazwa komputera) to X”
KONTAKT
Karolina Pfajfer
karolina.pfajfer@pwr.edu.pl
PROGRAMOWANIE
SKRYPTOWE

[Zadania połączone](/lab6/lab6.6.ps1)

Utwórz plik CSV o nazwie input_file.csv z zawartością:
Component;GenerateReport
Computername;True
Manufacturer;True
Model;True
SerialNumber;True
CpuName;False
RAM;True
Napisz skrypt PowerShell, który będzie:
- odczytywać zawartość pliku input_file.csv
- wykonywać iterację po wszystkich wierszach w pliku input_file.csv i zwróci
informacje o komputerze/laptopie tylko wtedy, gdy w danym wierszu opcja
GenerateReport ma wartość True.
Dane wyjściowe powinny wyglądać następująco:
Computername: ABWI45774RZ
Manufacturer: LENOVO
Model: ThinkPad T123
SerialNumber: M4564XDCG54DSA
RAM: 32 GB
Zauważ, że CpuName nie jest wyświetlane, ponieważ GenerateReport jest
ustawione na False w tym wierszu. Spróbuj zmienić wartości True|False w
kolumnie GenerateReport pliku input_file.csv, wykonaj skrypt ponownie.
Komenda Get-ComputerInfo jest Twoim przyjacielem.
KONTAKT
Karolina Pfajfer
karolina.pfajfer@pwr.edu.pl
PROGRAMOWANIE
SKRYPTOWE

[Zadanie dodatkowe](/lab6/lab6.dodatkowe.ps1)

Zapisz dane wyjściowe do pliku. Nazwa pliku powinna być jak w przykładzie:
"ComputerReport_YYYYMMdd-HHmmss.txt", gdzie:
RRRR - bieżący rok
MM - bieżący miesiąc
dd - bieżący dzień
HH - bieżąca godzina
mm - bieżąca minuta
ss - bieżąca sekunda
Skrypt powinien wyświetlić komunikat w konsoli:
Raport został zapisany w pliku: <pełna ścieżka do pliku>.

---
[LISTA 7](/lab7)
-powershell 
-api
-virustotal
-suma kontrolna

[monitorowanie folderu](/lab7/lab7.1.ps1)

1. Napisz skrypt PowerShell, który monitoruje określony folder i
automatycznie przenosi nowo dodane pliki .txt do innej lokalizacji.
a) Jeżeli folder docelowy nie istnieje, skrypt musi go utworzyć.
b) Skrypt powinien działać ciągle, aż do jego ręcznego wyłączenia.

[SHA256 - suma kontrolna - virustotal](/lab7/lab7.2.ps1)

2. Napisz skrypt w PowerShell który:
a) Obliczy sumę kontrolną pliku (MD5 lub SHA256).
b) Wyśle zapytanie do API VirusTotal
c) Zinterpretuje odpowiedź API i wyświetli informację, czy plik jest
bezpieczny, czy nie.

---
[LISTA 8](/lab8)
-powershell 
- api
- -shodan

[waluta - api](/lab8/lab8.1.ps1)

1. Napisz skrypt, który pobierze aktualny kurs podanej na wejściu waluty
oraz wyświetli kurs z ostatnich 5 dni. Następnie obliczy różnicę między
każdym dniem.

[artykuly - api](/lab8/lab8.2.ps1)

2. Napisz skrypt, który wyszuka artykuły z portali informacyjnych na
podany temat.

[porty z ip - shodan](/lab8/lab8.3.ps1)

3. Napisz skrypt, który wyświetli podstawowe dane i listę otwartych
portów dla podanego adresu IP przez API Shodan.

---
[LISTA 10](/lab10)
-bash
-ssh
-kompresja

[zdalny serwer ssh i wykonanie polecen](lab10/lab10.1.sh)

1. Napisz skrypt, który automatycznie loguje się na zdalny serwer przy
użyciu SSH, wykonuje kilka poleceń (np. listowanie plików, procesów) i
zapisuje wynik do pliku lokalnego.

[monitorowanie logow ssh - generowanie raportu](/lab10/lab10.2.sh)

2. Napisz skrypt, który monitoruje logi połączeń SSH na serwerze i
generuje raport, gdy wykryje nieprawidłowe lub podejrzane
aktywności, na przykład nieudane logowania

[kopia zapasowa - > serwer ftp](/lab10/lab10.3.sh)

3. Napisz skrypt, który wykonuje kopię zapasową określonych plików na
lokalnym komputerze i przesyła je na zdalny serwer FTP w określonym
katalogu. Dodaj funkcję archiwizacji i kompresji przed wysłaniem
plików.

---
[LISTA 12](/lab12)
-python
-szygrowanie
-podpis cyfrowy

[szyfrowanie xor](/lab12/szyfrowanie_XOR.py)

1. Napisz skrypt, który zaszyfruje plik tekstowy np. algorytmem
AES. zrobilam XOR

[podpis cyfrowy](/lab12/podpis_cyfrowy.py)

2. Napisz skrypt, który podpisze cyfrowo plik. 


