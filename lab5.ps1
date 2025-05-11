# 1.Utwórz nowy pusty plik za pomocą odpowiedniej komendy PowerShella
New-Item -Path "programowanie_skryptowe.txt" -ItemType "File"

# 2. Zmien nazwę utworzonego pliku
Rename-Item -Path "programowanie_skryptowe.txt" -NewName "wow.txt"

# 3. Sprawdź sumę kontrolną (hash) utworzonego pliku (za pomocą komendy)
Get-FileHash -Path "wow.txt"

# 4. Za pomocą komendy uruchom notepad
notepad

# 5. W domyślnym folderze wyświetl listę plików posortowaną od najkrótszej do najdłuższej nazwy
Get-ChildItem | Sort-Object { $_.Name.Length } | Select-Object Name

# 6. Przypisz do zmiennej wynik komendy sprawdzającą obecną lokalizację
$lokcalizacja = Get-Location

# 7. Zapisz do pliku wartości przechowywane przez utworzoną wcześniej zmienną
Set-Content -Path "wow.txt" -Value $lokcalizacja

# 8. Z listy procesów wyświetl 5 pierwszych wyników tylko z dwoma kolumnami – Nazwa i ID
Get-Process | Select-Object -First 5 -Property Name, ID

# 9. Wyświetl 5 procesów z najwyższym zużyciem pamięci
Get-Process | Sort-Object -Property WorkingSet -Descending | Select-Object -First 5 Name, Id, WorkingSet

# 10. Wyświetl 5 procesów z najniższym zużyciem pamięci,
#podmień nazwę kolumny WS na „MemoryUsage”. Wynik może
#być ograniczony do nazwy procesu i zużycia pamięci.

Get-Process | Sort-Object -Property WorkingSet | Select-Object -First 5 Name, @(Name="MemoryUsage";Expression=($_.WorkingSet))

