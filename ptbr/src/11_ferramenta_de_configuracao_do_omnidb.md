# Ferramenta de Configuração do OmniDB

Toda instalação do OmniDB também vem com um pequeno utilitário CLI chamado *OmniDB Config*. Ele terá um nome de arquivo diferente, dependendo da maneira como você instalou o OmniDB:
-	Se você estiver usando um pacote tarball ou zip, ele é chamado **omnidb-config**, para ambas versões: Server e app;
-	Se você usou um instalador (como o arquivo .deb) da versão Server, ele é chamado **Omnidb-config-server**;
-	Se você usou um instalador da versão app, ele é chamado **omnidb-config-app**.

Apesar de ter nomes diferentes, o utilitário faz exatamente o mesmo. Se você usou um instalador, ele será colocado no seu `$PATH`.

```bash
user@machine:~$  omnidb-config-app --help
Usage: omnidb-config-app [options]

Options:
  --version             show program\'s version number and exit
  -h, --help            show this help message and exit
  -c username password, --createsuperuser=username password
                        create super user: -c username password
  -a, --vacuum          databases maintenance
  -r, --resetdatabase   reset databases
```

## Criar Super Usuário

Opção `-c` permite que você crie um novo super usuário, sem precisar abrir
Interface OmniDB.

```bash
user @ machine: ~ $ omnidb-config-app -c william password
Criando o superusuário ...
Superuser criado.
```

## 	Vacuum

O OmniDB possui dois bancos de dados:
-	`omnidb.db`: armazena todos os usuários e conexões, e outros relacionados ao OmniDB
-	*Session database*: armazena sessões de usuário do Django.

Ambos os bancos de dados são SQLite, por isso pode ser útil otimizá-los às vezes para reduzir o tamanho do arquivo. Isso pode ser feito com a opção `-a`.

```bash
user @ machine: ~ $ omnidb-config-app -a
Vacuuming OmniDB database ...
Done.
Vacuuming Sessions database...
Done.
```

## Redefinir o Banco de Dados

Se deseja eliminar todas as informações do OmniDB e obter um banco de dados limpo, conforme foi instalado, você pode usar a opção `-r`. Use com cuidado!

```bash
user@machine:~$ omnidb-config-app -r
*** ATENTION *** ALL USERS DATA WILL BE LOST
Would you like to continue? (y/n) y
Cleaning users...
Done.
Cleaning sessions...
Vacuuming OmniDB database...
Done.
Vacuuming Sessions database...
Done.
```
