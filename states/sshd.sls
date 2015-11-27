{% set sshd_conf_source = 'salt://services/ssh/sshd_config-template' %}
{% set sshd_conf_dest = '/etc/ssh/sshd_config' %}

{% if grains['osfullname'] == 'CentOS' %}
{% set sshd_servname = 'sshd' %}
{% elif grains['osfullname'] == 'Ubuntu' %}
{% set sshd_servname = 'ssh' %}
{% endif %}


{% if grains['osfullname'] == 'CentOS' %}
add ssh_access group:
  group.present:
    - name: ssh_access
    - gid: 399
{% endif %}

sshd config:
  file.managed:
    - source: {{ sshd_conf_source }}
    - name: {{ sshd_conf_dest }}
    - user: root
    - group: root
    - mode: 600
    - template: jinja
{% if grains['osfullname'] == 'CentOS' %}
    - reqire:
      - group: add ssh_access group
{% endif %}

sshd service:
  service.running:
    - name: {{ sshd_servname }}
    - enable: True
    - watch: 
      - file: sshd config
