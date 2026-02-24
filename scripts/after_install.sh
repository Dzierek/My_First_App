#!/bin/bash
#cd /home/ec2-user/app
#pip3 install -r requirements.txt
set -e
echo "=== AfterInstall: Instalacja zależności ==="
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
