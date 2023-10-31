#!/bin/bash

# Mendapatkan tanggal saat ini dalam format YYMMDD
TIMESTAMP=$(date +%y%m%d)

# Backup database menggunakan pg_dumpall melalui docker exec
docker exec todo-db-container bash -c "pg_dumpall -U postgres > /backups/backup_$TIMESTAMP.sql"

# Cek apakah pg_dumpall berhasil atau gagal
if [ $? -eq 0 ]; then
    echo "Backup berhasil pada $TIMESTAMP."
else
    echo "Backup gagal pada $TIMESTAMP."
fi
