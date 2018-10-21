# Writing SQL Queries

The tool comes with a tab system where each tab contains a SQL editor, an action
button, an indent button, a field to select the type of command and a space to
display the result.

The SQL editor has a feature that helps a lot when creating new queries: SQL
code completion. With this feature it is possible to autocomplete columns
contained in a table referenced by an alias. To open the autocomplete interface
you just have to type the alias and then hit `Ctrl-Space`:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_049.png)

Besides autocompleting table columns the editor also searches for columns
contained in subqueries:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_050.png)

If the query raises an error, OmniDB will show the error message in the *Data*
tab and the cursor will be placed in the position indicated by the error
message:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_051.png)

When the query is successful, OmniDB shows the number of records returned by the
query, the start time and the duration of the query. The *Data* tab will show
a data grid with the records records returned by the query.

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_052.png)

Just like in the record editing interface each cell can be visualized separately
by right clicking it.

If you click on the *Indent SQL* button, OmniDB will reorganize the SQL text to
make it prettier:

![](https://raw.githubusercontent.com/OmniDB/doc/master/img/image_053.png)
