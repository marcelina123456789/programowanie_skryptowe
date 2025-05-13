#Napisz skrypt, który automatycznie loguje się na zdalny serwer przy
#użyciu SSH, wykonuje kilka poleceń (np. listowanie plików, procesów) i
#zapisuje wynik do pliku lokalnego.
                                     
#!/bin/bash

# zmienne
USER="kali"         # nazwa uzytkownika
IP="10.0.2.15"  # adres serwera

# Plik wynikowy
OUTPUT="output.txt"

# Wykonanie poleceń przez SSH i zapis wyniku do pliku
ssh "$USER@$IP" '
echo "Lista plikow ---------"
ls ~
echo "Procesy uzytkownika -------"
ps -u $USER
' > "$OUTPUT"
# Komunikat o zakończeniu
echo "Wyniki zostały zapisane w pliku: $OUTPUT"


