#!/bin/bash

# Variabel Lingkungan
DB_USER="postgres"
DB_PASSWORD=$POSTGRES_PASSWORD
DB_NAME="todo-db"
CONTAINER_NAME="todo-db-container"
BACKUP_DIR="/backups"
LOG_FILE="/home/phy/LinuxAndContainer/web-app/logs/restore.log"

# Menampilkan daftar file backup
echo "Daftar file backup:" | tee -a $LOG_FILE
docker exec $CONTAINER_NAME ls $BACKUP_DIR | tee -a $LOG_FILE

# Meminta pengguna untuk memasukkan nama file backup
read -p "Masukkan nama file backup yang ingin Anda restore: " BACKUP_FILE

# Membuat path lengkap ke file backup
BACKUP_PATH="$BACKUP_DIR/$BACKUP_FILE"

# Cek apakah file backup ada
if docker exec $CONTAINER_NAME test -f $BACKUP_PATH; then
    echo "File backup ditemukan." | tee -a $LOG_FILE
else
    echo "File backup tidak ditemukan. Proses restore dibatalkan." | tee -a $LOG_FILE >&2
    exit 1
fi

# Command untuk merestore database
if docker exec -i $CONTAINER_NAME bash -c "psql -U $DB_USER -d $DB_NAME < $BACKUP_PATH"; then
    echo "Restore database berhasil." | tee -a $LOG_FILE
else
    echo "Restore database gagal." | tee -a $LOG_FILE >&2
fi