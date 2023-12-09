#!/bin/bash

# Function to create a backup of a directory
backup_directory() {
    local source_directory=$1
    local backup_destination=$2
    local timestamp=$(date +"%Y%m%d_%H%M%S")

    # Check if the source directory exists
    if [ ! -d "/home/marta/backup" ]; then
        echo "Error: Source directory does not exist."
        exit 1
    fi

    # Create a backup directory if it doesn't exist
    mkdir -p "$backup_destination"

    # Construct the backup filename with timestamp
    backup_filename="backup_${timestamp}.tar.gz"

    # Create a compressed tarball of the source directory
    tar -czf "${backup_destination}/${backup_filename}" -C "$source_directory" .

    echo "Backup complete. Tarball created: ${backup_destination}/${backup_filename}"
}

# Example Usage:
source_directory="/home/marta/bash_skrypty"
backup_destination="/home/marta/backup"
backup_directory "$source_directory" "$backup_destination"
