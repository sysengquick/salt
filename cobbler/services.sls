# start and enable all the cobbler services
service-httpd:
  service.running:
    - name: httpd
    - enable: True

service-cobblerd:
  service.running:
    - name: cobblerd
    - enable: True
    - watch:
      - file: config-default-password
      - file: config-manage-services
      - file: config-pxe-loop
      - file: config-next-server
      - file: config-server
      - file: config-modules

service-rsyncd:
  service.running:
    - name: rsyncd
    - enable: True

service-xinetd:
  service.running:
    - name: xinetd
    - enable: True
    - require:
      - cmd: cobbler-config-sync
