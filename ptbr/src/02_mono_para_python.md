# Migração do .NET / Mono para o Python

OmniDB foi reescrito para Python usando o framework Django. Iniciando a partir da versão `2.0`, o OmniDB versão Python receberá novos recursos e será ativamente mantido.

O código-fonte para a versão ASP.NET/C# está no branch `csharp`. O próximo lançamento do OmniDB versão C# é 1.7, e ela somente receberá correções de bugs.

O código fonte OmniDB está hospedado no [GitHub](https://github.com/OmniDB/OmniDB) e existem 3 branches principais:
- **master**: Contém a versão beta atual do OmniDB versão Python
- **dev**: Contém a versão de desenvolvimento atual do OmniDB versão Python
- **csharp**: Contém a versão .NET / Mono do OmniDB

Além de ser escrito em Python, a versão inicial do OmniDB 2.0 contém as principais diferenças a partir da versão C#:

- Suporte para HTTPS;
- Permite a execução da consulta em segundo plano e cancelamento através do uso de websockets;
-	Existe um novo recurso de Snippet;
- As capacidades de log e um conjunto de testes estão quase concluídos;
-	Inicialmente, apenas um suporte aprimorado do PostgreSQL é implementado. Suporte de outros SGBDs em breve;
-	O recurso de conversão de banco de dados foi desativado até agora, mas será reativado em breve;
-	Você não precisa mais instalar dependências e servidores web. Tudo o que o OmniDB precisa agora está empacotado.
