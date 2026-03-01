#!/bin/bash
#cd /home/ec2-user/app
#pip3 install -r requirements.txt
set -e
echo "=== AfterInstall: Instalacja zależności ==="

# Pobierz Account ID z metadanych instancji (automatycznie!)
ACCOUNT_ID=$(curl -s http://169.254.169.254/latest/meta-data/identity-credentials/ec2/info | grep -oP '(?<=AccountId\":\")[^\"]+')

aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com

cd /home/ec2-user/app
# Instalacja zależności Pythona dla użytkownika (bez sudo)
pip3 install --user -r requirements.txt

# Alternatywnie: użycie wirtualnego środowiska (zalecane)
# python3 -m venv venv
# source venv/bin/activate
# pip install -r requirements.txt

# Upewnij się, że skrypty mają uprawnienia do wykonania
chmod +x scripts/*.sh

echo "=== AfterInstall zakończony ==="
