#!/bin/bash

set -e
set -x

echo "Install Ansible and required libraries"
pip install -r ../requirements/python-requirements.txt
