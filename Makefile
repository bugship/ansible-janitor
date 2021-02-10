.PHONY: check syntax users
INVENTORY ?= inventory/hosts.ini

check:
	ansible-playbook -i $(INVENTORY) playbooks/site.yml --check --diff

syntax:
	ansible-playbook -i $(INVENTORY) playbooks/site.yml --syntax-check

users:
	ansible-playbook -i $(INVENTORY) playbooks/users-only.yml --check --diff
