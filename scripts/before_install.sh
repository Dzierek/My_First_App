#!/bin/bash
set -e  # zatrzymaj skrypt przy pierwszym błędzie
echo "=== BeforeInstall: Przygotowanie środowiska ==="

sudo yum update -y # Aktualizacja pakietów
#sudo yum install -y python3 python3-pip # Instalacja Pythona i pip (jeśli nie istnieją)

sudo yum install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user

sudo yum install unzip -y
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

mkdir -p /home/ec2-user/app # Utworzenie katalogu dla aplikacji (jeśli nie istnieje)
chown -R ec2-user:ec2-user /home/ec2-user/app # Nadanie odpowiednich uprawnień

echo "=== BeforeInstall zakończony ==="
