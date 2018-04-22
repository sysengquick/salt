git-srv-pillar:
  git.latest:
    - name: https://github.com/sysengquick/pillar.git
    - target: /srv/pillar

git-srv-salt:
  git.latest:
    - name: https://github.com/sysengquick/salt.git
    - target: /srv/salt
