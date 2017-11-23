# OmniDB Config Tool

Every installation of OmniDB also comes with a small CLI utility called *OmniDB
Config*. It will have a different file name, depending on the way you installed
OmniDB:

- If you are using a tarball or zip package, it is called **omnidb-config**, for
both server and app versions;
- If you used an installer (like the .deb file) of server version, it is called
**omnidb-config-server**;
- If you used an installer of app version, it is called **omnidb-config-app**.

Despite having different names, the utility does exactly the same. If you used
an installer, it will be put in your `$PATH`.

```bash
user@machine:~$  omnidb-config-app --help
Usage: omnidb-config-app [options]

Options:
  --version             show program\'s version number and exit
  -h, --help            show this help message and exit
  -c username password, --createsuperuser=username password
                        create super user: -c username password
  -a, --vacuum          databases maintenance
  -r, --resetdatabase   reset databases
```

## Create super user

Option `-c` allows you to create a new super user, without needing to open
OmniDB interface.

```bash
user@machine:~$ omnidb-config-app -c william password
Creating superuser...
Superuser created.
```

## Vacuum

OmniDB has two databases:

- `omnidb.db`: Stores all users and connections, and other OmniDB related stuff;
- *Sessions database*: Stores Django user sessions.

Both databases are SQLite, so it can be useful to vacuum them sometimes to
reduce file size. This can be done with the `-a` option.

```bash
user@machine:~$ omnidb-config-app -a
Vacuuming OmniDB database...
Done.
Vacuuming Sessions database...
Done.
```

## Reset database

If you wish to wipe out all OmniDB information and get a clean database as it
was just installed, you can use the `-r` option. Use it with caution!

```bash
user@machine:~$ omnidb-config-app -r
*** ATENTION *** ALL USERS DATA WILL BE LOST
Would you like to continue? (y/n) y
Cleaning users...
Done.
Cleaning sessions...
Vacuuming OmniDB database...
Done.
Vacuuming Sessions database...
Done.
```
