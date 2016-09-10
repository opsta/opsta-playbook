#!/bin/bash

set -e

ansible-galaxy install -f -n -r ../requirements/galaxy-requirements.yml
