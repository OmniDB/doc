# 4. Migrating from OmniDB 2 to 3

Migrating from 2 to 3 involves basically copying users, connections, snippets
and custom monitoring units from OmniDB 2 and then adjusting the new configuration
file.

The steps explained in this chapter are needed for those using `omnidb-server` version.
Users of `omnidb-app` use default settings and directories so migration is done
automatically.

## 4.1 Configuration File

As explained in chapter 3, OmniDB 3 uses the file `config.py` to retrieve custom
settings.

OmniDB 2, on the other hand, used a file called `omnidb.conf`, which has a different
syntax.

After installing OmniDB 3 package, when running it for the first time, a default
`config.py` file will be created in the target directory.

Users will have to manually edit the new configuration file with the appropriate
settings.

## 4.2 Backend Database

As explained in the previous chapter, OmniDB 3 can be deployed pointing to a `PostgreSQL`
database as opposed to using the default `SQLite`.

Before running the migration, make sure that OmniDB 3 already has a `config.py`
file with backend database properly configured.

Even if users decide to stick to `SQLite`, OmniDB 3 uses a completely different
database schema so migration steps are needed.

OmniDB 2 stored its data in a `SQLite` database file located by default in
`~/.omnidb/omnidb-server/omnidb.db`. If being used as a service, the file was located
in the home of the `root` user, `/root/.omnidb/omnidb-server/omnidb.db`. If users
were pointing OmniDB 2 to a custom directory with `-d`, location would be `/path/to/dir/omnidb.db`.

After installing OmniDB 3 packages, if you run OmniDB pointing to the same directory
either using `-d` or letting OmniDB use the default location, migration will be
transparent and OmniDB will automatically migrate objects:

```
omnidb-server
Copying config file to home directory.
Running database migrations...
Operations to perform:
  Apply all migrations: OmniDB_app, admin, auth, contenttypes, sessions, social_django
Running migrations:
  Applying contenttypes.0001_initial... OK
  Applying auth.0001_initial... OK
  Applying OmniDB_app.0001_3_0_0... OK
  Applying OmniDB_app.0002_3_0_1... OK
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
Attempting to migrate users, connections and monitoring units and snippets from OmniDB 2 to 3...
Creating user 'admin'...
User 'admin' already exists.
Attempting to create connections of user 'admin'...
Creating connection with alias 'conn1'...
Connection with alias 'conn1' created.
Creating connection with alias 'conn2'...
Connection with alias 'conn2' created.
Creating connection with alias 'conn3'...
Connection with alias 'conn3' created.
Attempting to create snippets of user 'admin'...
Snippet 'snippet1' created.
Folder 'folder1' created.
Snippet 'snippet2' created.
Attempting to create monitoring units of user 'admin'...
Monitoring unit 'db size custom' created.
Database migration finished.
```

If the user is pointing OmniDB to a new directory but kept the old database file,
a manual migration can be performed with parameter `-M`:

```
-M dbfile, --migratedatabase=dbfile
                    migrate users and connections from OmniDB 2 to 3: -M
                    dbfile
```

```
omnidb-server -d path/to/new/dir -M path/to/old/dir/omnidb.db
Running database migrations...
Operations to perform:
  Apply all migrations: OmniDB_app, admin, auth, contenttypes, sessions, social_django
Running migrations:
  No migrations to apply.
Target database already migrated from OmniDB 2, continue anyway? (y/n) y
Attempting to migrate users, connections and monitoring units and snippets from OmniDB 2 to 3...
Creating user 'admin'...
User 'admin' already exists.
Attempting to create connections of user 'admin'...
Creating connection with alias 'conn1'...
Connection with alias 'conn1' created.
Creating connection with alias 'conn2'...
Connection with alias 'conn2' created.
Creating connection with alias 'conn3'...
Connection with alias 'conn3' created.
Attempting to create snippets of user 'admin'...
Snippet 'snippet1' created.
Folder 'folder1' created.
Snippet 'snippet2' created.
Attempting to create monitoring units of user 'admin'...
Monitoring unit 'db size custom' created.
Database migration finished.
```

### 4.2.1 OmniDB User Passwords

OmniDB 2 stored user passwords as hashes so there is no way to retrieve the old
password. The migration creates users with password `changeme`, so users will have
to adjust their passwords (or a superuser will have to do it for them).
