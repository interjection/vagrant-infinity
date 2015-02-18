include:
    - infinity.nginx
    - infinity.mysql
    - infinity.packages

infinity-repo:
    git.latest:
        - name: {{ pillar['git_repo'] }}
        - rev: {{ pillar['git_rev'] }}
        - target: {{ pillar['root_directive'] }}
        - require:
            - pkg: git

{{ pillar['root_directive'] }}/inc/secrets.php:
    file.copy:
        - source: {{ pillar['root_directive'] }}/inc/secrets.example.php
        - preserve: True
        - require:
            - git: infinity-repo

install-infinity:
    cmd.run:
        - name: mysql -u root {{ pillar['db_name'] }} < {{ pillar['root_directive'] }}/{{ pillar['install_script'] }}
        - require:
            - git: infinity-repo
            - mysql_database: {{ pillar['db_name'] }}
        - unless: test -e {{ pillar['root_directive'] }}/.installed

install-infinity-success:
    cmd.run:
        - name: echo 'infinity' > {{ pillar['root_directive'] }}/.installed
        - require:
            - cmd: install-infinity
        - unless: test -e {{ pillar['root_directive'] }}/.installed

