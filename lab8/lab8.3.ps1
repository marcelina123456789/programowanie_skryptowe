<# 
    Napisz skrypt, który wyświetli podstawowe dane i listę otwartych
    portów dla podanego adresu IP przez API Shodan.
#>

# ip i klucz api
$ip = Read-Host "Podaj adres IP do sprawdzenia"
$apiKey = "sekret"  # <-- tutaj wklej swój klucz

# url 
$url = ("https://api.shodan.io/shodan/host/$ip"+"?key=$apiKey")

try {
    # dane z shodan
    $response = Invoke-RestMethod -Uri $url -Method Get -ErrorAction Stop

    # podstawowe informacjie
    Write-Host "`nInformacje o adresie IP: $ip`n"
    Write-Output "Organizacja: $($response.org)"
    Write-Output "ISP:         $($response.isp)"
    Write-Output "Miasto:      $($response.city)"
    Write-Output "Kraj:        $($response.country_name)"
    Write-Output "Lokalizacja: $($response.latitude), $($response.longitude)"
    Write-Output "Hostnames:   $($response.hostnames -join ', ')"
    Write-Output "Domeny:      $($response.domains -join ', ')"

    # otwarte porty
    Write-Host "`nOtwartych portów: $($response.ports.Count)`n"
   foreach ($port in $response.ports) {
        Write-Output "Port: $port"
    }
}
catch {
    # na wypadek bledu
    Write-Warning "Błąd: $_"
}

