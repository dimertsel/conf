{% set nginx_conf_source = 'salt://services/nginx/nginx.conf-static' %}
{% set nginx_conf_dest = '/etc/nginx/nginx.conf' %}
{% set nginx_user = 'root' %}
{% set nginx_group = 'root' %}
{% set nginx_docroot_user = 'nginx' %}
{% set nginx_docroot_group = 'nginx' %}
{% set nginx_docroot_mode = '755' %}
{% set nginx_docroot_source = 'salt://site-templates/lawfirm.zip' %}
{% set nginx_docroot_dest = 'lawfirm' %}
{% set nginx_servname = 'nginx' %}
{% set nginx_docroot_source_format = 'zip' %}
{% set nginx_mode = '644' %}
{% set nginx_package = 'nginx' %}

nginx package:
  pkg.installed:
    - pkgs: 
       - {{ nginx_package }}

nginx config:
  file.managed:
    - source:  {{ nginx_conf_source }}
    - name: {{ nginx_conf_dest }}
    - user: {{ nginx_user }}
    - group: {{ nginx_group }}
    - mode: {{ nginx_mode }}
    - template: jinja
    - reqire:
        - pkg: nginx package

nginx service:
  service.running:
    - name: {{ nginx_servname }}
    - enable: True
    - watch: 
      - file: nginx config

nginx document root parent dir:
  file.directory:
    - name: /var/www/html
    - user: {{ nginx_docroot_user }}
    - group: {{ nginx_docroot_group }}
    - mode: {{ nginx_docroot_mode }}
    - makedirs: True

nginx document root content:
  archive.extracted:
    - name: /var/www/html/{{ nginx_docroot_dest }}
    - source: {{ nginx_docroot_source }}
    - archive_format: {{ nginx_docroot_source_format }}

nginx document root symlink:
  file.symlink:
    - name: /var/www/html/{{ grains['fqdn'] }}
    - target: /var/www/html/{{ nginx_docroot_dest }}/{{ nginx_docroot_dest }}

nginx document root:
  file.directory:
   - name: /var/www/html/{{ nginx_docroot_dest }}
   - user: {{ nginx_docroot_user }}
   - group: {{ nginx_docroot_group }}
   - recurse:
     - user
     - group
