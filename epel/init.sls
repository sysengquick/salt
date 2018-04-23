# install extra package for enterprise linux repo for CentOS/RHEL
{% if grains['os_family'] == 'RedHat' %}
include:
  {% if grains['osmajorrelease'] == 6 or grains['osmajorrelease'] == 7 %}
  - epel.repo
  {% else %}
  - epel.unknown
  {% endif %}
{% endif %}
