# 4. Migrating From OmniDB 2 to 3

## 4.1 Backend Database

**IMPORTANT: Before running the migration**, make sure that OmniDB 3 already has a `config.py`
file with backend database properly configured, as explained in chapter 3.

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


## 4.2 Configuration File

As explained in chapter 3, OmniDB 3 uses the file `config.py` to retrieve custom
settings.

OmniDB 2, on the other hand, used a file called `omnidb.conf`, which has a different
syntax.

Users will have to manually edit the new configuration file with the appropriate
settings.
