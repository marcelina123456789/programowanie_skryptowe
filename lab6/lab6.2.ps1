[Int]$liczba = Read-Host "Podaj liczbe: "
if ($liczba -gt 10){
Write-Host "Liczba wieksza od 10"
} elseif ($liczba -eq 10){
Write-Host "Liczba rowna 10"
} elseif ($liczba -lt 10){
Write-Host "Liczba mniejsza od 10"
}
