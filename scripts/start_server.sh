#!/bin/bash
set -e
echo "=== ApplicationStart: Uruchamianie aplikacji ==="
cd /home/ec2-user/app

pkill -f "gunicorn.*5000" || echo "Brak procesów gunicorn na porcie 5000" # Zabij istniejące procesy na porcie 5000 (tylko gunicorn)

# Uruchom aplikację przez gunicorn jako ec2-user (nie root)
# Używamy pip zainstalowanego dla użytkownika
nohup /home/ec2-user/.local/bin/gunicorn -w 2 -b 0.0.0.0:5000 app:app > app.log 2>&1 &

echo $! > /home/ec2-user/app/gunicorn.pid # Zapisz PID
sleep 5 # Daj czas na start

# Sprawdź czy proces żyje
if ps -p $(cat /home/ec2-user/app/gunicorn.pid) > /dev/null; then
    echo "✅ Aplikacja uruchomiona pomyślnie na porcie 5000"
    echo "Logi: /home/ec2-user/app/app.log"
else
    echo "❌ Błąd: Aplikacja nie wystartowała!"
    echo "Sprawdź logi: /home/ec2-user/app/app.log"
    exit 1
fi

echo "=== ApplicationStart zakończony ==="
#sudo yum update -y
#sudo yum install python3 python3-pip -y
#sudo pip3 install flask
#cd /home/ec2-user/app
#pkill -f gunicorn || true
#nohup gunicorn -w 2 -b 0.0.0.0:5000 app:app &
