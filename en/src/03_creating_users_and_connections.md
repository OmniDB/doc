# Creating Users and Connections

#### Logging in as user *admin*

OmniDB comes only with the user *admin*. If you are using the server version,
the first thing to do is sign in as *admin*, the default password is *admin*.
You don't need to login in the app version.

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_003.png)

The next window is the initial window.

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_004.png)

#### Creating another user

Click on the *Users* icon on the upper right corner. It will open a popup
that allows the current OmniDB super user to create a new OmniDB user.

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_005.png)

After clicking on the *Users* icon the tool inserts a new user called *user2*
(if that is the first user after *admin*).

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_006.png)

You will have to change the *username* and *password*. Check if you want this
new user to be a *super user*. This user management window is only seem by super
users. When you are done, click on the *Save Data* button inside the popup.

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_007.png)

You can create as many users as you want, edit existing users and also delete
users by clicking on the red cross at the actions column. Now you can logout by
clicking in the *Sign Out* button in the top right corner.

#### Signing in as the new user

Let us sign in as the user we just created.

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_008.png)

And we can see the window again. Note that now there is no *Users* icon, because
the *test* user is not a super user. Go ahead and click on **Connections** on
the upper left corner. You will see a popup like this:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_009.png)

#### Creating connections

At the moment, OmniDB supports PostgreSQL, Oracle, MySQL and MariaDB. More DBMS
support is being added as you read this.

We will now create one connection to a PostgreSQL database, one connection to an
Oracle database and one connection to a MariaDB database. To create the
connections you have to click on the button *New Connection* and then choose the
connection and fill the other fields. After filling all the fields for both
connections, click on the *Save Data* button.

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_010.png)

For each connection there is an *Actions* column where you can delete, test and
select them. Go ahead and test the PostgreSQL connection.

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_011.png)

Notice a pop-up appears with the message *fe_sendauth: no password supplied*.
This is happening because OmniDB does not store the database user password on
disk. Not having any password at hand, OmniDB will try to connect without one,
thus trying to take advantage of automatic authentication methods that might be
in place: `trust` method, `.pgpass` file, and so on. As the database server
replies with an error not allowing the user to connect, then OmniDB understands
a password is required and asks it to the user. When the user types a password
in this popup, the password is encrypted and stored in memory.

After you type the password and hit *Enter*, if the connection to the database
is successful you will see a confirmation pop-up.

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_012.png)

But, if you have trouble of any kind connecting to your PostgreSQL database,
the same popup will remain showing the error OmniDB got.

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_013.png)

For Oracle, the behavior is similar. When OmniDB first tries to connect to an
Oracle database without a password, you will see a message like this:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_115.png)

If you have any trouble connection to your Oracle database, the same popup will
remain showing the error OmniDB got:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_116.png)

MariaDB and MySQL databases also works in the same way. First time, no password
was given:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_184.png)

But if you have any problems, such as database server down:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_185.png)

Finally, in the connections grid, if you click on the *Select Connection*
action, OmniDB will open it in a new **Connection Outer Tab** as we can see in
the next chapter.

#### Using SSH tunnels

Starting from 2.8, OmniDB allows the user to connect to any remote database
through SSH tunnels. The user needs to fill SSH tunnel information in each
connection in the *Connections Grid*.

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_186.png)

- *SSH Server*: The server you are connecting to via SSH;
- *SSH Port*: The port of the SSH server (default is 22, but it can be any port
number);
- *SSH User*: The operating system user name you use to connect to the SSH
server;
- *SSH Password*: The password of the operating system user. If you fill the
field *SSH Key*, then this is optional;
- *SSH Key*: The contents of the local private SSH key you can use to connect to
the SSH server. If you fill this field, then you can also fill the field *SSH
Password*, but in this case it will be the password for the SSH private key.

Please note that all information is stored encrypted in your local OmniDB *User
Database*.

While using SSH tunnels, you also need to fill all database fields accordingly.
But instead of being relative to the OmniDB server, they will be relative to the
SSH Server. This can be done in 2 scenarios as explained below.

If the database is inside the same server as you are connecting to via SSH, then
you will have a situation like this:

![](https://raw.githubusercontent.com/OmniDB/doc/master/misc/ssh_tunnels_1.png)

In this scenario, the database *Server* will be `127.0.0.1`, as the database is
in the same machine as the *SSH Server*.

But the database can be outside the SSH server, like this:

![](https://raw.githubusercontent.com/OmniDB/doc/master/misc/ssh_tunnels_2.png)

Here the database *Server* needs to be `192.168.0.10`, as it is the relative
address for the SSH server to connect to the database server.
