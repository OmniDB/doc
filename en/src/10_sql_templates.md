# Managing other PostgreSQL Elements

With the exception of tables, all PostgreSQL structures are possible to be
managed with the use of *SQL templates*. This gives the user more power than
using graphical forms to manipulate structures.

For example, let's consider the sequences inside the schema `public` of the
database `testdb`. To create a new sequence, right click on the *Sequences*
node, and choose *New Sequence*.

![](../img/10_sql_templates_01.png)

![](../img/10_sql_templates_02.png)

After you change the name of the sequence, you can uncomment other command
options and set them accordingly to your needs. When all the command looks fine,
you can click on the *Execute button* and the new sequence will be created:

![](../img/10_sql_templates_03.png)

With right click on an existing sequence, you can alter or drop it. It will work
the same way as the creation, by using a SQL template for the user to change.

![](../img/10_sql_templates_04.png)

![](../img/10_sql_templates_05.png)

![](../img/10_sql_templates_06.png)
