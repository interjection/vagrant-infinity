php:
    pkg.installed:
        - pkgs:
            - php5-fpm
            - php5-apcu
            - php5-mysql
            - php5-cli

php-grafix:
    pkg.installed:
        - pkgs:
            - php5-gd
            - php5-imagick

pear:
    pkg.installed:
        - name: php-pear

Net_DNS2:
    cmd.run:
        - name: sudo pear install Net_DNS2
        - require:
            - pkg: pear
        - unless: sudo pear list | grep Net_DNS2

