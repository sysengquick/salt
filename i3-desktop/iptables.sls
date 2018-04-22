copy-iptables-rules:
  file.recurse:
    - name: '/etc/iptables'
    - source: salt://files/etc/iptables
    - user: root
    - group: root
    - file_mode: 0644

enable-routing:
  sysctl.present:
    - name: ip_forward
    - value: 1
    - config: '/etc/sysctl.d/local.conf'
