salt-minion-config:
  file.managed:
    - name: '/etc/salt/minion.d/local.conf'
    - contents: |
        master: localhost
        id: salt-master

git-srv-pillar:
  git.latest:
    - name: https://github.com/sysengquick/pillar.git
    - target: /srv/pillar

git-srv-salt:
  git.latest:
    - name: https://github.com/sysengquick/salt.git
    - target: /srv/salt
