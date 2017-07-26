# Introduction

*DBMS* stands for *database management system*. It may be a simple function
library or even a larger system composed by several programs and processes
running separately and in parallel, whose main function is to manage one or
several databases hosted in a server. It has the responsibility to manipulate
and to keep the consistency of data, allowing the software developers to focus
on functionalities. Thus, practically any modern system that manages data
utilizes some kind of DBMS, regardless of the amount of stored information.

**OmniDB**’s first version was created as an undergrad final project in the
Computer Science Course from the Federal University of Paraná. The objective was
to trace a common line between popular DBMS, and to study deeply their
*metadata*. The result was a tool capable of connecting and identifying the main
structures (tables, keys, indexes and constraints), in a generic way, from
several DBMS:

- Firebird
- MariaDB / MySQL
- Oracle
- PostgreSQL
- SQLite
- Microsoft SQL Server

Since early development, OmniDB was designed as an web app. Consequently, it
runs in any browser, from any operational system. It can be accessed by several
computers and multiple users, each one of them with his/her own group of
connections. It also may host any operational system, without the need of
install any dependencies. We will see further details on installation in the
next chapters.

OmniDB’s main objective is to offer an unified workspace with all
functionalities needed to manipulate different DMBS. DBMS specific tools aren’t
required: in OmniDB, the context switch between different DBMS is done with a
simple connection switch, without leaving the same page. The end-user’s
sensation is that there is no difference when he/she manipulates different DBMS,
it just feels like different connections.
