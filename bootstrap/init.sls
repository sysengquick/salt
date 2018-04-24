include:
  - packages.salt-repo

salt-minion:
  pkg.latest:
    - name: salt-minion
    - require:
      - salt-repo

salt-config:
  file.managed:
    - name: '/etc/salt/minion.d/local.conf'
    - contents: |
        master: 172.16.1.1
        id: {{ grains['id'] }}

salt-minion-id:
  file.absent:
    - name: '/etc/salt/minion_id'

salt-service:
  service.running:
    - name: salt-minion
    - enable: True
    - watch:
      - file: '/etc/salt/minion.d/local.conf'
      - file: '/etc/salt/minion_id'
    - require:
      - pkg: salt-minion
