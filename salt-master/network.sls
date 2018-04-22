{% if salt['grains.has_value']('hwaddr_interfaces:wan') %}
  {% set wan_mac = salt['grains.get']('hwaddr_interfaces:wan') %}
  {% set lan_mac = salt['grains.get']('hwaddr_interfaces:lan') %}
{% else %}
  {% set wan_mac = salt['grains.get']('hwaddr_interfaces:enp0s3') %}
  {% set lan_mac = salt['grains.get']('hwaddr_interfaces:enp0s8') %}
{% endif %}

rename-network-cards:
  file.managed:
    - name: '/etc/udev/rules.d/70-network.rules'
    - contents: |
        SUBSYSTEM=="net",ACTION=="add",ATTR{address}=="{{ wan_mac }}",NAME="wan"
        SUBSYSTEM=="net",ACTION=="add",ATTR{address}=="{{ lan_mac }}",NAME="lan"

global-network-config:
  network.system:
    - enabled: True
    - hostname: debian-master.vbox.local
    - require_reboot: True

wan-config:
  network.managed:
    - name: wan
    - enabled: True
    - type: eth
    - proto: none
    - ipaddr: 192.168.5.200
    - netmask: 255.255.255.0
    - gateway: 192.168.5.1
    - dns:
      - 192.168.5.1
    - noifupdown: True

lan-config:
  network.managed:
    - name: lan
    - enabled: True
    - type: eth
    - proto: none
    - ipaddr: 172.16.1.1
    - netmask: 255.255.255.0
    - noifupdown: True
