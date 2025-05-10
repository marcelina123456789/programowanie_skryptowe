# sciezki do folderow
$folderZrodlowy = "D:\FOLDERY\ps\FolderWejsciowy"
$folderDocelowy = "D:\FOLDERY\ps\FolderDocelowy"
# tworzenie folderu docelowego jezeli nie istnieje
if (-not (Test-Path -Path $folderDocelowy)) {
New-Item -ItemType Directory -Path $folderDocelowy | Out-Null
Write-Host "stworzenie folderu docelowego"
}
Write-Host "Folder docelowy juz istnieje"
# obserwator plikow
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = $folderZrodlowy
$watcher.Filter = "*.txt"
$watcher.IncludeSubdirectories = $false
$watcher.EnableRaisingEvents = $true
# akcja po wykryciu nowego .txt
$akcja = {
$plik = $Event.SourceEventArgs.FullPath
$nazwa = $Event.SourceEventArgs.Name
$sciezka = "D:\FOLDERY\ps\FolderDocelowy"
$docelowy = Join-Path -Path $sciezka -Childpath $nazwa
# chwila na odczekanie
Start-Sleep -Milliseconds 500
# przenoszenie pliku
try {
Move-Item -Path $plik -Destination $docelowy -Force
Write-Host "Przeniesiono: $nazwa"
} catch {
Write-Warning "Błąd podczas przenoszenia pliku: $nazwa"
}
}
# rejestrowanie zdarzenia
Register-ObjectEvent -InputObject $watcher -EventName Created -Action $akcja | Out-Null
# write hosty z informacja
Write-Host "Monitorowanie folderu: $folderZrodlowy"
Write-Host "Naciśnij Ctrl+C, aby zatrzymać."
#aby skrpt caly czas dzialal
while ($true) {
Start-Sleep -Seconds 1
}