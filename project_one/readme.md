### if pubkey not yet create 
Check if you already have a key:

ls ~/.ssh/id_rsa.pub

If file does NOT exist, create one:

ssh-keygen -t rsa -b 4096

Press Enter for all defaults.

### if gcloud not yet create 

#### 1. Create the missing directory
mkdir -p ~/.config/gcloud

#### 2. Authenticate with gcloud to generate application default credentials
gcloud auth application-default login

#### 3. Verify the credentials file was created
ls ~/.config/gcloud/application_default_credentials.json

### If you're on a headless server (no browser), use:
bash
```
gcloud auth application-default login --no-launch-browser

```
### if justfile not yet install 
```
sudo snap install just --classic
```

### if ansible not yet install
```
sudo apt update
sudo apt install ansible -y
```
#### check ansible 
```
ansible --version
ansible-playbook --version
```