packages:
  pkg.latest:
    - name: python-apt

salt-repo:
  pkgrepo.managed:
    - name: 'deb http://repo.saltstack.com/apt/debian/9/amd64/2018.3 stretch main'
    - file: '/etc/apt/sources.list.d/saltstack.list'
    - key_url: 'https://repo.saltstack.com/apt/debian/9/amd64/2018.3/SALTSTACK-GPG-KEY.pub'
