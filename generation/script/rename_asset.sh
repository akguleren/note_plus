#!/bin/bash

# Başlangıç yolu değişkeni
asset_path=$PWD/../assets

# Readline ayarlarını script içinde yap
bind '"\e[[D": backward-char'
bind '"\e[C": forward-char'

# Kontrol edilecek dosya uzantıları
extensions=("*.svg" "*.png" "*.jpg" "*.jpeg" "*.json")

# Başlangıç yolunu kontrol et
if [ -z "$asset_path" ]; then
  echo "Lütfen bir başlangıç yolu belirtin."
  exit 1
fi

# Belirtilen dosya uzantıları için döngü
for ext in "${extensions[@]}"; do
  for filepath in $(find "$asset_path" -type f -name "$ext"); do
    filename=$(basename "$filepath")
    dirpath=$(dirname "$filepath")
    extension="${filename##*.}"
    # Snake case kontrolü yapar
    if [[ ! "$filename" =~ ^[a-z0-9]+(_[a-z0-9]+)*\.[a-z]+$ ]]; then
      echo "Dosya adı uygun değil ($(basename "$dirpath")): $filename"
      read -p "Yeni dosya adı girin (snake_case formatında): " new_filename
      mv "$filepath" "$dirpath/$new_filename.$extension"
      echo "Renamed $filename to $new_filename"
    fi
  done
done