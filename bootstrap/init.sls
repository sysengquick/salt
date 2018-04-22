packages:
  pkg.latest:
    - name: python-apt

salt-repo:
  pkgrepo.managed:
    - name: 'deb http://repo.saltstack.com/apt/debian/9/amd64/2018.3 stretch main'
    - file: '/etc/apt/sources.list.d/saltstack.list'
    - key_url: 'https://repo.saltstack.com/apt/debian/9/amd64/2018.3/SALTSTACK-GPG-KEY.pub'

salt-minion:
  pkg.latest:
    - name: salt-minion

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
