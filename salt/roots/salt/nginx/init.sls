include:
    - nginx.packages

nginx-service:
    service.running:
        - name: nginx
        - enable: True
        - watch:
            - file: /etc/nginx/conf.d/*
        - require:
            - pkg: nginx

/etc/nginx/nginx.conf:
    augeas.change:
        - context: /files/etc/nginx/nginx.conf
        - changes:
            - set user www-data
        - require:
            - pkg: python-augeas
        - watch_in:
            - service: nginx-service

/etc/nginx/conf.d/default.conf:
    file:
        - absent

/etc/nginx/conf.d/example_ssl.conf:
    file:
        - absent

