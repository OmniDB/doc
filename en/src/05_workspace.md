# Workspace

After creating at least one connection the user can enter the *Workspace*,
either by clicking the *Workspace* tab or by clicking in the *Select Connection*
action in the connections grid.

![](../img/05_workspace_01.png)

## Sections of the *Workspace* window

This interface has several elements:

![](../img/05_workspace_02.png)

- **1) Links**: Enables the user to navigate between OmniDB windows
- **2) Outer Tabs**: OmniDB lets you work with several databases at the same
time. Each database will be accessible through an *outer tab*. Outer tabs also
can host miscellaneous features, like the *Snippets* feature
- **3) Options**: Shows the current user logged in, and also links for *user
settings*, *query history*, *information* and *logout*.

## Connection Outer Tab

So, the outer table named *Test* has this name because of the alias we put in
the connection to the `testdb`. This tab is a *Connection Outer Tab*. Notice the
little tab with a cross besides the *Test* outer tab. This allows you to create
a new outer tab that will automatically be a *Connection Outer Tab*. However,
the *Snippet Outer Tab* is fixed and will always be the first.

A new *Connection Outer Tab* will always automatically point to the first
connection on your list of database connections. Or, if you clicked on the
*Select Connection* action, it will point to the selected connection. Observe
the elements inside of this tab:

![](../img/05_workspace_04.png)

- **1) Connection Selector**: Shows all connections and lets the user select the
current one
- **2) Tree of Structures**: Displays a hierarchical tree where you can navigate
through the database elements
- **3) Inner Tabs**: Allows the user to execute actions in the current database.
There are several kinds of inner tabs for the current database. By clicking on
the last small tab with a cross, you can add a new tab. A new tab always will be
a *Query Tab*, where you can write any kind of SQL statement
- **4) Inner Tab Content**: Can vary depending on the kind of inner tab. The
figure shows a *Query Tab* and in this case the content will be an *SQL
Editor*, with syntax highlight and autocomplete
- **5) Inner Tab Actions**: Can vary depending on the kind of inner tab. For a
*Query Tab*, they are *Execute Button*, *Format Button* and *Editor Mode*
(script, execute or query)
- **6) Inner Tab Results**: A *Query Tab* in query mode, after you click in the
*Execute Button* or type the execute shortcut (`Alt-Q`), will show a grid with
the query results. All modes will show error messages, if any.

## Working with databases

Take a look at your connections selector. OmniDB always points to the first
available connection but you can change it by clicking on the selector.

![](../img/05_workspace_05.png)

Select the *DellStore* connection. Now go to the tree right below the selector
and click to expand the node *Schemas*.

![](../img/05_workspace_06.png)

Bear in mind that every 10 minutes you keep without performing actions on the
database, will trigger a *Password Expired* popup. As explained before, this is
important for your database security. After you type the correct password, you
will see all schemas in your database (in case of PostgreSQL, `TOAST` and temp
schemas are not shown).

![](../img/05_workspace_07.png)

Now click to expand the schema `public`. You will see different kinds of
elements contained in this schema.

![](../img/05_workspace_08.png)

Now click to expand the node *Tables*, and you will see all tables contained in
the schema `public`. Expand any table and you will see its columns, primary key,
foreign keys, unique constraints and indexes. Each column is also expansible,
displaying data type and nullable constraint.

![](../img/05_workspace_09.png)

In order to view records inside a table, right click it and choose *Data Actions
> Query Data*.

![](../img/05_workspace_10.png)

Notice that OmniDB fills the current SQL editor with a simple query to list
table records. The records are displayed in a grid right below the editor. This
grid can be controlled with keyboard as if you were using a spreadsheet manager.
You can also copy data from single cells or block of cells (that can be selected
with the keyboard or mouse) and paste on any spreadsheet manager.

![](../img/05_workspace_11.png)

You can edit the query on the SQL editor, writing simple or more complex queries
and clicking on the action button. You can control how many records should be
displayed (10, 100, 1000 or all rows). More details in the next chapters.

## Working with multiple tabs inside the same connection

Inside a single connection, you can create several inner tabs by clicking on the
last little tab with a cross. Each new inner tab will be a *Query Tab*.

![](../img/05_workspace_12.png)

On OmniDB, you can execute several SQL statements and procedures in parallel.
When it is executing, an icon will be shown in the tab to indicate its current
state. If some process is finished and it is not in the current tab, that tab
will show a green icon indicating the routine being executed there is now
finished.

![](../img/05_workspace_13.png)

By clicking in the *Cancel button*, you can cancel a process running inside the
database.

![](../img/05_workspace_14.png)

You can also drag and drop a tab to change its order. This works with both inner
and outer tabs.

![](../img/05_workspace_15.png)

Additionally, you can use keyboard shortcuts to manage inner tabs (SQL Query)
and outer tabs (Connection):

- **Ctrl-Insert**: Insert a new inner tab
- **Ctrl-Delete**: Removes an inner tab
- **Ctrl-<**: Change focus to inner tab at left
- **Ctrl->**: Change focus to inner tab at right
- **Ctrl-Shift-Insert**: Insert a new outer tab
- **Ctrl-Shift-Delete**: Removes an outer tab
- **Ctrl-Shift-<**: Change focus to outer tab at left
- **Ctrl-Shift->**: Change focus to outer tab at right
