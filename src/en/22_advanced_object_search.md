# Advanced Object Search

OmniDB 2.9 introduces the a data mining feature, allowing users to use an advanced pattern
matching to search database objects and tables data. The feature allows to use
the default SQL LIKE operator and also complex regular expressions.

You can access the Data Mining feature by right clicking in a specific database node
in the tree:

![](https://omnidb.org/images/screenshots/dm/dm_menu.png)

The interface allows you to filter categories, schemas and also to limit the search
space when the Data category is selected so you search for a pattern in a subset
of tables:

![](https://omnidb.org/images/screenshots/dm/dm_int1.png)

After filling the fields and running OmniDB will perform the search using several
threads that will speed up the process by running in parallel.

When the search is finished OmniDB will display the result in a tree:

![](https://omnidb.org/images/screenshots/dm/dm_int2.png)

For more details about the search in each category, right click the desired node
and select 'See More'. OmniDB will open a query tab with the SQL command used to
perform that specific search. Just run the command to get the results:

![](https://omnidb.org/images/screenshots/dm/dm_int3.png)
