<# 
    Napisz skrypt, który pobierze aktualny kurs podanej na wejściu waluty
oraz wyświetli kurs z ostatnich 5 dni. Następnie obliczy różnicę między
każdym dniem.

#>

# pobieranie waluty od uzytkownika
$Waluta = Read-Host "Podaj walutę (np. USD, EUR)"

# czy dzien jest roobczy czy nie
function Is-BusinessDay {
    param ($date)
    return ($date.DayOfWeek -ne 'Saturday' -and $date.DayOfWeek -ne 'Sunday')
}

# pobieranie dni
$today = Get-Date
$dates = @()
while ($dates.Count -lt 5) {
    if (Is-BusinessDay $today) {
        $dates += $today.ToString("yyyy-MM-dd")
    }
    $today = $today.AddDays(-1)
}
#sortowanie
$dates = $dates | Sort-Object

# pobieranie kursow z nbp 
$kursy = @()
foreach ($data in $dates) {
    $url = "http://api.nbp.pl/api/exchangerates/rates/a/$Waluta/$data/?format=json"
    try {
        $response = Invoke-RestMethod -Uri $url -ErrorAction Stop
        $kurs = @{
            Data  = $data
            Kurs  = $response.rates[0].mid
        }
        $kursy += $kurs
    } catch {
        Write-Warning "Brak danych dla $data (możliwe święto lub brak kursu)"
    }
}

# Wyświetl kursy
Write-Output "`Kurs walut $Waluta (PLN):"
$kursy | ForEach-Object { Write-Output "$($_.Data): $($_.Kurs) PLN" }

# Oblicz różnice
Write-Output "`nRóżnice między dniami:"
for ($i = 1; $i -lt $kursy.Count; $i++) {
    $roznica = [math]::Round($kursy[$i].Kurs - $kursy[$i - 1].Kurs, 4)
    Write-Output "$($kursy[$i].Data) - $($kursy[$i - 1].Data): $roznica PLN"
}
