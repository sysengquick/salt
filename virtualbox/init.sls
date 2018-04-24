# get the version of the vbox guest additions
{% set version = salt['vbox_guest.additions_version']() %}

# only run these states if the modules aren't already installed
{% if version == False %}
# dkms is required to compile the modules
virtualbox-packages:
  pkg.latest:
    - pkgs:
      - bzip2
      - dkms
      {% if grains['os_family'] == 'RedHat' %}
      - kernel-devel
      {% endif %}
    - require_in:
      - cmd: run-installer

# copy the installer from the salt master to the minion
copy-installer:
  file.managed:
    - name: '/tmp/vbox-additions.sh'
    - source: salt://files/vbox-additions/linux/vbox-additions.sh
    - mode: 0700

# run the installer program
run-installer:
  cmd.run:
    - name: '/tmp/vbox-additions.sh'

# delete the installer
delete-installer:
  file.absent:
    - name: '/tmp/vbox-additions.sh'
{% else %}
display-vbox-modules-version:
  cmd.run:
    - name: echo 'VirtualBox modules version {{ version }} already installed.'
{% endif %}
