{% import 'import/os-info.sls' as os %}

epel-repo:
{% if os.distro == 'redhat' and (os.version == 6 or os.version == 7) %}
  pkg.installed:
    - sources:
      - epel-release: https://dl.fedoraproject.org/pub/epel/epel-release-latest-{{ os.version }}.noarch.rpm
{% else %}
  cmd.run:
    - name: echo 'epel is only used on RHEL/CentOS 6 and 7'
{% endif %}
