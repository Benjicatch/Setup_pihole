#!/bin/bash
pipx install ansible-core
ansible --version

REPO_DIR="/home/vagrant/Setup_pihole"

# Clone Setup_pihole repository if it doesn't exist
if [ ! -d "$REPO_DIR/.git" ]; then
  rm -rf "$REPO_DIR"
  git clone https://github.com/Benjicatch/Setup_pihole.git "$REPO_DIR"
fi

git config --global --add safe.directory "$REPO_DIR"

cd "$REPO_DIR"

# Always ensure we're on the main branch and up to date
git fetch origin
git checkout main
git pull origin main

cd ansible
ansible-galaxy install -r ./requirements.yml
ansible-playbook -i "localhost," -c local ./playbook.yml --vault-password-file /home/vagrant/.vault_password
