{% if salt['vbox_guest.additions_version']() == False %}
copy-installer:
  file.managed:
    - name: '/tmp/vbox-additions.sh'
    - source: salt://files/vbox-additions/linux/vbox-additions.sh
    - mode: 0700

run-installer:
  cmd.run:
    - name: '/tmp/vbox-additions.sh'

delete-installer:
  file.absent:
    - name: '/tmp/vbox-additions.sh'
{% endif %}
