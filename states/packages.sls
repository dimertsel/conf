
# Base:
{% set ipap_packages_base_name = 'ipap-packages-base' %}
{% set ipap_packages_base_baseurl = 'http://packages/centos/$releasever/os/$basearch/' %}
{% set ipap_packages_base_gpgkey = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever' %}
{% set ipap_packages_base_enabled = '1' %}
{% set ipap_packages_base_gpgcheck = '1' %}

# Updates:
{% set ipap_packages_updates_name = 'ipap-packages-updates' %}
{% set ipap_packages_updates_baseurl = 'http://packages/centos/$releasever/updates/$basearch/' %}
{% set ipap_packages_updates_gpgkey = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever' %}
{% set ipap_packages_updates_enabled = '1' %}
{% set ipap_packages_updates_gpgcheck = '1' %}

# CentosPlus:
{% set ipap_packages_centosplus_name = 'ipap-packages-centosplus' %}
{% set ipap_packages_centosplus_baseurl = 'http://packages/centos/$releasever/centosplus/$basearch/' %}
{% set ipap_packages_centosplus_gpgkey = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever' %}
{% set ipap_packages_centosplus_enabled = '1' %}
{% set ipap_packages_centosplus_gpgcheck = '1' %}

# Extras:
{% set ipap_packages_extras_name = 'ipap-packages-extras' %}
{% set ipap_packages_extras_baseurl = 'http://packages/centos/$releasever/extras/$basearch/' %}
{% set ipap_packages_extras_gpgkey = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-$releasever' %}
{% set ipap_packages_extras_enabled = '1' %}
{% set ipap_packages_extras_gpgcheck = '1' %}

# Remi:
{% set ipap_packages_remi_name = 'ipap-packages-remi' %}
{% set ipap_packages_remi_baseurl = 'http://packages/centos/remi/$releasever/remi/$basearch/' %}
{% set ipap_packages_remi_gpgkey = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-remi' %}
{% set ipap_packages_remi_enabled = '1' %}
{% set ipap_packages_remi_gpgcheck = '1' %}

# Nginx:
{% set ipap_packages_nginx_name = 'ipap-packages-nginx' %}
{% set ipap_packages_nginx_baseurl = 'http://packages/centos/nginx/stable/$releasever/$basearch/' %}
{% set ipap_packages_nginx_gpgkey = 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-nginx' %}
{% set ipap_packages_nginx_enabled = '1' %}
{% set ipap_packages_nginx_gpgcheck = '1' %}




# Repo's rpm packages sources:
{% set epel_rpm = 'salt://packages/epel.rpm' %}
{% set rpmforge_rpm = 'salt://packages/rpmforge.rpm' %}
{% set remi_rpm = 'salt://packages/remi.rpm' %}
{% set nginx_rpm = 'salt://packages/nginx.rpm' %}


# Отключаем репозитории для предотвращения выхода в Интернет (синхронизации
# метаданных yum)
repos disable 1st:
  cmd.run: 
    - name: yum-config-manager --disable "*" > /dev/null

repo rpm files:
  pkg.installed:
    - sources:
      - epel: {{ epel_rpm }}
      - rpmforge: {{ rpmforge_rpm }}
      - nginx: {{ nginx_rpm }}
      - remi: {{ remi_rpm }}

# Отключаем все установленные  из RPM-пакетов репозитории
repos disable 2nd:
  cmd.run: 
    - name: yum-config-manager --disable "*" > /dev/null
      

repo ipap packages base:
  pkgrepo.managed:
    - name: {{ ipap_packages_base_name }}
    - humanname: {{ ipap_packages_base_name }}
    - baseurl: {{ ipap_packages_base_baseurl }}
    - enabled: {{ ipap_packages_base_enabled }}
    - gpgcheck: {{ ipap_packages_base_gpgcheck }}
    - gpgkey: {{ ipap_packages_base_gpgkey }}
    
repo ipap packages updates:
  pkgrepo.managed:
    - name: {{ ipap_packages_updates_name }}
    - humanname: {{ ipap_packages_updates_name }}
    - baseurl: {{ ipap_packages_updates_baseurl }}
    - enabled: {{ ipap_packages_updates_enabled }}
    - gpgcheck: {{ ipap_packages_updates_gpgcheck }}
    - gpgkey: {{ ipap_packages_updates_gpgkey }}
    

repo ipap packages centosplus:
  pkgrepo.managed:
    - name: {{ ipap_packages_centosplus_name }}
    - humanname: {{ ipap_packages_centosplus_name }}
    - baseurl: {{ ipap_packages_centosplus_baseurl }}
    - enabled: {{ ipap_packages_centosplus_enabled }}
    - gpgcheck: {{ ipap_packages_centosplus_gpgcheck }}
    - gpgkey: {{ ipap_packages_centosplus_gpgkey }}
    

repo ipap packages extras:
  pkgrepo.managed:
    - name: {{ ipap_packages_extras_name }}
    - humanname: {{ ipap_packages_extras_name }}
    - baseurl: {{ ipap_packages_extras_baseurl }}
    - enabled: {{ ipap_packages_extras_enabled }}
    - gpgcheck: {{ ipap_packages_extras_gpgcheck }}
    - gpgkey: {{ ipap_packages_extras_gpgkey }}


repo ipap packages remi:
  pkgrepo.managed:
    - name: {{ ipap_packages_remi_name }}
    - humanname: {{ ipap_packages_remi_name }}
    - baseurl: {{ ipap_packages_remi_baseurl }}
    - enabled: {{ ipap_packages_remi_enabled }}
    - gpgcheck: {{ ipap_packages_remi_gpgcheck }}
    - gpgkey: {{ ipap_packages_remi_gpgkey }}


repo ipap packages nginx:
  pkgrepo.managed:
    - name: {{ ipap_packages_nginx_name }}
    - humanname: {{ ipap_packages_nginx_name }}
    - baseurl: {{ ipap_packages_nginx_baseurl }}
    - enabled: {{ ipap_packages_nginx_enabled }}
    - gpgcheck: {{ ipap_packages_nginx_gpgcheck }}
    - gpgkey: {{ ipap_packages_nginx_gpgkey }}
    
