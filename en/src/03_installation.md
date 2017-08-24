# Installation

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
    - Tarball
- Windows 32 bits / 64 bits
    - EXE installer
    - ZIP package
- Mac OSX
    - DMG installer
    - ZIP package

If you choose tarball or zip packages, just extract it somewhere in your
computer. Get inside the folder it creates and run the `omnidb-app` executable.
It will open OmniDB inside its own window.

With the installer you can install OmniDB in your system, and it will be
available through your desktop environment application menu. When you launch it,
OmniDB will open its own window.

![](../img/03_installation_01.png)


## OmniDB Server

Like OmniDB app, OmniDB server doesn't require any additional piece of software
and the same options for operating system and architecture are provided.

If you choose the tarball or zip package, extract it somewhere in your computer.
Get inside the uncompressed folder and run the `omnidb-server` executable.

```bash
user@machine:~$ cd omnidb-server
user@machine:~$ ./omnidb-server
Starting OmniDB websocket...
Checking port availability...
Starting websocket server at port 25482.
Starting OmniDB server...
Checking port availability...
Starting server OmniDB 2.0.3 at http://localhost:8000.
Open OmniDB in your favorite browser
Press Ctrl+C to exit
```

If you installed OmniDB server with some installer option, you will need
administrator privileges:

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
example it started in port 25482) and a *web server* in port 8000. You can even
start multiple instances of omnidb-server, and it will start using different
ports to avoid conflict. You can also specify websocket server and web server
ports:

```bash
user@machine:~$ sudo omnidb-server -p 8080 -w 2000
Starting OmniDB websocket...
Checking port availability...
Starting websocket server at port 2000.
Starting OmniDB server...
Checking port availability...
Starting server OmniDB 2.0.3 at http://localhost:8080.
Open OmniDB in your favorite browser
Press Ctrl+C to exit
```

Now that the web server is running, you may access OmniDB web app on your
favorite browser. Type in address bar: `localhost:8000` and hit `Enter`. If
everything went fine, you shall see a page like this:

![](../img/03_installation_02.png)

Now you know that OmniDB is running correctly. In the next chapters, we will see
how to login for the first time, how to create an user and to utilize OmniDB.
