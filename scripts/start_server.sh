#!/bin/bash
set -e
echo "=== ApplicationStart: Uruchamianie kontenerów ==="

ACCOUNT_ID=$(curl -s http://169.254.169.254/latest/meta-data/identity-credentials/ec2/info | grep -oP '(?<=AccountId\":\")[^\"]+')
REGION="us-east-1"

# Logowanie do ECR 
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com

# Zatrzymaj i usuń stare kontenery
docker stop first-app second-app 2>/dev/null || true
docker rm first-app second-app 2>/dev/null || true

# Pobierz najnowsze obrazy
docker pull $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/my-first-app:latest
docker pull $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/my-second-app:latest

# Uruchom kontenery
docker run -d \
  --name first-app \
  -p 5000:5000 \
  --restart always \
  $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/my-first-app:latest

docker run -d \
  --name second-app \
  -p 5001:5000 \
  --restart always \
  $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com/my-second-app:latest

# Sprawdź czy działają
sleep 3
docker ps

echo "=== ApplicationStart zakończony ==="