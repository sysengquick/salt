# make sure tigervnc package is installed
tigervnc-package:
  pkg.latest:
    - name: tigervnc-standalone-server

# create tigervnc systemd service
tigervnc-systemd-state:
  file.managed:
    - name: '/etc/systemd/system/tigervnc@:1.service'
    - source: salt://files/etc/systemd/system/tigervnc@:1.service
    - user: root
    - group: root
    - mode: 0644

# enable tigervnc service on next boot
tigervnc-service:
  service.enabled:
    - name: 'tigervnc@:1'
    - require:
      - file: tigervnc-systemd-state
      - pkg: tigervnc-standalone-server
