# we need the epel repo for cobbler packages
include:
  - packages.epel-repo

# install the packages necessary to run cobbler
packages:
  pkg.latest:
    - pkgs:
      - cobbler
      - cobbler-web
      - debmirror
      - dnsmasq
      - policycoreutils-python
      - pykickstart
      - xinetd
    - require:
      - pkg: epel-repo
    - require_in:
      - file: config-default-password
      - file: config-manage-services
      - file: config-pxe-loop
      - file: config-next-server
      - file: config-server
      - file: config-dnsmasq
      - service: service-cobblerd
      - service: service-httpd
      - service: service-xinetd
