# Postgres-XL

[Postgres-XL](https://www.2ndquadrant.com/en/resources/postgres-xl/) (or just
**XL**, for short) is an open source project from 2ndQuadrant. It is a massively
parallel database built on top of PostgreSQL, and it is designed to be
horizontally scalable and flexible enough to handle various workloads.

In this chapter, we will use a cluster with 1 GTM and 1 coordinator on the same
virtual machine, and 2 data nodes (each data node on a separate virtual machine).

| Machine | IP | Role |
|---|---|---|---|
| xl_gtmcoord | 192.168.56.105 | GTM and coordinator |
| xl_datanode1 | 192.168.56.106 | data node |
| xl_datanode2 | 192.168.56.107 | data node |

On each machine, you need to clone Postgres-XL repository and compile it. You
also need to set specific XL parameters on file `postgresql.conf` and make sure
all machines are communicating to each other by adjusting file `pg_hba.conf`.
More information on how Postgres-XL works and how to install it on
[Postgres-XL documentation](https://www.postgres-xl.org/documentation/index.html).
You can also refer to [this blog post](https://blog.2ndquadrant.com/postgres-xl-omnidb/).

#### Preparing the nodes

After you have XL up and running on all nodes, you need to let them know about
their roles in the cluster and also about the other nodes. On the
GTM/coordinator node, run the following as `postgres` user:

```sql
ALTER NODE coord1 WITH (TYPE = 'coordinator', HOST = 'localhost', PORT = 5432);
CREATE NODE datanode_1 WITH (TYPE = 'datanode', HOST = '192.168.56.106', PORT = 5432);
CREATE NODE datanode_2 WITH (TYPE = 'datanode', HOST = '192.168.56.107', PORT = 5432);
SELECT pgxc_pool_reload();
```

On the first data node, run:

```sql
ALTER NODE datanode_1 WITH (TYPE = 'datanode', HOST = 'localhost', PORT = 5432);
CREATE NODE coord1 WITH (TYPE = 'coordinator', HOST = '192.168.56.105', PORT = 5432);
CREATE NODE datanode_2 WITH (TYPE = 'datanode', HOST = '192.168.56.107', PORT = 5432);
SELECT pgxc_pool_reload();
```

On the second data node, run:

```sql
ALTER NODE datanode_2 WITH (TYPE = 'datanode', HOST = 'localhost', PORT = 5432);
CREATE NODE coord1 WITH (TYPE = 'coordinator', HOST = '192.168.56.105', PORT = 5432);
CREATE NODE datanode_1 WITH (TYPE = 'datanode', HOST = '192.168.56.106', PORT = 5432);
SELECT pgxc_pool_reload();
```

Finally, on the GTM/coordinator, change password of user `postgres` and create a
database:

```sql
ALTER USER postgres WITH PASSWORD 'omnidb';
CREATE DATABASE omnidb_tests;
```

#### Connecting to the cluster

Let's use OmniDB to connect to the coordinator node. First of all, fill out
connection info in the connection grid:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_157.png)

Then select the connection. You will see OmniDB workspace window. Expand the
tree root node. Note that OmniDB identifies it is connected to a Postgres-XL
cluster and shows a specific node called *Postgres-XL* just inside the tree root
node. Expand this node to see all the nodes we have in our cluster:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_158.png)

#### Creating a HASH table

From the root node, expand *Schemas*, then *public*, then right click on the
*Tables* node. Click on *Create Table*. Name your new table, add some columns to
it and do not forget to add a primary key too:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_159.png)

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_160.png)

When done, click on the *Save Changes* button. Now right click on the *Tables*
node and click on *Refresh*. You will see the new table created. Expand it to
see that there is also a *Postgres-XL* node inside of it. Check its properties.

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_161.png)

By default, Postgres-XL always try to create a table distributed by HASH. It
means that the data will be split into the nodes regularly, through a hash
function applied on the specified column. If present, it will use the primary
key, or a unique constraint otherwise. If there is no primary key nor unique
constraint, Postgres-XL uses the first eligible column. If not possible to
distribute by HASH, then Postgres-XL will create the table distributed by
ROUNDROBIN, which means that the data will be split in a way that every new
row will be added to a different data node.

Now let's add some rows in our new table. Right click on the table, then go to
*Data Actions* and then click on *Edit Data*. Add some rows and then click on
the *Save Changes* button:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_162.png)

Right click on the table again, *Data Actions*, *Query Data*. You will see that
cluster-wide the table has all data inside.

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_163.png)

But how the data was distributed in the data nodes? In the *Postgres-XL* main
node, right click on each node and click on *Execute Direct*. Adjust the query
that will be executed directly into the data node, as you can see below.

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_164.png)

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_165.png)

#### Creating a REPLICATION table

While HASH distribution is great for write-only and write-mainly tables,
REPLICATION distribution is great for read-only and read-mainly tables. However,
a table distributed by REPLICATION will store all data in all nodes it is
located.

In order to create a REPLICATION table, let us create a new table like we did
before:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_166.png)

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_167.png)

Note how by default it was created as a HASH table:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_168.png)

Let us change the distribution type of the table by right-clicking on the
*Postgres-XL* node inside the table, and then clicking on *Alter Distribution*.
Uncomment the "REPLICATION" line and execute the command:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_169.png)

You can check the distribution was successfully changed by right-clicking on the
*Postgres-XL* node and clicking on *Refresh*. The properties will now show
*Distributed by: replication*.

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_170.png)

Now add some data to the table:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_171.png)

And then check that all data exist on all data nodes:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_172.png)

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_173.png)
