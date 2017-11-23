# 2. Installation

OmniDB provides 2 kinds of packages to fit every user needs:

- **OmniDB Application**: Runs a web server on a random port behind, and
provides a simplified web server window to use OmniDB interface without any
additional setup. Just feels like a desktop application.
- **OmniDB Server**: Runs a web server on a random port. User needs to connect
to it through a web browser. Provides user management, ideal to be hosted on a
server on users' networks.

Both application and server can be installed on the same machine.

## OmniDB Application

In order to run OmniDB app, you don't need to install any additional piece of
software. Just head to [omnidb.org](omnidb.org) and download the latest package
for your specific operating system and architecture:

- Linux 32 bits / 64 bits
    - DEB installer
    - RPM installer
- Windows 32 bits / 64 bits
    - EXE installer
- Mac OSX
    - DMG installer

Use the specific installer for your Operational System and it will be available
through your desktop environment application menu or via command line with `omnidb-app`.

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_001.png)


## OmniDB Server

Like OmniDB app, OmniDB server doesn't require any additional piece of software
and the same options for operating system and architecture are provided.

Use the specific installer for your Operational System and it will be available
through your desktop environment application menu or command line with `omnidb-server`.

You will need administrator privileges:

```bash
user@machine:~$ sudo omnidb-server
Starting OmniDB websocket...
Checking port availability...
Starting websocket server at port 25482.
Starting OmniDB server...
Checking port availability...
Starting server OmniDB 2.0.3 at http://localhost:8000.
Open OmniDB in your favorite browser
Press Ctrl+C to exit
```

Note how OmniDB starts a *websocket server* in a random port (in the above
example it started in port 25482) and a *web server* in port 8000. You can also
specify websocket server port, web server port and listening address:

```bash
user@machine:~$ sudo omnidb-server -p 8080 -w 2000 -H 127.0.0.1
Starting OmniDB websocket...
Checking port availability...
Starting websocket server at port 2000.
Starting OmniDB server...
Checking port availability...
Starting server OmniDB 2.0.3 at http://localhost:8080.
Open OmniDB in your favorite browser
Press Ctrl+C to exit
```

Starting on version 2.1.0, OmniDB-Server comes with a configuration file `omnidb.conf`
that enables the user to specify parameters such as port and listening address. Also,
2.1.0 enables us to start the server with SSL, this requires a certificate and is
configured in the same configuration file.

Now that the web server is running, you may access OmniDB browser-based app on
your favorite browser. Type in address bar: `localhost:8000` and hit `Enter`. If
everything went fine, you shall see a page like this:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_002.png)

Now you know that OmniDB is running correctly. In the next chapters, we will see
how to login for the first time, how to create an user and to utilize OmniDB.
