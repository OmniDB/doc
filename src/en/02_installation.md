# 2. Installation

OmniDB provides 2 kinds of packages to fit every user needs:

- **OmniDB Application**: Runs a web server on a random port, and provides a simplified
web browser window to use OmniDB interface without any additional setup. Just feels
like a desktop application.
- **OmniDB Server**: Runs a web server on a port specified by the user. User needs
to connect to it through a web browser. Provides user management, ideal to be hosted
on a server on users' networks.

Both application and server can be installed on the same machine.

- Linux 64 bits
    - DEB installer
    - RPM installer
    - tar.gz package
- Windows 64 bits
    - EXE installer
- Mac OSX
    - DMG installer

Use the specific installer for your Operating System and it will be available
through your desktop environment application menu or via command line with
`omnidb-app` or `omnidb-server`.

On Linux, OmniDB Server installer will also create a service that allows you start
and stop OmniDB.

You can also download the `tar.gz` package and extract it at your preferred location.
You can then start OmniDB by running the extracted binary.

## 2.1. OmniDB Server

Here is an example of execution of `omnidb-server`:

```bash
user@machine:~$ omnidb-server
Starting OmniDB server...
Running database migrations...
Operations to perform:
  Apply all migrations: OmniDB_app, admin, auth, contenttypes, sessions, social_django
Running migrations:
  No migrations to apply.
Checking port availability...
Starting server OmniDB 3.0.0b at 127.0.0.1:8000.
Open OmniDB in your favorite browser
Press Ctrl+C to exit
```

Note how OmniDB starts a *web server* in port 8000. You can also specify port
and listening address:

```bash
user@machine:~$ omnidb-server -p 8080 -H 0.0.0.0
Starting OmniDB server...
Running database migrations...
Operations to perform:
  Apply all migrations: OmniDB_app, admin, auth, contenttypes, sessions, social_django
Running migrations:
  No migrations to apply.
Checking port availability...
Starting server OmniDB 3.0.0b at 0.0.0.0:8080.
Open OmniDB in your favorite browser
Press Ctrl+C to exit
```

OmniDB will be accessible through any browser using the address displayed in the startup
message.

More details about `omnidb-server` can be found in Chapter 3 of this documentation.

## 2.2. OmniDB with Oracle

OmniDB app and server does not require any piece of additional software, as
explained above. But if you are going to connect to an *Oracle* database, then
you need to download and install *Oracle Instant Client* (or extract it to a
specific folder, depending on the operating system you use):

- **MacOSX**: Download Oracle Instant Client
([64-bit](http://www.oracle.com/technetwork/topics/intel-macsoft-096467.html))
and extract in `~/lib`;
- **Linux**: Download Oracle Instant Client
([32-bit](http://www.oracle.com/technetwork/topics/linuxsoft-082809.html))
([64-bit](http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html))
and install it on your system, then set `LD_LIBRARY_PATH`;
- **Windows**: Download Oracle Instant Client
([32-bit](http://www.oracle.com/technetwork/topics/winsoft-085727.html))
([64-bit](http://www.oracle.com/technetwork/topics/winx64soft-089540.html)) and
extract it into OmniDB's folder.

**Note for Windows users using OmniDB app**: For OmniDB 2.8 and above, you will
need to extract Oracle Instant Client libraries inside of folder
`OMNIDBAPPINSTALLFOLDER\resources\app\omnidb-server`.
