{% set nginx_autoindex_conf_source = 'salt://services/nginx/nginx.conf-autoindex' %}
{% set nginx_autoindex_conf_dest = '/etc/nginx/nginx.conf' %}
{% set nginx_autoindex_user = 'root' %}
{% set nginx_autoindex_group = 'root' %}
{% set nginx_servname = 'nginx' %}
{% set nginx_autoindex_mode = '644' %}
{% set nginx_package = 'nginx' %}

nginx package:
  pkg.installed:
    - pkgs: 
       - {{ nginx_package }}

nginx autoindex config:
  file.managed:
    - source:  {{ nginx_autoindex_conf_source }}
    - name: {{ nginx_autoindex_conf_dest }}
    - user: {{ nginx_autoindex_user }}
    - group: {{ nginx_autoindex_group }}
    - mode: {{ nginx_autoindex_mode }}
    - template: jinja
    - reqire:
        - pkg: nginx package

nginx service:
  service.running:
    - name: {{ nginx_servname }}
    - enable: True
    - watch: 
      - file: nginx autoindex config
