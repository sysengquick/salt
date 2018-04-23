base:
  'virtual:VirtualBox':
    - match: grain
    - virtualbox
  cobbler:
    - cobbler
  debian-clone:
    - salt-master.editor
    - salt-master.iptables
    - salt-master.network
    - salt-master.packages
    - salt-master.salt
    - salt-master.tigervnc
    - salt-master.urxvt
    - salt-master.users
