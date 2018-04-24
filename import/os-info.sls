{% set distro = grains['os'] %}
{% set release = 'unknown' %}
{% set version = grains['osmajorrelease'] %}

{% if grains['os'] == 'Debian' %}
  {% set distro = 'debian' %}

  {% if grains['osmajorrelease'] == 9 %}
    {% set release = 'stretch' %}
  {% elif grains['osmajorrelease'] == 8 %}
    {% set disto = 'jessie' %}
  {% endif %}
{% elif grains['os'] == 'Ubuntu' %}
  {% set distro = 'ubuntu' %}
  {% set version = grains['osrelease'] %}

  {% if grains['osrelease'] == '18.04' %}
    {% set release = 'bionic' %}
  {% elif grains['osrelease'] == '16.04' %}
    {% set release = 'xenial' %}
  {% elif grains['osrelease'] == '14.04' %}
    {% set release = 'trusty' %}
  {% endif %}
{% elif grains['os_family'] == 'RedHat' %}
  {% set distro = 'redhat' %}

  {% if grains['osmajorrelease'] == 7 %}
    {% set release = 'redhat7' %}
  {% elif grains['osmajorrelease'] == 6 %}
    {% set release  = 'redhat6' %}
  {% endif %}
{% endif %}

