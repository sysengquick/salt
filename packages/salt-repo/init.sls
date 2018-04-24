{% import 'import/os-info.sls' as os %}
{% include 'packages/salt-repo/' + os.distro + '.sls' %}
