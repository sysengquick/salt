base:
  '*':
    - packages
  'virtual:VirtualBox':
    - match: grain
    - virtualbox
  cobbler:
    - cobbler
  debian-clone:
    - salt-master
