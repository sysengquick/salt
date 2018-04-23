{% set redhat_version = grains['osmajorrelease'] %}

epel-repo:
  pkg.installed:
    - sources:
      - epel-release: https://dl.fedoraproject.org/pub/epel/epel-release-latest-{{ redhat_version }}.noarch.rpm
