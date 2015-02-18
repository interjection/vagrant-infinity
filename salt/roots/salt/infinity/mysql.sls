infinity-db:
    mysql_database.present:
        - name: {{ pillar['db_name'] }}

infinity-db-user:
    mysql_user.present:
        - name: {{ pillar['db_username'] }}
        - password: {{ pillar['db_password'] }}

infinity-db-user-grant:
    mysql_grants.present:
        - grant: all privileges
        - database: '{{ pillar['db_name'] }}.*'
        - user: {{ pillar['db_username'] }}
        - require:
            - mysql_database: infinity-db
            - mysql_user: infinity-db-user

