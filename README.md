# Ansible Janitor

Ansible roles for bringing Linux hosts into a known-good state: baseline packages, local users and SSH keys, sshd hardening, and a minimal UFW profile.

## Layout

```
playbooks/          site.yml (full pass), users-only.yml
roles/common        packages + timezone
roles/users         accounts, groups, authorized_keys
roles/sshd          drop-in hardening under sshd_config.d
roles/firewall      ufw defaults + allowed TCP ports
inventory/          example hosts + group_vars
```

## Setup

```bash
# collections used by the roles
ansible-galaxy collection install -r requirements.yml

# edit inventory and group_vars before applying anything
$EDITOR inventory/hosts.ini
$EDITOR inventory/group_vars/all.yml
```

## Usage

Always dry-run first:

```bash
make check
# or
ansible-playbook -i inventory/hosts.ini playbooks/site.yml --check --diff
```

Apply only when you are sure of the inventory:

```bash
ansible-playbook -i inventory/hosts.ini playbooks/site.yml
```

User/key changes only:

```bash
ansible-playbook -i inventory/hosts.ini playbooks/users-only.yml
```

## Notes

- Replace the placeholder `ssh_key` values before a real run.
- `state: absent` on a user is destructive — keep that list intentional.
- Do not commit vault passwords or private keys.
- Tested patterns target Debian/Ubuntu-style hosts; adjust package names for other families.

## License

MIT
