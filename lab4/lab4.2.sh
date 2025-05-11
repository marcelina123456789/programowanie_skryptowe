#!/bin/bash

: << 'Koniec'

Załóż konto na VirusTotal i napisz automatyzację w bashu
sprawdzającą reputację plików, która:

a) Obliczy sumę kontrolną wskazanego pliku (MD5 lub SHA256).
b) Wyśle zapytanie do API VirusTotal za pomocą polecenia curl.
c) Zinterpretuje odpowiedź API i wyświetli informację, czy plik jest bezpieczny, czy
nie.

Koniec

# Wprowadź własny API Key z VirusTotal
API_KEY="1fec837142b7c54da***************************763795cc6c12d80b26090c1bc"
# a) hash pliku
FILE_HASH=$(sha256sum $1 | awk '{print $1}')
echo "$FILE_HASH"
# b) wyslanie zapytania do API
RESPONSE=$(curl -s --request GET \
--url "https://www.virustotal.com/api/v3/files/$FILE_HASH" \
--header "x-apikey: $API_KEY")
# c) wyswietlanie czy bezpieczny
#liczba zagrozen wykryta
MALICIOUS=$(echo "$RESPONSE" | grep -oP '"last_analysis_stats": {.*?}' | grep -oP
'"malicious": *\d+' | cut -d':' -f2 | tr -d ' ')
#wyswietlanie odpowiedzi na podstawie liczby wykrytych malicious
if [ "$MALICIOUS" -gt 0 ]; then
echo "Plik nie jest bezpieczny. Wykryto $MALICIOUS zagrozen."
else
echo "Plik jest bezpieczny. WYkryto $MALICIOUS zagrozen."
fi