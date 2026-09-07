# Lab 01: Core Infrastructure & Base Services

## Overview
Initial deployment and hardening of the Debian 12 (Bookworm) base node (`192.168.1.33`), configuration of network interfaces, static routing, firewall rules (`iptables`), and containerized web services.

## Environment Specifications

* **OS Node:** Debian 12 (Bookworm) `192.168.1.33`
* **Firewall Stack:** iptables / netfilter
* **Containerization:** Docker & Docker Compose

## Structure & Components

* `scripts/` : Automation and system health-check scripts.
* `services/web/` : Dockerized web service configurations and deployment manifests.

## Key Configurations & Implementation

1. **Firewall Baseline:** Configured strict `iptables` rules dropping unauthorized incoming traffic while allowing established/related sessions and local management.
2. **Health Monitoring:** Implemented wrapper scripts to check core daemon statuses, disk health, and network connectivity.

## Verification

* Verified active listening ports using `ss -tulpn`.
* Tested local and external routing via ICMP and TCP probes.
