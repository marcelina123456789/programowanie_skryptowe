$plik = Import-Csv -Path "C:\Users\X\Downloads\input_file.csv" -Delimiter ';'
$informacje = Get-ComputerInfo
#data
$currentDate = Get-Date -Format "yyyyMMdd-HHmmss"
#sciezka do pliku
$filePath = "C:\Users\X\Downloads\ComputerReport_$currentDate.txt"
#raport
$raport = ""
foreach ($linia in $plik) {
if ($linia.GenerateReport -eq "True") {
# dla kazdego componenta jest oddzielny if
if ($linia.Component -eq "Computername"){
# nazwa komputera
$name = $informacje.CsName
Write-Host "Computername: $name"
$raport += "Computername: $name`n"
} elseif ($linia.Component -eq "Manufacturer"){
# manufacturer
$manufacturer = $informacje.CsManufacturer
Write-Host "Manufacturer: $manufacturer"
$raport += "Manufacturer: $manufacturer`n"
} elseif ($linia.Component -eq "Model"){
#model
$model = $informacje.CsModel
Write-Host "Model: $model"
$raport += "Model: $model`n"
} elseif ($linia.Component -eq "SerialNumber"){
#number seryjny
$serialNumber = $informacje.OsSerialNumber
Write-Host "SerialNumber: $serialNumber"
$raport += "SerialNumber: $serialNumber`n"
} elseif ($linia.Component -eq "CpuName"){
#nazwa cpu
$cpuname = (Get-CimInstance Win32_Processor).Name
Write-Host "CpuName $cpuname"
$raport += "CpuName $cpuname`n"
} elseif ($linia.Component -eq "RAM"){
#ilosc ram
$ram = [math]::Round($informacje.CsTotalPhysicalMemory / 1GB)
Write-Host "RAM: $ram GB"
$raport += "RAM: $ram GB`n"
} else {
#na wypadek problemu
"blad"
}
}
}
#zapisanie raportu do pliku
$raport | Out-File -FilePath $filePath
#wypisanie na konsoli o zapisaniu raportu w pliku
Write-Output "Raport został zapisany w pliku: $filePath"