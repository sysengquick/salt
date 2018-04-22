tigervnc-systemd-state:
  file.managed:
    - name: '/etc/systemd/system/tigervnc@:1.service'
    - source: salt://files/etc/systemd/system/tigervnc@:1.service
    - user: root
    - group: root
    - mode: 0644

tigervnc-service:
  service.enabled:
    - name: 'tigervnc@:1'
