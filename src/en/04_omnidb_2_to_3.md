# 4. Migrating from OmniDB 2 to 3

Migrating from 2 to 3 involves basically copying users and connections from OmniDB 2
and then adjusting the new configuration file.

## 4.1 Backend Database

As explained in the previous chapter, OmniDB 3 can be deployed pointing to a `PostgreSQL`
database as opposed to using the default `SQLite`.

Even if users decide to stick to `SQLite`, OmniDB 3 uses a completely different
database schema so migration steps are needed.

If the user decides not to migrate users and connections, no further steps are
needed.

In order to migrate users and connections `omnidb-server` comes with option `-M`:

```
-M dbfile, --migratedatabase=dbfile
                    migrate users and connections from OmniDB 2 to 3: -M
                    dbfile
```

Before running the migration, make sure that OmniDB 3 already has a `config.py`
file with backend database properly configured, as explained in chapter 3.

The target database backend must already exist so make sure to run OmniDB 3 for
the first time so that new database schema is created:

```
omnidb-server
Copying config file to home directory.
Starting OmniDB server...
Running database migrations...
Operations to perform:
  Apply all migrations: OmniDB_app, admin, auth, contenttypes, sessions, social_django
Running migrations:
  Applying contenttypes.0001_initial... OK
  Applying auth.0001_initial... OK
  Applying OmniDB_app.0001_3_0_0... OK
  Applying admin.0001_initial... OK
  Applying admin.0002_logentry_remove_auto_add... OK
  Applying admin.0003_logentry_add_action_flag_choices... OK
  Applying contenttypes.0002_remove_content_type_name... OK
  Applying auth.0002_alter_permission_name_max_length... OK
  Applying auth.0003_alter_user_email_max_length... OK
  Applying auth.0004_alter_user_username_opts... OK
  Applying auth.0005_alter_user_last_login_null... OK
  Applying auth.0006_require_contenttypes_0002... OK
  Applying auth.0007_alter_validators_add_error_messages... OK
  Applying auth.0008_alter_user_username_max_length... OK
  Applying auth.0009_alter_user_last_name_max_length... OK
  Applying auth.0010_alter_group_name_max_length... OK
  Applying auth.0011_update_proxy_permissions... OK
  Applying sessions.0001_initial... OK
  Applying social_django.0001_initial... OK
  Applying social_django.0002_add_related_name... OK
  Applying social_django.0003_alter_email_max_length... OK
  Applying social_django.0004_auto_20160423_0400... OK
  Applying social_django.0005_auto_20160727_2333... OK
  Applying social_django.0006_partial... OK
  Applying social_django.0007_code_timestamp... OK
  Applying social_django.0008_partial_timestamp... OK
  Applying social_django.0009_auto_20191118_0520... OK
  Applying social_django.0010_uid_db_index... OK
Checking port availability...
[Errno 98] Address already in use
Port 8000 is busy, trying another port...
Starting server OmniDB 3.0.0b at 127.0.0.1:28874.
Open OmniDB in your favorite browser
Press Ctrl+C to exit
```

OmniDB 2 stored its data in `SQLite` database file located by default in
`~/.omnidb/omnidb-server/omnidb.db`. If being used as a service, the file was located
in the home of the `root` user, `/root/.omnidb/omnidb-server/omnidb.db`. If users
were pointing OmniDB 2 to a custom directory, location would be: `/path/to/dir/omnidb.db`.

Migration is done simply by pointing `omnidb-server` with the appropriate parameters
to the location of the old file:

```
omnidb-server -M ~/.omnidb/omnidb-server/omnidb.db
Starting migration...
Creating user admin...
User admin already exists...
User admin already contains connections in the target database. Skip this user? (y/n) n
Delete existing connections of user admin from target database before migrating existing ones? (y/n) y
Existing connections deleted.
Attempting to create connections of user admin...
Connection with alias 'connection 1' created.
Connection with alias 'connection 2' created.
Database migration finished.
```

OmniDB 2 stored user passwords as hashes so there is no way to retrieve the old
password. The migration creates users with password `changeme`, so users will have
to adjust their passwords (or a superuser will have to do it for them).


## 4.2 Configuration File

As explained in chapter 3, OmniDB 3 uses the file `config.py` to retrieve custom
settings.

OmniDB 2, on the other hand, used a file called `omnidb.conf`, which has a different
syntax.

Users will have to manually edit the new configuration file with the appropriate
settings.
