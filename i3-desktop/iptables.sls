copy-iptables-rules:
  file.recurse:
    - name: '/etc/iptables'
    - source: salt://files/etc/iptables
    - user: root
    - group: root
    - file_mode: 0644
