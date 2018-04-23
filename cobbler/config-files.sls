# the following states setup the cobbler config files
{% set password_hash = pillar['cobbler']['password_hash'] %}

config-default-password:
  file.replace:
    - name: '/etc/cobbler/settings'
    - pattern: '^#?default_password_crypted:.*'
    - repl: 'default_password_crypted: "{{ password_hash }}"'
    - append_if_not_found: True

config-manage-services:
  file.replace:
    - name: '/etc/cobbler/settings'
    - pattern: '^#?manage_(dhcp|dns|tftp):.*'
    - repl: 'manage_\1: 1'

config-pxe-loop:
  file.replace:
    - name: '/etc/cobbler/settings'
    - pattern: '^#?pxe_just_once:.*'
    - repl: 'pxe_just_once: 1'
    - append_if_not_found: True

config-next-server:
  file.replace:
    - name: '/etc/cobbler/settings'
    - pattern: '^#?next_server:.*'
    - repl: 'next_server: 172.16.1.3'
    - append_if_not_found: True

config-server:
  file.replace:
    - name: '/etc/cobbler/settings'
    - pattern: '^#?server:.*'
    - repl: 'server: 172.16.1.3'
    - append_if_not_found: True

config-modules:
  file.replace:
    - name: '/etc/cobbler/modules.conf'
    - pattern: '^#?module = manage_(bind|isc)'
    - repl: 'module = manage_dnsmasq'

config-dnsmasq:
  file.replace:
    - name: '/etc/cobbler/dnsmasq.template'
    - pattern: '^#?dhcp-range=.*'
    - repl: 'dhcp-range=172.16.1.50,172.16.1.99'
    - append_if_not_found: True

config-debmirror:
  file.replace:
    - name: '/etc/debmirror.conf'
    - pattern: '^(@(dists|arches).*)'
    - repl: '#\1'
