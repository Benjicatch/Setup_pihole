# Automated Pi-hole Infrastructure Deployment

## Overview

This project automates the deployment and configuration of a complete Pi-hole infrastructure using Docker, Docker Compose, and Ansible.

The objective is to provide a reproducible, scalable, and portable setup for DNS filtering on both Ubuntu servers and Raspberry Pi devices with minimal manual intervention.

The deployment also integrates Tailscale to allow secure remote access to the Pi-hole instance from anywhere.

---

# Features

## Infrastructure Automation

- Automated server provisioning using Ansible
- Idempotent deployment process
- Modular Ansible roles

## Automatic Installation

The setup automatically installs and configures:

- Docker
- Docker Compose
- Tailscale
- Pi-hole

## Containerized Deployment

- Pi-hole deployed through Docker Compose
- Easy service management and updates
- Portable infrastructure

## Remote Access

- Secure remote access using Tailscale
- Access Pi-hole dashboard from anywhere

## Pi-hole API Automation

Automatic post-deployment configuration through the Pi-hole API:

- Add blocklists
- Configure DNS settings
- Apply custom settings automatically

## Multi-Platform Support

Currently supported:

- Ubuntu
- Raspberry Pi


## Workflow

1. Install required dependencies
2. Configure Docker and Docker Compose
3. Setup Tailscale for remote access
4. Deploy Pi-hole using Docker Compose
5. Configure Pi-hole automatically through its API

# Technologies Used

- Docker
- Docker Compose
- Ansible
- Jenkins (planned)
- Tailscale
- Pi-hole API

# Goals

This project aims to demonstrate:

- Infrastructure as Code (IaC)
- Linux server automation
- Configuration management
- CI/CD workflows
- Container orchestration
- Network administration
- API automation

---

# Getting Started

## Prerequisites

Make sure the following software is installed on your machine:

- Git
- Vagrant
- VirtualBox (or another Vagrant provider)
- Ansible

Clone the repository:

```bash
git clone https://github.com/Benjicatch/Setup_pihole.git
cd your-repository
```

---

## Configure Secrets

This project uses **Ansible Vault** to securely store sensitive information.

### 1. Edit `ansible/inventoy/group_vars/all/vault.yml`

Replace the placeholder values with your own credentials:

```yaml
tailscale_key: "YOUR_TAILSCALE_AUTH_KEY"
pihole_password: "YOUR_PIHOLE_ADMIN_PASSWORD"
```

### 2. Create the vault password file

Create a file at the root of the project named:

```text
.vault_password
```

Inside the file, write the password that will be used to encrypt and decrypt the vault:

```text
my-secure-vault-password
```

> **Important:** Never commit this file to Git. It should already be included in `.gitignore`.

### 3. Encrypt the vault

Run:

```bash
ansible-vault encrypt ansible/inventoy/group_vars/all/vault.yml \
    --vault-password-file .vault_password
```

If the file is already encrypted and you need to modify it later:

```bash
ansible-vault edit ansible/inventoy/group_vars/all/vault.yml \
    --vault-password-file .vault_password
```

---

## Start the Virtual Machine

Launch the Ubuntu virtual machine with Vagrant:

```bash
vagrant up
```

If the machine is already up but need to reinstall, use :

```bash
vagrant up --provision
```

Access it:

```bash
vagrant ssh
```

---

## Access Pi-hole

Once the deployment is complete:

- Pi-hole Web UI: `http://<tailscale-ip>/admin`
- Password: the value of `pihole_password` stored in `vault.yml`
