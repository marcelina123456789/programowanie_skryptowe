<#
    Napisz skrypt, który wyszuka artykuły z portali informacyjnych na
    podany temat.
#>

# Ustawienia
$temat = "Devil May Cry"
$apikey = "sekret"
$encodedQuery = [uri]::EscapeDataString($temat)
$url = "https://newsapi.org/v2/everything?q=$encodedQuery&language=pl&pageSize=5&apiKey=$apikey"

# Pobierz dane
try {
    $response = Invoke-RestMethod -Uri $url -Method Get -ErrorAction Stop

    # Sprawdź, czy są artykuły
    if ($response.articles.Count -eq 0) {
        Write-Host "Brak artykułów na temat '$temat'."
    } else {
        Write-Host "`nZnalezione artykuły na temat: $temat`n"
        foreach ($article in $response.articles) {
            Write-Output "Tytuł: $($article.title)"
            Write-Output "Źródło: $($article.source.name)"
            Write-Output "Link:   $($article.url)"
            Write-Output ""
        }
    }
}
catch {
    Write-Host "Błąd pobierania danych: $_"
}
