$plik = Import-Csv -Path "C:\Users\X\Downloads\input_file.csv" -Delimiter ';'
$informacje = Get-ComputerInfo
foreach ($linia in $plik) {
if ($linia.GenerateReport -eq "True") {
# dla kazdego componenta jest oddzielny if
if ($linia.Component -eq "Computername"){
# nazwa komputera
$name = $informacje.CsName
Write-Host "Computername: $name"
} elseif ($linia.Component -eq "Manufacturer"){
# manufacturer
$manufacturer = $informacje.CsManufacturer
Write-Host "Manufacturer: $manufacturer"
} elseif ($linia.Component -eq "Model"){
#model
$model = $informacje.CsModel
Write-Host "Model: $model"
} elseif ($linia.Component -eq "SerialNumber"){
#number seryjny
$serialNumber = $informacje.OsSerialNumber
Write-Host "SerialNumber: $serialNumber"
} elseif ($linia.Component -eq "CpuName"){
#nazwa cpu
$cpuname = (Get-CimInstance Win32_Processor).Name
Write-Host "CpuName $cpuname"
} elseif ($linia.Component -eq "RAM"){
#ilosc ram
$ram = [math]::Round($informacje.CsTotalPhysicalMemory / 1GB)
Write-Host "RAM: $ram GB"
} else {
#na wypadek problemu
"blad"
}
}
}