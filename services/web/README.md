# Lab 01: Containerized Web Infrastructure

## Objective
Deploy a lightweight Nginx web server using Docker Compose.

## Deployment & Verification
1. Navigate to the module directory:
   ```bash
   cd services/web
   ```
2. Start the service:
   ```bash
   docker compose up -d
   ```
3. Test availability:
   ```bash
   curl http://localhost
   ```
