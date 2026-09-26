
Enterprise Infrastructure & DevOps Homelab
Production-grade homelab repository documenting hands-on implementations of system administration, directory services, containerized monitoring, configuration management, and automated continuous integration.

Infrastructure Modules
Lab 00: Secure Remote Workspace & Workstation Toolchain

Headless engineering environment standardization via VS Code Remote SSH, Ed25519 asymmetric cryptography, OpenSSH client hardening, and cross-platform line-ending normalization (.gitattributes).

Lab 01: Host Baseline & Linux Hardening

Debian 12 minimal installation, LVM storage topology, UFW firewall policy, and SSH hardening.

Lab 02: Enterprise Active Directory Integration

Windows Server 2022 domain controller deployment, SSSD authentication bridge, Kerberos ticketing, and Wireshark packet analysis.

Lab 03: Production Observability Stack

Containerized metrics pipeline using Docker Compose, Prometheus scraping engine, Node Exporter host telemetry, Grafana dashboards, and Nginx reverse proxy.

Lab 04: Infrastructure Automation via Ansible

Agentless multi-node provisioning, Dockerized target topology, ed25519 keypair authentication, Jinja2 fact templating, and idempotency verification (changed=0).

Lab 05: Automated CI/CD Quality Gate & Linting

Automated GitHub Actions pipeline for static code analysis, YAML validation, Ansible syntax checking, and pre-deployment quality gating.

Repository Layout
Plaintext
.
├── .github/
│   └── workflows/
│       └── ci.yml
├── labs/
│   ├── lab00-remote-workspace/
│   ├── lab01-linux-baseline/
│   ├── lab02-ad-integration/
│   ├── lab03-monitoring/
│   ├── lab04-ansible/
│   └── lab05-ci-pipeline/
│       ├── assets/
│       ├── valid-sample.yml
│       └── README.md
└── README.md
Tech Stack
Workstation & Toolchain: Visual Studio Code Remote-SSH, OpenSSH, PowerShell, Git CLI, Ed25519

CI/CD & Code Quality: GitHub Actions, yamllint, ansible-lint

OS & Hypervisors: Debian 12 (Bookworm), Windows Server 2022

Networking & Protocols: DNS, DHCP, VLAN, Kerberos, LDAP, SSH, Reverse Proxy

Containers & Orchestration: Docker Engine, Docker Compose

Observability: Prometheus, Grafana, Node Exporter, Nginx

Configuration Management: Ansible Core, Jinja2, YAML
