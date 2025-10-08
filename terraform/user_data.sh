#!/bin/bash
# Update and install dependencies
apt-get update -y
apt-get install -y python3 python3-pip git curl ansible

# Install Docker
apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
add-apt-repository "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu jammy stable"
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Clone your repo (replace with your actual repo URL)
cd /home/ubuntu
git clone https://github.com/nasiban/doctorly.git
cd ansible

# Run Ansible playbook locally
ansible-playbook -i inventory.ini playbooks/site.yml --connection=local
