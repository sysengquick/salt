# ensure required packages are installed
salt-packages:
  pkg.latest:
    - pkgs:
      - acl
      - git
    - require_in:
      - git-srv-pillar
      - git-srv-salt

# setup salt-master pki
salt-master-private-key:
  file.managed:
    - name: '/etc/salt/pki/master.pem'
    - contents_pillar: salt-master-pki:private

salt-master-public-key:
  file.managed:
    - name: '/etc/salt/pki/master.pub'
    - contents_pillar: salt-master-pki:public

# reconfigure salt-minion to be salt-master
salt-minion-config:
  file.managed:
    - name: '/etc/salt/minion.d/local.conf'
    - contents: |
        master: localhost
        id: salt-master

# clone /srv/pillar and /srv/salt from github
git-srv-pillar:
  git.latest:
    - name: https://github.com/sysengquick/pillar.git
    - target: /srv/pillar

git-srv-salt:
  git.latest:
    - name: https://github.com/sysengquick/salt.git
    - target: /srv/salt
