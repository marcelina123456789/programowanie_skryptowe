$nazwa_komputera = $env:COMPUTERNAME
#Aktualan data
function Aktualna_Data {
$data = Get-Date
Write-Host "Aktualna dana na $nazwa_komputera to $data"
}
#Wersja systmeu
function Wersja_Systemu {
$wersja = $PSVersionTable.PSVersion
Write-Host "Wersja PowerShella na $nazwa_komputera to $wersja"
}
#Uzytkownik
function Uzytkownik {
$user = $Env:UserName
Write-Host "Nazwa uzytkownika na $nazwa_komputera to $user"
}
#AdresIP
function AdresIP {
$ipAddress = (Get-NetIPAddress -AddressFamily IPv4 | Where-Object
{$_.InterfaceAlias -eq "Ethernet"}).IPAddress
Write-Host "Address IP komputera $nazwa_komputera to $ipAddress"
}
#wywolywanie
Aktualna_Data
Wersja_Systemu
Uzytkownik
AdresIP
