#!/bin/bash

ANSIBLE_GIT_REPO=git://github.com/dresden-weekly/ansible.git
ANSIBLE_VERSION=${ANSIBLE_VERSION:=1.9.2-clean}

source $PROJECT_FOLDER/$VAGRANT_ANSIBLE_REMOTE/ansible/git-install.sh
