
base:
  'node*':
    - states/sshd
    - states/kzs
    - states/packages
    - states/nginx-static
    
  'spec*':
    - states/pbu/common
    - states/pbu/workstation
