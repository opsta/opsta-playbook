# Infrastructure as a code: Tutorial 101
Welcome to tutorial of Infrastructure as a code. <br>
In this tutorial, we will be covering on how to install Ansible along with requirements from this repository and try to manage a machine with Ansible to give you an idea of Infrastructure as a code.
## Prerequisites
- One Linux or Mac machine with Virtualenv installed, to act as a control machine
- One or more Ubuntu machine(s) that control machine can SSH to, to act as target host(s)

## Step 1: Installing requirements on Control machine
- Create new virtualenv environment for Ansible
```bash
# Virtualenv
virtualenv env/ansible
source env/ansible/bin/activate
# Virtualenvwrapper
mkvirtualenv ansible
```
- Install Ansible with prepared script
```bash
./scripts/install-ansible.sh
```
- Install required Ansible roles from Ansible Galaxy
```bash
# Official mirror
./scripts/install-required-galaxy-roles.sh
# Thai mirror
./scripts/install-required-galaxy-roles-th.sh
```

## Step 2: Preparation on Control machine
- Prepare Ansible inventory
```bash
# Inventory file is a list of target host(s) put in group(s) for Ansible
## Copy target_host file and edit
cp ./inventories/target_host.example ./inventories/target_host
vi ./inventories/target_host

# Inventory file format
## See example in the file
[GROUP_NAME]
MACHINE_HOST_NAME ansible_user=SSH_USERNAME ansible_host=SSH_IP_ADDRESS ansible_port=SSH_PORT
```
- Prepare authorized_keys file
```bash
# Copy sample authorized_keys file and put your own public key inside
cp ./files/authorized_keys.sample ./files/authorized_keys
vi ./files/authorized_keys
```

## Step 3: Prepare target host with Infrastructure as a code
- Run host preparation
```bash
# -i point to inventory file that we created on previous step
ansible-playbook -i inventories/target_host host-preparation.yml
```
- And that's it, you're done preparing target host with just one command

## Step 4: Try SSH to target host
- SSH to your target host and first things you find changed will be host name, it will change into MACHINE_HOST_NAME that you set in inventory file
- Others than that will be some packages update and server tweaking, try to find what have been done in host preparation ansible role and you're done with this part of tutorial
