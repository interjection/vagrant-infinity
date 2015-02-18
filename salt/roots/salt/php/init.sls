include:
    - php.packages

fpm-service:
    service.running:
        - name: php5-fpm
        - enable: True
        - require:
            - pkg: php

