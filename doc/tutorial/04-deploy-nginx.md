# Infrastructure as a code 104: Deploy nginx service
## Prerequisites
1. Complete [103: Launch Openstack instance](03-launch-instance.md)

## Step 1: Set inventory to point at your new instance
1. Change your inventory file

    ```bash
    # Change target host to point at your new instance
    vi ./inventories/target_host
    ```

## Step 2: Deploy nginx with Ansible playbook
1. Run automated docker playbook with extra environment

    ```bash
    # automated_docker_name is variable that define which service to be deploy.
    ansible-playbook -i inventories/target_host -e automated_docker_name=nginx automated-docker.yml
    ```

1. You may want to check docker container in your instance and try accessing them on nginx port
