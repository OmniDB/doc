# Advanced Object Search

OmniDB 2.9 introduces the a Advanced Object Search feature, allowing users to
use an advanced pattern matching to search database objects and tables data. The
feature allows to use the default SQL LIKE operator and also complex regular
expressions.

You can access the Advanced Object Search feature by right clicking in a specific
database node in the tree:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_196.png)

The interface allows you to filter categories of objects, schemas where
searchs will be executed and also to limit the search space when the Data
category is selected, so you search for a pattern in a subset of tables:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_197.png)

After filling the fields and running OmniDB will perform the search using several
threads that will speed up the process by running in parallel (It is customizable.
For more info, see chapter 19 - Deploying OmniDB).

When the search is finished OmniDB will display the result in a tree:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_198.png)

For more details about the search in each category, right click the desired node
and select 'See More'. OmniDB will open a query tab with the SQL command used to
perform that specific search. Just run the command to get the results:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_199.png)
![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_200.png)
