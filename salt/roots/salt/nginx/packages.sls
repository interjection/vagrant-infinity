nginx-ubuntu-repo:
    pkgrepo.managed:
        - human_name: nginx 14.04
        - name: deb http://nginx.org/packages/ubuntu/ trusty nginx
        - dist: trusty
        - file: /etc/apt/sources.list.d/nginx.list
        - key_url: http://nginx.org/keys/nginx_signing.key

nginx:
    pkg:
        - installed
        - require:
            - pkgrepo: nginx-ubuntu-repo

