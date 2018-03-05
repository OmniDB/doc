# Postgres-BDR

[Postgres-BDR](https://www.2ndquadrant.com/en/resources/bdr/) (or just **BDR**,
for short) is an open source project from 2ndQuadrant that provides multi-master
features for PostgreSQL.

In this chapter, we will use a 2-node cluster to demonstrate Postgres-BDR 9.4.
Note that on each PostgreSQL instance, you need to configure:

```text
wal_level = 'logical'
track_commit_timestamp = on
max_worker_processes = 10   # one per database needed on provider node
                            # one per node needed on subscriber node
max_replication_slots = 10  # one per node needed on provider node
max_wal_senders = 10        # one per node needed on provider node
shared_preload_libraries = 'bdr'
```

Also make sure to adjust file `pg_hba.conf` to grant access to `replication`
between the 2 nodes.

#### Connecting to both nodes

Let's use OmniDB to connect to both PostgreSQL nodes. First of all, fill out
connection info in the connection grid:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_144.png)

Then select both connections.

#### Create required extensions

BDR requires 2 extensions to be installed on each database that should have
multi-master capabilities: `btree_gist` and `bdr`. Inside OmniDB, you can create
both extensions by right clicking on the *Extensions* node, and choosing the
action *Create Extension*. OmniDB will open a SQL template tab with the `CREATE
EXTENSION` command ready for you to make some adjustments and run:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_145.png)

You need to create both extensions `btree_gist` and `bdr` on both nodes.

#### Create the BDR group in the first node

With both extensions installed, you can refresh the root node of the OmniDB
tree view. A new *BDR* node will appear just inside your database. You can
expand this node to see some informations about BDR:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_146.png)

As you can see, BDR is not active yet. In the first node, we need to create a
*BDR group*. The other nodes will join this group later.

To create a BDR group, right click in the *BDR* node. In the SQL template,
adjust the node name and the node external connection info (the way other nodes
will use to connect to this node):

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_147.png)

After you execute the above command, right click the *BDR* node and choose
*Refresh*. You will see that now BDR is active in this node, now called `node1`.
If you expand *Nodes*, you will see that this BDR group has only 1 node:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_148.png)

#### Join the BDR group in the second node

Now let's move to the other node. You can see that BDR is installed but not
active yet. To link the two nodes, we will need to make this node join the BDR
group that was previously created in the first node:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_149.png)

And now we can see that the second node has BDR active, his name in the BDR
group is `node2`, and now the BDR group has 2 nodes:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_150.png)

#### Creating a table in the first node

Let's create a table in the first node. Expand the `public` schema, right click
the *Tables* node and choose *Create Table*. Give the new table a name and add
some columns. When done, click in the button *Save Changes*:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_151.png)

Now confirm that the table has been created in the first node by right clicking
the *Tables* node and choosing *Refresh*. Go to the second node, expand the
schema `public`, then expand the *Tables* node. Note that the table has been
replicated from `node1` to `node2`. If the table was created in the second node,
it would have been created in the first node as well, because in BDR all nodes
are masters.

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_152.png)

#### Adding some data in the second node

While you are at the second node, right click the table `bdrtest`, point to
*Data Actions* and then click in *Edit Data*. Add some rows to this table. When
finished, click in the *Save Changes* button.

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_153.png)

Now go to the first node, right click the table, point to *Data Actions* and
then click in *Query Data*. See how the rows created in `node2` were
automatically replicated into `node1`.

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_154.png)

#### Adding some data in the first node

Let's repeat the same procedure above, but instead of inserting rows from the
second node, let's insert some rows while connected to the first node. Note how
they replicate into the second node in the same way.

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_155.png)

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_156.png)
