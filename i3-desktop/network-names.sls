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
        SUBSYSTEM=="net",ACTION=="add",ATTR{address}=="{{ wan_mac }}" NAME="wan"
        SUBSYSTEM=="net",ACTION=="add",ATTR{address}=="{{ lan_mac }}",NAME="lan"
