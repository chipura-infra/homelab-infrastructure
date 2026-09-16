# Lab 04: Infrastructure Automation via Ansible

## Overview & The "Why"
In the previous labs, all configurations—from AD integration to Docker monitoring—were executed manually. In a real infrastructure with dozens of nodes, manual SSH administration does not scale and introduces human error. 

The goal of this lab was to transition from manual operations to **Infrastructure as Code (IaC)**: managing remote Linux environments declaratively and ensuring configuration idempotency using Ansible.

---

## Architectural Decision: Lightweight Target Fleet
Instead of provisioning heavy full-blown virtual machines (which would unnecessarily consume host RAM), I architected a testbed using **two isolated Docker containers running OpenSSH and Python 3**. 

From Ansible's perspective, these containers behave identically to physical or cloud Linux servers:
* **Control Node:** Host Debian system running Ansible Core.
* **Target Fleet:** Ephemeral nodes on an isolated bridge network (`172.28.0.0/16`):
  * `node01` (`172.28.0.11`): Assigned to `[webservers]` inventory group.
  * `node02` (`172.28.0.12`): Assigned to `[dbservers]` inventory group.
* **Authentication:** Passwordless SSH via host-generated `ed25519` keypair, mounted read-only into `/root/.ssh/authorized_keys` inside each container.

[Control Node: debserver]
│
├── SSH (Port 22, ed25519) ──> [Target: node01 (172.28.0.11)]
└── SSH (Port 22, ed25519) ──> [Target: node02 (172.28.0.12)]


---

## Playbook Logic & Idempotency
I wrote a baseline playbook (`playbooks/base-setup.yml`) targeting the entire fleet. It performs three core tasks:
1. **Package Provisioning:** Declaratively installs essential administrative tools (`curl`, `htop`, `net-tools`, `vim`) via the `apt` module.
2. **Identity Setup:** Ensures a dedicated operational user `deployer` exists with a home directory and `/bin/bash` shell.
3. **Dynamic Templating:** Uses Jinja2 expressions to generate an informative `/etc/motd` banner customized with runtime host facts (`hostname`, OS family, IP address).

**Idempotency Test:**
* **Run 1:** Applied changes across all tasks (`changed=3`).
* **Run 2:** Executed immediately after without modifying the environment. Resulted in `changed=0`, proving the playbook safely brings nodes to the desired state without redundant writes or service disruptions.

---

## Engineering Challenges & Lessons Learned
* **Headless SSH Execution:** By default, SSH blocks automated scripts with an interactive `StrictHostKeyChecking` prompt. Solved by setting `host_key_checking = False` directly in `ansible.cfg`.
* **Agentless Execution Model:** Understood why Python is strictly mandatory on managed nodes: Ansible connects over SSH, drops temporary modular Python payloads onto the target, executes them, and retrieves execution state as structured JSON.

---

## Verification & Artifacts

### 1. Ansible Core Environment
![Ansible Core Version](assets/01-ansible-install.png)

### 2. Containerized Fleet Deployment
![Dockerized Target Nodes](assets/02-targets-up.png)

### 3. Agentless Ad-Hoc Connectivity
![Ansible Ping Pong](assets/03-ansible-ping-success.png)

### 4. Initial Provisioning Run
![First Execution Recap](assets/04-playbook-run-first.png)

### 5. Idempotency Confirmation (`changed=0`)
![Second Execution Recap changed=0](assets/05-playbook-idempotency.png)

### 6. Dynamic Host Fact Inspection
![Jinja2 Fact Verification](assets/06-motd-verification.png)
