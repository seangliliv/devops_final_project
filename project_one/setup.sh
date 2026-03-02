#!/bin/bash
# install just on the machine to run the ansible playbooks
sudo snap install just --classic
just —version
#set up ansible localy on the machine and install the required packages for ansible to work
sudo apt update
sudo apt install ansible -y
ansible --version
ansible-playbook --version
