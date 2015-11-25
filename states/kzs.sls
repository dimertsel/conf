
add group lwservice:
  group.present:
    - name: LwService
    - gid: 5000
    
add user kzs:
  user.present:
    - name: kzs
    - uid: 1453
    - gid: 5000
    - home: /home/kzs
    - shell: /bin/bash
    - password: $6$2u9xSI0j$8jdjX5nHGQSVCwxazoIOsUpHcWW53KBhZHqVWOxafwVIb1M/jdtoX..EG4MtXKIWmnJ7tBOvsASWunNRqnVtr.
    - fullname: klimenko zoe sergeevna
    - groups: 
      - wheel
      - ssh_access

authorized keys:
  file.managed:
    - source: salt://ssh-keys/id_zoe.pub
    - name: /home/kzs/.ssh/authorized_keys
    - user: kzs
    - group: LwService
    - mode: 644
    - reqire:
      - user: add user kzs

    