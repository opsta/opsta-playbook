#!/bin/bash

set -e

REQ_FILENAME=${1:-galaxy-requirements.yml}

ansible-galaxy install -f -n -r ../requirements/$REQ_FILENAME
