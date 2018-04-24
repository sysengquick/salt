salt-repo-packages:
  pkg.latest:
    - name: python-apt

salt-repo:
  pkgrepo.managed:
    - name: 'deb http://repo.saltstack.com/apt/{{ os.distro }}/{{ os.version }}/amd64/2018.3 {{ os.release }} main'
    - file: '/etc/apt/sources.list.d/saltstack.list'
    - key_url: 'https://repo.saltstack.com/apt/{{ os.distro }}/{{ os.version }}/amd64/2018.3/SALTSTACK-GPG-KEY.pub'
    - require:
      - pkg: salt-repo-packages
