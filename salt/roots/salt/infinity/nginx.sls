/etc/nginx/conf.d/{{ pillar['virtual_hostname'] }}.conf:
    file:
        - managed
        - source: salt://infinity/nginx.conf
        - template: jinja
        - context:
            virtual_hostname: {{ pillar['virtual_hostname'] }}
            root_directive: {{ pillar['root_directive'] }}
        - require:
            - pkg: nginx

