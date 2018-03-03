# OmniDB Average Execution Time of PostgreSQL Webmethods

## 1. Introduction

Being a web application, OmniDB is composed of many *webmethods*. A webmethod is
a special kind of function hosted on the server side (the web server), called
from the client side (the web browser), when the user performs some action on
OmniDB web interface. For instance, OmniDB has several webmethods that know how
to communicate with all supported versions of PostgreSQL. This set of webmethods
is called **PostgreSQL webmethods of OmniDB**.

We automated the execution of all PostgreSQL webmethods through *Django unit
tests feature*. For each supported version of PostgreSQL (from 9.2 to 9.6 and
also 10), there are 56 unit tests that simulate common user behavior. The
database used for the tests is a well known PostgreSQL sample called
[*dellstore2*](https://www.postgresql.org/ftp/projects/pgFoundry/dbsamples/dellstore2/).

Using *vagrant*, we also automated the creation of virtual machines,
installation of PostgreSQL inside the VM, and the creation of dellstore2
database.

## 2. Simulating tests in your machine

If you want, you can simulate these tests following the steps below, or you can
just skip to section 3 to see average execution time of tests.

### 2.1. Pull OmniDB repo

First thing you need to do is to download OmniDB
[repo from GitHub](https://github.com/OmniDB/OmniDB). Run the following:

```bash
git clone https://github.com/OmniDB/OmniDB
cd OmniDB
```

### 2.2. Create a virtual machine with PostgreSQL and dellstore2 sample database

On your host machine, you need to have installed:

- VirtualBox
- Vagrant
- Vagrant plugin *vbguest*

Please refer to [VirtualBox](https://www.virtualbox.org/) and
[Vagrant](https://www.vagrantup.com/) websites for more information.

Now on your terminal, assuming you are on the root directory of OmniDB repo, to
create a virtual machine with PostgreSQL 10, for example, you need to do:

```bash
cd OmniDB/OmniDB_app/tests/vagrant/postgresql-10
vagrant up
```

PostgreSQL will be listening on port 5432 of the virtual machine. But the above
script also maps this port into port 5410 of your host machine. Version 9.6 is
mapped into port 5496 of the host machine, version 9.5 is mapped into port 5495,
and so on.

Above script also creates user `omnidb` with password `omnidb`, and an empty
database called `omnidb_tests`. If you want to tweak this and other settings,
please refer to file `OmniDB/OmniDB_app/tests/vagrant/postgresql-10/bootstrap.sh`.

After the machine is created and up, and PostgreSQL is running, you can restore
*dellstore2** inside of `omnidb_tests` database:

```bash
./restore.sh
```

Now you can shutdown your machine anytime with:

```bash
vagrant halt
```

And to start it up again, just do:

```bash
vagrant up
```

Please note that you don't need to run `./restore.sh` again, because the
database `omnidb_tests` is already filled.

### 2.3. Run unit tests for a specific version of PostgreSQL

On your terminal, assuming you are on the root of the OmniDB repo and the above
machine is up, do the following:

```bash
cd OmniDB
python manage.py test OmniDB_app.tests.test_postgresql10
```

The output will be like this:

```text
Creating test database for alias 'default'...
System check identified no issues (0 silenced).
........................................................
----------------------------------------------------------------------
Ran 56 tests in 2.215s

OK
Destroying test database for alias 'default'...
```

Meaning that all 56 unit tests for PostgreSQL 10 have passed, and the **total
execution time was 2.215 seconds**.

You can run similar tests for other versions of PostgreSQL, just repeating steps
2 and 3 changing the directory like this:

| Version | Path |
|:---:|:---:|
| 9.2 | OmniDB/OmniDB_app/tests/vagrant/postgresql-92 |
| 9.3 | OmniDB/OmniDB_app/tests/vagrant/postgresql-93 |
| 9.4 | OmniDB/OmniDB_app/tests/vagrant/postgresql-94 |
| 9.5 | OmniDB/OmniDB_app/tests/vagrant/postgresql-95 |
| 9.6 | OmniDB/OmniDB_app/tests/vagrant/postgresql-96 |
| 10 | OmniDB/OmniDB_app/tests/vagrant/postgresql-10 |

## 3. Results

Following the steps presented in section 2 and 3 of this blog post, we ran each
test 3 times. All tests always have passed and we wrote down execution times
like the table below.

Bear in mind that every time we run a test for a specific version, there are 56
unit tests being executed. Each unit test executes an OmniDB webmethod. As we
are running 6 versions of PostgreSQL (from 9.2 to 10), we are in fact running
336 unit tests total.

| Version | Number of webmethods | 1st run | 2nd run | 3rd run | Average for all webmethods | Average for a single webmethod |
|:---:|:---:|---:|---:|---:|---:|---:|
| 9.2   |  56 |  2.083s |  2.054s |  2.040s |  2.059s | 0.037s |
| 9.3   |  56 |  2.099s |  2.123s |  2.071s |  2.098s | 0.037s |
| 9.4   |  56 |  2.172s |  2.132s |  2.105s |  2.136s | 0.038s |
| 9.5   |  56 |  2.218s |  2.087s |  2.106s |  2.137s | 0.038s |
| 9.6   |  56 |  2.222s |  2.060s |  2.065s |  2.116s | 0.038s |
| 10    |  56 |  2.215s |  2.118s |  2.080s |  2.138s | 0.038s |
| Total | 336 | 13.009s | 12.574s | 12.465s | 12.683s | 0.038s |

So, average runtime of OmniDB webmethods that handle PostgreSQL elements (when
PostgreSQL hosted inside a virtual machine) is **0.038 seconds**.