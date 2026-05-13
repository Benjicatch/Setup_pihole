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
