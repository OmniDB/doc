# Migration from .NET / Mono to Python

OmniDB was rewritten to Python using the Django framework. Starting from version
`2.0`, OmniDB Python version will receive new features and will be actively
maintained.

The source code for the ASP.NET/C# version is in the branch `csharp`. The next
release of OmniDB C# version is 1.7, and it will only receive bug fixes.

OmniDB source code is hosted on [GitHub](https://github.com/OmniDB/OmniDB) and
there are 3 main branches:

- **master**: Contains the current beta release of OmniDB Python version
- **dev**: Contains the current development release of OmniDB Python version
- **csharp**: Contains the .NET / Mono version of OmniDB

Besides being written in Python, initial version of OmniDB 2.0 contains the
following main differences from the C# version:

- Support to HTTPS;
- It allows query execution in background and cancellation through the use of
websockets;
- There is a new Snippet feature;
- Log capabilities and a test suite are almost finished;
- Initially, only an improved support of PostgreSQL is implemented. More RDBMS
support coming soon;
- Database conversion feature was disabled by now, but it will be re-enabled
soon;
- You don't need to install dependencies and web servers any more. Everything
OmniDB needs is now bundled together.
