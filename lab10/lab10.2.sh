#!/bin/bash

# === KONFIGURACJA ===
USER="kali"
IP="10.0.2.15"
REPORT_FILE="report.log"

# === FUNKCJA: Generowanie raportu ===
generate_report() {
    echo "==== SSH ALERT REPORT: $(date) ====" > "$REPORT_FILE"
    sus=$(ssh "$USER@$IP" journalctl --since today | grep -E 'Failed password|Invalid user|authentication failure')

    if [[ -n "$sus" ]]; then
        echo "$sus" >> "$REPORT_FILE"
        echo "==== KONIEC RAPORTU ====" >> "$REPORT_FILE"
        echo "wygenerowano raport: $REPORT_FILE"
    else
        echo "nie generowano raportu."
    fi
}

generate_report