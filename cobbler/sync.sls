# check the cobbler config and synchronize it
cobbler-config-check:
  cmd.run:
    - name: 'cobbler check'
    - require:
      - service: service-cobblerd

cobbler-config-sync:
  cmd.run:
    - name: 'cobbler sync'
    - require:
      - cmd: cobbler-config-check
