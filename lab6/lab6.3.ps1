$nazwa = Read-Host "Podaj nazwe uzytkownika: "
$haslo = Read-Host "Podaj haslo: " -MaskInput
if ($nazwa -eq "admin" -and $haslo -eq "password"){
Write-Host "Poprawne dane"
} else {
Write-Host "Zle dane"
}