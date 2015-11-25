

add ssh_access group:
  group.present:
    - name: ssh_access
    - gid: 399
    
sshd config:
  file.managed:
    - source: salt://services/ssh/sshd_config
    - name: /etc/ssh/sshd_config
    - user: root
    - group: root
    - mode: 600
    - reqire:
      - group: add ssh_access group

sshd service:
  service.running:
    - name: sshd
    - enable: True
    - watch: 
      - file: sshd config
