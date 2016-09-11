#!/bin/bash

set -e
set -x

echo "Install Ansible and required libraries"
pip install -r ../requirements/python-requirements.txt


echo "Patch Ansible"

PYTHON_LIB_PATH=$(echo 'import os; from ansible.playbook import play_context; print os.path.dirname(play_context.__file__);' | python -)
rm "$PYTHON_LIB_PATH/play_context.pyc"
sed -i'' -e '417,418 s/^/#/' "$PYTHON_LIB_PATH/play_context.py"

PYTHON_LIB_PATH=$(echo 'import os; from ansible.plugins.connection import docker; print os.path.dirname(docker.__file__);' | python -)
rm "$PYTHON_LIB_PATH/docker.pyc"
wget -O "$PYTHON_LIB_PATH/docker.py" \
  https://raw.githubusercontent.com/ansible/ansible/a4785c2691290df6047da5294632a8c428e67476/lib/ansible/plugins/connection/docker.py

PYTHON_LIB_PATH=$(echo 'import os; from ansible.module_utils import docker_common; print os.path.dirname(docker_common.__file__);' | python -)
rm "$PYTHON_LIB_PATH/docker_common.pyc"
wget -O "$PYTHON_LIB_PATH/docker_common.py" \
  https://raw.githubusercontent.com/ansible/ansible/39aa740531f171a557e8604babd493793d63323e/lib/ansible/module_utils/docker_common.py

PYTHON_LIB_PATH=$(echo 'import os; from ansible.modules.core.cloud.docker import docker_container; print os.path.dirname(docker_container.__file__);' | python -)
rm "$PYTHON_LIB_PATH/docker_container.pyc"
wget -O "$PYTHON_LIB_PATH/docker_container.py" \
  https://raw.githubusercontent.com/ansible/ansible-modules-core/de0122fdaf5975cf2df87fc36b059c74032396e6/cloud/docker/docker_container.py
