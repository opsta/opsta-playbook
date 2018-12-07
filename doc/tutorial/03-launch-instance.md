# Infrastructure as a code 103: Launch Openstack instance
Now this part is gonna be very different from the first two because of Openstack comes into play. And you will learn:

- How to launch an Openstack instance with Ansible to be a nginx server

## Prerequisites
- One control machine that already pass [101: Host Preparation](01-host-preparation.md)
- API Access to Openstack server

    ```bash
    # Create new file name openrc
    touch openrc
    vi openrc

    # Source openrc file for api access
    source openrc
    ```

## Step 1: Create variable file
1. Create folder `group_vars/GROUP_NAME/launch-openstack-instances` with GROUP_NAME be the same in your inventory file

    ```bash
    # For example, we will use 'preproduction' as GROUP_NAME
    mkdir -p group_vars/preproduction/launch-openstack-instances
    ```

1. Add nginx environment for launch-openstack-instances

    ```bash
    # Create new file and edit it
    vi group_vars/preproduction/launch-openstack-instances/nginx.yml

    ################### Put the following in the file ###################
    ---
    # Edit this
    service_name: nginx-NAME
    os_instance:
      image: xenial-server-cloudimg-amd64
      # Edit this
      key_name: YOUR_KEY_NAME
      flavor: m1.small
      network: external-network
      security_groups: default
      volume_size: 16
      project_name: opsta
      ansible_user: ubuntu
      groups: preproduction
      count: 1
    #####################################################################
    ```

## Step 2: Launch OpenStack instance
1. Run ansible playbook

    ```bash
    # Ansible will read variables in group_vars and launch instance according to them
    ansible-playbook launch-openstack-instances.yml
    ```

1. Check your new instance in Openstack server

## Next
[Deploy nginx service](04-deploy-nginx.md)
