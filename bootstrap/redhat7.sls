salt-repo:
  pkg.installed:
    - sources:
      - salt-repo: https://repo.saltstack.com/yum/redhat/salt-repo-2018.3-1.el7.noarch.rpm
