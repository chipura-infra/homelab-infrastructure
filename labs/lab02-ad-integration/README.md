# Lab 02: Active Directory Integration & Break-Analyze-Fix Analysis

## Overview
Integration of a Debian 12 (Bookworm) client node into a Active Directory domain running on Windows Server 2022 (`homelab.local`). Implementation of Kerberos authentication, automatic home directory provisioning, and domain privilege escalation via `sudoers`.

## Environment Specifications
* **OS Client:** Debian 12 (Bookworm) `192.168.1.33`
* **Domain Controller:** Windows Server 2022 (`DC01.homelab.local`) `192.168.1.10`
* **Domain Name:** `homelab.local` / `HOMELAB.LOCAL`
* **Auth Stack:** `realmd`, `SSSD`, `pam_sss`, `adcli`, `krb5-user`

---

## Break-Analyze-Fix / Root Cause Analysis (RCA)

### Incident 1: DNS SRV Record Resolution Failure
* **Symptom:** `realm discover homelab.local` failed with `No such realm found`.
* **Network Traffic Analysis:**
  * Packet capture (`artifacts/ad_dns_error.pcapng`) revealed queries for `_kerberos._udp` / `_ldap._tcp` returning `NXDomain` / `No such name`.
* **Root Cause:** Client `/etc/resolv.conf` was pointing to an external DNS resolver instead of `192.168.1.10`.
* **Resolution:** Reconfigured static DNS settings in `/etc/resolv.conf` to target the primary DC.

### Incident 2: Kerberos Principal Failure (`KDC_ERR_C_PRINCIPAL_UNKNOWN`)
* **Symptom:** `realm join -U Administrator` threw `Client 'Administrator@HOMELAB.LOCAL' not found in Kerberos database`.
* **Root Cause:** The domain controller was deployed using a Russian localized ISO, causing the default administrative principal to be `Администратор`.
* **Resolution:** Performed domain enrolment using the localized administrator account:
bash
realm join -U Администратор homelab.local -v


---

## Key Configuration Files
* `configs/sssd.conf`: SSSD client configuration for domain mapping and fallback home directory definitions.
* `configs/domain_admins`: Sudoers drop-in configuration providing root rights (`NOPASSWD`) for domain administrative accounts.

## Verification
1. **SSSD User Resolution:**
bash
id Администратор

2. **Privilege Escalation:**
bash
su - Администратор -c "sudo whoami"
# Output: root

