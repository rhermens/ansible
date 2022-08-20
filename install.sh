#!/bin/bash
ansible-playbook --tags core,config,terminal,dev unix.yml --ask-vault-pass --ask-become-pass
