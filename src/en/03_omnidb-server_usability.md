# 3. omnidb-server Usability

`omnidb-server` comes with several command line arguments to facilitate usage:

```
Usage: omnidb-server [options]

Options:
  --version             show program's version number and exit
  -h, --help            show this help message and exit

  General Options:
    -d HOMEDIR, --homedir=HOMEDIR
                        home directory containing config and log files
    -C CONF, --configfile=CONF
                        configuration file
    -i, --init          Create home directory containing config and log files

  Webserver Options:
    -H HOST, --host=HOST
                        listening address
    -p PORT, --port=PORT
                        listening port
    -P PATH, --path=PATH
                        path to access the application, other than /

  Management Options:
    Options to list, create and drop users and connections.

    -M dbfile, --migratedatabase=dbfile
                        migrate users and connections from OmniDB 2 to 3: -M
                        dbfile
    -r, --resetdatabase
                        reset user and session databases
    -j, --jsonoutput    format list output as json
    -l, --listusers     list users
    -u username password, --createuser=username password
                        create user: -u username password
    -s username password, --createsuperuser=username password
                        create super user: -s username password
    -x username, --dropuser=username
                        drop user: -x username
    -m username, --listconnections=username
                        list connections: -m username
    -c username technology title host port database dbuser, --createconnection=username technology title host port database dbuser
                        create connection: -c username technology host port
                        database dbuser
    -z connid, --dropconnection=connid
                        drop connection: -z connid
```

- `General Options`: Options to provision/specify configuration and directory locations.

- `Webserver Options`: Webserver related settings.

- `Management Options`: Several options to manage the currently configured backend
database.
```

## 3.1. OmniDB User Files

`omnidb-server` is supposed to be pointed to a directory that contains files
being used at execution time:

- `config.py`: Configuration file.

- `omnidb.db`: Local database containing user session data and also OmniDB related
metadata, if the user decides to deploy OmniDB using SQLite as backend database.

- `omnidb.log`: Log file, automatically rotated.

A directory is specified with: `omnidb-server -d /path/to/dir`. If not specified,
OmniDB will use the default `~/.omnidb/omnidb-server`.

When running `omnidb-server` for the first time, or pointing to a directory that
does not contain existing files, `OmniDB` will create them for you and run. Users
may prefer to run first `omnidb-server --init`, which will just create the default
files allowing you can adjust settings before starting the application.

## 3.2. OmniDB Backend Database

OmniDB requires a database to store its metadata, containing user and connection
details.

By default OmniDB uses SQLite, and will store its data in file `omnidb.db` located
in the target runtime directory explained in the previous section.

Version 3.0 introduces the ability to deploy OmniDB using `PostgreSQL` as the backend
database. This can be achieved by configuring `config.py` with the following section:

```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'dbname',
        'USER': 'postgres',
        'PASSWORD': '',
        'HOST': '127.0.0.1',
        'PORT': '5432',
    }
}
```

Adjust the connection parameters accordingly.

When running `omnidb-server`, the target database will be configured and migrations
will be executed to create required objects.

## 3.3. Authentication Methods

By default OmniDB authenticates users using its backend database.

OmniDB 3 introduces the ability to use different authentication methods. Version
3.0.0 comes with `AD/LDAP`, which is enabled by adding the following section in
`config.py`:

```
import ldap
import django_auth_ldap.config
from django_auth_ldap.config import LDAPSearch

AUTH_LDAP_SERVER_URI = 'SERVER'
AUTH_LDAP_BIND_DN = "uid=example,dc=example,dc=com"
AUTH_LDAP_BIND_PASSWORD = "password"
AUTH_LDAP_USER_SEARCH = django_auth_ldap.config.LDAPSearch(
            "uid=example,dc=example,dc=com", ldap.SCOPE_SUBTREE, "uid=%(user)s"
            )

AUTHENTICATION_BACKENDS = [
    'django_auth_ldap.backend.LDAPBackend',
    'django.contrib.auth.backends.ModelBackend'
]
```

Parameters must be adjusted according to the LDAP server being used.

OmniDB's `LDAP` authentication uses `django-auth-ldap` library, which contains several
customization options. More details in: https://django-auth-ldap.readthedocs.io/en/latest/

If additional settings are needed, just amend `config.py` accordingly.

## 3.4. OmniDB configuration file

Apart from database and authentication settings, the configuration file (`config.py`)
contains all settings required to properly deploy OmniDB according to the user's
environment.

- `LISTENING_ADDRESS`: specifies in what address the server will listen, the default
value is `127.0.0.1`.

- `LISTENNING_PORT`: specifies in what port OmniDB server will listen, this is the port used
in the browser's URL if OmniDB is being accessed directly. The default value is
8000.

- `CUSTOM_PATH`: specifies a custom path to access OmniDB in the browser URL. The
default value is empty, meaning that no custom path is used. If user specifies `'test'`
in this setting, OmniDB will be accessible with `http://127.0.0.1:8000/test`. This
setting is useful when OmniDB is configured behind `Apache` or `NGINX`, so that
all requests to the `CUSTOM_PATH` can be easily redirected to OmniDB.

- `IS_SSL`, `SSL_CERTIFICATE_FILE`, `SSL_KEY_FILE`: settings to configure SSL
connection. If `IS_SSL` is `True` then certificate and key files must be provided.

The previous settings are enough to securely provision `omnidb-server`. The Configuration
file contains additional settings for environments with additional configuration
requirements.
