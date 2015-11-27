
add user root:
  user.present:
    - name: root
    - uid: 0
    - gid: 0
    - home: /root
    - shell: /bin/bash
    - password: $6$aiBW0/gN$uAwL8KifhYTGH3xYkQyOPnUAz8DTaT/movTJNO1/SxIK2rGCLZjCgW1qWFpe/BO0q7h6BNbfh52B3UJKtRtQR/
    
add user spec:
  user.present:
    - name: {{ grains['host'] }}
    - uid: 1000
    - gid: 1000
    - home: /home/{{ grains['host'] }}
    - shell: /bin/bash
    - password: $6$gNv2quSb$jqi7dBsthq1uUCWK/DY7RRGdGl7vrtxEhdL1pmOR.Oz5tyG9gItaKBJzGyfehZJoUXoS1CK0lc73tqLd9pqTy1

workstation packages:
  pkg.installed:
    - pkgs:
      - nano
      - mc
      - tcpdump
      - nmap
      - bind9utils
      - tmux
      - sshfs
      - git-core
      - netcat-openbsd
