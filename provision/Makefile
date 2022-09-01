USER?=pi
KEY_PATH?=/Users/drio/.ssh/id_rsa.pub
KEY_CONTENTS=$(shell cat $(KEY_PATH))
SSH_PORT?=22
SSH_PORT_P=-p $(SSH_PORT)
SSH=ssh $(SSH_PORT_P) $(USER)@$(IP)
# Ansible Flags
AF=ANSIBLE_DEPRECATION_WARNINGS=false 
# -i inventory_file
EXTRAS?=

play: clean inventory.ini config.two.yml
	ansible-playbook ./main.yml

ssh/%:
	./scripts/ssh $*

deps:
	ansible-galaxy install brianshumate.consul

clean:
	rm -f inventory.ini config.two.yml

inventory.ini:
	@./scripts/create_inventory.sh > $@

config.two.yml:
	@./scripts/create_config_two.sh > $@
