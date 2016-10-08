# Infrastructure as a code 102: Install docker
Welcome to second part of Infrastructure as a code tutorial.
In this part we will be learning:

- Installing docker on target host with Ansible
- Setup docker machine on target host with Ansible

## Prerequisites
1. Complete [101: Host Preparation](01-host-preparation.md)

## Step 1: Install docker with Ansible playbook
1. Run install docker playbook on target host that has been prepared

    ```bash
    ansible-playbook -i inventories/target_host install-docker.yml
    ```

1. You can SSH to target host and see if docker has been installed

## Step 2: Manage docker machine
1. Run manage docker machine playbook

    ```bash
    ansible-playbook -i inventories/target_host manage-docker-machine.yml
    ```

1. All docker machine relate files will be store in `./files/docker-machine/`

### Why do we need docker machine?
Docker machine is needed for Ansible to be able to manage docker-related command on target host.

## More
Let's [Launch Openstack instance with Ansible](03-launch-instance.md)
