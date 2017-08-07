OmniDB allows the conversion between all DBMSs supported by the tool. This feature was developed to be user friendly, requiring just a few steps: the user needs to select a source connection, the structures that will be converted and the target connection. The current version allows the conversion of tables with all of their structures (columns, restrictions and indexes), along with their data.

# 10.1. Data Type Compatibility

Since each DBMS possess specific data types, which often aren't shared among other technologies, or even when they are, they are found with different names, OmniDB needs to handle these inconsistencies during the conversion.

To achieve this, we utilize a simple data type mapping system. OmniDB has a list of data type categories and a list of every type of data from all technologies, each of them belonging to exactly one category. Besides, each DBMS possess a data type representing each category. With this system, it's possible to map any data type among any DBMS source-target pair, requiring only to categorize a data type and to use the correct representative.

As example, conversion between Oracle and PostgreSQL: Oracle's data type *varchar2* belongs to OmniDB's category *varchar*, and it would use PostgreSQL's representative *character varying*. Thus, every *varchar2* column found on source connection would be created in the target connection with the *character varying* type.

# 10.2. Making Conversions

To convert schemas through OmniDB's interface, the user has to access the *Conversions* window through the *Convert* link in the top screen's main menu.

![](http://www.omnidb.com.br/images_article/image_10_01.png)

This interface displays a conversion list created in a grid shape, as well as actions to update the grid and to create a new conversion. Clicking on the *New Conversion* button leads the user to the following screen:

![](http://www.omnidb.com.br/images_article/image_10_02.png)

In this interface, the user first chooses the connection of origin and then clicks on *Generate Conversion Data*, which will display a list with all the tables included in the connection and a number of checkboxes that allows him to configure what must be converted:

![](http://www.omnidb.com.br/images_article/image_10_03.png)

Once the user selects the structures chosen for conversion, they can click on *Create Conversion*, creating all the necessary configuration to realize a conversion (still, without actually initiating it).

![](http://www.omnidb.com.br/images_article/image_10_04.png)

The conversions grid now possess the record that we just created. This record has actions that allow us to manipulate and monitor the conversion. The first action leads the user to a screen that details the conversion of each table.

![](http://www.omnidb.com.br/images_article/image_10_05.png)

The columns *Drop Records*, *Create Table*, *Create Primary Key*, *Create Foreign Keys*, *Create Uniques*, *Create Indexes* and *Transfer Data* have images representing the state of conversion for each structure. The states are:

* Grey sphere: structure not converted;
* Blue sphere: structure still not converted;
* Yellow sphere: structure under conversion;
* Green sphere: structure successfully converted;
* Red sphere: error during conversion.

Besides, this interface allows the user to monitor the data transfer process for each table, displaying information such as: total record count to be converted, amount of successfully transfered records, transfer speed (in record/second), estimated transfer duration time, among others.

![](http://www.omnidb.com.br/images_article/image_10_06.png)

The second action in the conversion grid displays a text log detailing the conversion. In this log, it's possible to see the time in which it started, how did OmniDB map the data types between the DBMSs, eventual errors that might have ocurred during the conversion (detailing the commands that were utilized and which errors ocurred) and the time that the conversion finished.

![](http://www.omnidb.com.br/images_article/image_10_07.png)

The third action (green arrow) actually starts the conversion. It's important to notice that the conversion is an independent process, initiated when the user clicks this action. This process runs on background and doesn't prevent simultaneous use of OmniDB, which means that the user can navigate the tool and manipulate it without affecting the conversion.

Once initiated, the conversion will show the user a new action, allowing him to cancel the conversion.
