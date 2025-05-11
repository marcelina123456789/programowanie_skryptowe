#!/bin/bash

: << 'Koniec'

Napisz skrypt w bash, który pomoże administratorowi i
przyśpieszy tworzenie nowego komputera w organizacji.
Podziel zadania na odpowiednie funkcje:

a) Sprawdzenie aktualizacji systemu i ich instalacja
b) Instalacja klienta pocztowego np. Thunderbird
c) Dodanie nowego użytkownika
d) Utworzenie katalogów dla nowego pracownika (Documents, Pictures, Videos)
e) Wyświetlanie informacji o wersji systemu, adresu ip, adresu mac

Koniec

#1. ------sprawdzanie i pobieranie akutalizacji -----------------
update() {
sudo apt update
sudo apt list --upgradable
sudo apt upgrade
}
#2. -----zainstalowanie maila -----------------------------------------
mail() {
sudo apt intall thunderbird
}
#3. -----dodanie uzytkownika -----------------------------------
user() {
sudo adduser $nazwa
}
#4. --- utworzenie katalogu dla nowego uzytkownika -------------------
katalogs() {
#dodawanie katalogu
sudo mkdir -p /home/$nazwa/Documents /home/$nazwa/Pictures /home/$nazwa/Videos
#mozna tez zmienic wlascicela katalogow na pomoca komendy ponizej
#sudo chown $nazwa:$nazwa /home/$nazwa/Documents /home/$nazwa/Pictures
/home/$nazwa/Videos
}
#5. --- wyswietlenie informacji o OS, Ip, MAC ----------------------
info() {
#sprawdzenie os
echo "rodzaj os: "
lsb_release -a
echo
#wyswietlenie ip
echo "Ip address: "
ip a | grep 'eth0' | grep 'inet ' | awk '{print $2}'