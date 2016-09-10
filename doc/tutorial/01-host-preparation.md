# Infrastructure as a code 101: Host preparation
Welcome to tutorial of Infrastructure as a code! <br>
In this tutorial, we will be learning:

- How to install Ansible along with requirements from this repository
- Manage your host with Ansible

Which should give you an idea on how Infrastructure as a code works. Let's get right to it!

## Prerequisites
1. One Linux or Mac machine with Virtualenv installed, to act as a control machine
1. One or more Ubuntu machine(s) that control machine can SSH to, to act as target host(s)

## Step 1: Installing requirements on Control machine
1. Create new virtualenv environment for Ansible

    ```bash
    # Virtualenv
    virtualenv env/ansible
    source env/ansible/bin/activate
    # Virtualenvwrapper
    mkvirtualenv ansible
    ```

1. Install Ansible with prepared script

    ```bash
    ./scripts/install-ansible.sh
    ```

1. Install required Ansible roles from Ansible Galaxy

    ```bash
    # Official mirror
    ./scripts/install-required-galaxy-roles.sh
    # Thai mirror
    ./scripts/install-required-galaxy-roles-th.sh
    ```

## Step 2: Preparation on Control machine
1. Prepare Ansible inventory

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

1. Prepare authorized_keys file

    ```bash
    # Copy sample authorized_keys file and put your own public key inside
    cp ./files/authorized_keys.sample ./files/authorized_keys
    vi ./files/authorized_keys
    ```

## Step 3: Prepare target host with Infrastructure as a code
1. Run host preparation

    ```bash
    # -i point to inventory file that we created on previous step
    ansible-playbook -i inventories/target_host host-preparation.yml
    ```

1. And that's it, you're done preparing target host with just one command. You may want to try and see what have been changed on your target host

## What's next?
[Installing docker and manage docker machine on target host](02-install-docker.md) is next!
