# Enterprise Infrastructure & DevOps Homelab

Production-grade homelab repository documenting hands-on implementations of system administration, directory services, containerized monitoring, and configuration management.

---

## Infrastructure Modules

* **[Lab 00: Secure Remote Workspace & Workstation Toolchain](labs/lab00-remote-workspace/)**
  * Headless engineering environment standardization via VS Code Remote SSH, Ed25519 asymmetric cryptography, OpenSSH client hardening, and cross-platform line-ending normalization (`.gitattributes`).
* **[Lab 01: Host Baseline & Linux Hardening](labs/lab01-linux-baseline/)**
  * Debian 12 minimal installation, LVM storage topology, UFW firewall policy, and SSH hardening.
* **[Lab 02: Enterprise Active Directory Integration](labs/lab02-ad-integration/)**
  * Windows Server 2022 domain controller deployment, SSSD authentication bridge, Kerberos ticketing, and Wireshark packet analysis.
* **[Lab 03: Production Observability Stack](labs/lab03-monitoring/)**
  * Containerized metrics pipeline using Docker Compose, Prometheus scraping engine, Node Exporter host telemetry, Grafana dashboards, and Nginx reverse proxy.
* **[Lab 04: Infrastructure Automation via Ansible](labs/lab04-ansible/)**
  * Agentless multi-node provisioning, Dockerized target topology, ed25519 keypair authentication, Jinja2 fact templating, and idempotency verification (`changed=0`).

---

## Repository Layout

```text
.
├── labs/
│   ├── lab00-remote-workspace/
│   │   ├── .vscode/
│   │   │   ├── extensions.json
│   │   └── settings.json
│   │   ├── assets/
│   │   ├── .gitattributes
│   │   ├── ssh_config.example
│   │   └── README.md
│   ├── lab01-linux-baseline/
│   ├── lab02-ad-integration/
│   ├── lab03-monitoring/
│   └── lab04-ansible/
│       ├── ansible.cfg
│       ├── inventories/
│       ├── lab-targets/
│       ├── playbooks/
│       └── assets/
└── README.md
Tech Stack
Workstation & Toolchain: Visual Studio Code Remote-SSH, OpenSSH (Win32 & POSIX), PowerShell, Git CLI, Ed25519

OS & Hypervisors: Debian 12 (Bookworm), Windows Server 2022

Networking & Protocols: DNS, DHCP, VLAN, Kerberos, LDAP, SSH (KeepAlive / IdentitiesOnly), Reverse Proxy

Containers & Orchestration: Docker Engine, Docker Compose

Observability: Prometheus, Grafana, Node Exporter, Nginx

Configuration Management: Ansible Core, Jinja2, YAML
