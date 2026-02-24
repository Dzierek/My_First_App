#!/bin/bash
set -e  # zatrzymaj skrypt przy pierwszym błędzie
echo "=== BeforeInstall: Przygotowanie środowiska ==="
#yum update -y
#yum install -y python3
#rm -rf /home/ec2-user/app
#mkdir -p /home/ec2-user/app
sudo yum update -y # Aktualizacja pakietów
sudo yum install -y python3 python3-pip # Instalacja Pythona i pip (jeśli nie istnieją)
mkdir -p /home/ec2-user/app # Utworzenie katalogu dla aplikacji (jeśli nie istnieje)
chown -R ec2-user:ec2-user /home/ec2-user/app # Nadanie odpowiednich uprawnień
echo "=== BeforeInstall zakończony ==="
