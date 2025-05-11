# sciezka do pliku eicar i klucz api
$plik = "/root/programowanie_skryptowe/laby_3/eicar_test_file.txt"
$klucz_api = "sekret"
# obliczenie i wyswietlenie SHA256
$hash = Get-FileHash -Path $plik -Algorithm SHA256
Write-Host "SHA256: " $hash.Hash
# zapytanie do virustotal
$url = "https://www.virustotal.com/api/v3/files/$($hash.Hash)"
$headers = @{
"x-apikey" = $klucz_api
}
#odpowiedz
$response = Invoke-RestMethod -Uri $url -Headers $headers -Method GET -ErrorAction
Stop
#istotne rzeczy z odpowiedzi
$stat = $response.data.attributes.last_analysis_stats
$malicious = $stat.malicious
$suspicious = $stat.suspicious
$harmless = $stat.harmless
#wyswietlenie istotnych rzecuz z odpowiedzi
Write-Host "Malicious: " $malicious
Write-Host "Suspicious: $suspicious"
Write-Host "Harmless: $harmless"
#bezpieczy nie nie
if ($malicious -gt 0 -or $suspicious -gt 0) {
Write-Host "Plik niebezpieczny"
} else {
Write-Host "Plik bezpieczny"
}
