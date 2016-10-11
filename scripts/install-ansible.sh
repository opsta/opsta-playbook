#!/bin/bash

set -e
set -x

echo "Install Ansible and required libraries"
pip install -r ../requirements/python-requirements.txt


echo "Patch Ansible"

# https://github.com/ansible/ansible/commits/devel/lib/ansible/playbook/play_context.py
PYTHON_LIB_PATH=$(echo 'import os; from ansible.playbook import play_context; print os.path.dirname(play_context.__file__);' | python -)
rm "$PYTHON_LIB_PATH/play_context.pyc"
sed -i'' -e '417,418 s/^/#/' "$PYTHON_LIB_PATH/play_context.py"

# https://github.com/ansible/ansible/commits/devel/lib/ansible/plugins/connection/docker.py
PYTHON_LIB_PATH=$(echo 'import os; from ansible.plugins.connection import docker; print os.path.dirname(docker.__file__);' | python -)
rm "$PYTHON_LIB_PATH/docker.pyc"
wget -O "$PYTHON_LIB_PATH/docker.py" \
  https://raw.githubusercontent.com/ansible/ansible/a4785c2691290df6047da5294632a8c428e67476/lib/ansible/plugins/connection/docker.py

# https://github.com/ansible/ansible/commits/devel/lib/ansible/module_utils/docker_common.py
PYTHON_LIB_PATH=$(echo 'import os; from ansible.module_utils import docker_common; print os.path.dirname(docker_common.__file__);' | python -)
rm "$PYTHON_LIB_PATH/docker_common.pyc"
wget -O "$PYTHON_LIB_PATH/docker_common.py" \
  https://raw.githubusercontent.com/ansible/ansible/fa7e572a964ad649d078b52efce9196ca22bcb18/lib/ansible/module_utils/docker_common.py

# https://github.com/ansible/ansible-modules-core/commits/devel/cloud/docker/docker_container.py
PYTHON_LIB_PATH=$(echo 'import os; from ansible.modules.core.cloud.docker import docker_container; print os.path.dirname(docker_container.__file__);' | python -)
rm "$PYTHON_LIB_PATH/docker_container.pyc"
wget -O "$PYTHON_LIB_PATH/docker_container.py" \
  https://raw.githubusercontent.com/ansible/ansible-modules-core/84020b39ee79143291a6cc559fc4960b1f2804a9/cloud/docker/docker_container.py

# https://github.com/ansible/ansible-modules-core/commits/devel/cloud/docker/docker_image.py
PYTHON_LIB_PATH=$(echo 'import os; from ansible.modules.core.cloud.docker import docker_image; print os.path.dirname(docker_image.__file__);' | python -)
rm "$PYTHON_LIB_PATH/docker_image.pyc"
wget -O "$PYTHON_LIB_PATH/docker_image.py" \
  https://raw.githubusercontent.com/ansible/ansible-modules-core/523780a7ca78108829aeaff59754edb7d96ba053/cloud/docker/docker_image.py

# https://github.com/ansible/ansible-modules-extras/commits/devel/system/timezone.py
PYTHON_LIB_PATH=$(echo 'import os; from ansible.modules.extras import system; print os.path.dirname(system.__file__);' | python -)
rm -f "$PYTHON_LIB_PATH/timezone.pyc"
wget -O "$PYTHON_LIB_PATH/timezone.py" \
  https://raw.githubusercontent.com/ansible/ansible-modules-extras/df35d324d62e6034ab86db0fb4a56d3ca122d4b2/system/timezone.py

# https://github.com/ansible/ansible/commits/devel/lib/ansible/module_utils/six.py
PYTHON_LIB_PATH=$(echo 'import os; from ansible import module_utils; print os.path.dirname(module_utils.__file__);' | python -)
rm -f "$PYTHON_LIB_PATH/six.pyc"
wget -O "$PYTHON_LIB_PATH/six.py" \
  https://raw.githubusercontent.com/ansible/ansible/0cb05d8ac994ecb828cb9e4c88e92f3277e8ee1b/lib/ansible/module_utils/six.py
