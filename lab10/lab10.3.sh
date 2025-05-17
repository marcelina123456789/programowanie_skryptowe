  GNU nano 8.1                                                           lab10.3.sh                                                                    
#!/bin/bash

# === KONFIGURACJA ===

# Pliki/katalogi do backupu
FILES_TO_BACKUP="/root/programowanie_skryptowe/laby_2/"

# Katalog tymczasowy
BACKUP_DIR="/root/programowanie_skryptowe/laby_10/backup"
mkdir -p "$BACKUP_DIR"

# Nazwa archiwum
DATE=$(date +"%Y-%m-%d")
HOSTNAME=$(hostname)
ARCHIVE_NAME="backup_${HOSTNAME}_${DATE}.tar.gz"
ARCHIVE_PATH="$BACKUP_DIR/$ARCHIVE_NAME"

# Dane FTP
FTP_HOST="10.0.2.15"
FTP_USER="kali"
FTP_PASSWORD="kali"
FTP_TARGET_DIR="/home/kali/backup" 

# === KOMPRESJA ===
echo "Tworzenie archiwum z plikami..."
tar -czf "$ARCHIVE_PATH" $FILES_TO_BACKUP

if [ $? -ne 0 ]; then
    echo "blad podczas tworzenia archiwum"
    exit 1
fi

echo "archiwum utworzone: $ARCHIVE_PATH"

# === WYSYŁKA NA FTP ===

echo "laczenie z FTP i wysylanie archiwum =================="

ftp -inv $FTP_HOST <<EOF
chown kali:kali "$ARCHIVE_PATH"
user $FTP_USER $FTP_PASSWORD
cd backup
put "$ARCHIVE_PATH" "$(basename "$ARCHIVE_PATH")"
bye
EOF

if [ $? -eq 0 ]; then
    echo "Archiwum pomyślnie przesłane na serwer FTP."
else
    echo "Wystąpił problem podczas przesyłania na FTP."
    exit 2
fi

# === szczysczenie  ===
echo "usuwanie lokalnego pliku tymczasowego"
#rm -f "$ARCHIVE_PATH"
