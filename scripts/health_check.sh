#!/usr/bin/env bash

echo "=========================================="
echo "       SYSTEM & DOCKER HEALTH CHECK       "
echo "=========================================="
echo "Date: $(date)"
echo "Uptime: $(uptime -p)"
echo ""

echo "--- Disk Usage ---"
df -h / | awk 'NR==2 {print "Used: " $3 " / Free: " $4 " (" $5 " used)"}'
echo ""

echo "--- Docker Containers Status ---"
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
echo ""

echo "--- Local Web Services Check ---"
curl -s -o /dev/null -w "%{http_code}" http://localhost:80 | grep -E "200|301|302" > /dev/null && echo "[OK] Nginx (Port 80) is responding" || echo "[FAIL] Nginx is not responding"
curl -s -o /dev/null -w "%{http_code}" http://localhost:3001 | grep -E "200|301|302" > /dev/null && echo "[OK] Uptime Kuma (Port 3001) is responding" || echo "[FAIL] Uptime Kuma is not responding"
echo "==========================================="
