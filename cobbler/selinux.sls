# disable selinux per cobbler recommendation
disable-selinux:
  selinux.mode:
    - name: 'permissive'
