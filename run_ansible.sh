#!/usr/bin/env bash
# docker run --rm -it new-computer bash -c "ANSIBLE_LOCALHOST_WARNING=false ansible-playbook local.yml -K --ask-vault-pass; bash"
docker run --rm -it new-computer bash -c "ANSIBLE_LOCALHOST_WARNING=false ansible-playbook -t ssh local.yml -K --ask-vault-pass; bash"
