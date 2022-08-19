#!/bin/bash

ansible-playbook --tags core,config,terminal workstation.yml --ask-vault-pass
