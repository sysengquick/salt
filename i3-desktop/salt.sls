salt-master-private-key:
  file.managed:
    - name: '/etc/salt/pki/master.pem'
    - contents_pillar: salt-master-pki:private

salt-master-public-key:
  file.managed:
    - name: '/etc/salt/pki/master.pub'
    - contents_pillar: salt-master-pki:public

salt-minion-config:
  file.managed:
    - name: '/etc/salt/minion.d/local.conf'
    - contents: |
        master: localhost
        id: salt-master

srv-pillar-directory:
  file.directory:
    - name: '/srv/pillar'

srv-pillar-directory-acl-default:
  acl.present:
    - name: '/srv/pillar'
    - acl_type: default:user
    - acl_name: syseng
    - perms: rwx
    - recurse: True

srv-pillar-directory-acl:
  acl.present:
    - name: '/srv/pillar'
    - acl_type: user
    - acl_name: syseng
    - perms: rwx
    - recurse: True

srv-salt-directory:
  file.directory:
    - name: '/srv/salt'

srv-salt-directory-acl-default:
  acl.present:
    - name: '/srv/salt'
    - acl_type: default:user
    - acl_name: syseng
    - perms: rwx
    - recurse: True

srv-salt-directory-acl:
  acl.present:
    - name: '/srv/salt'
    - acl_type: user
    - acl_name: syseng
    - perms: rwx
    - recurse: True

git-srv-pillar:
  git.latest:
    - name: https://github.com/sysengquick/pillar.git
    - target: /srv/pillar

git-srv-salt:
  git.latest:
    - name: https://github.com/sysengquick/salt.git
    - target: /srv/salt
