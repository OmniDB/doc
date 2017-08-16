# Introdução

*DBMS* significa *database management system* (sistema de gerenciamento de banco de dados - SGBD). Pode ser uma função simples, biblioteca ou mesmo um sistema maior composto por vários programas e processos executando separadamente e em paralelo, cuja função principal é gerenciar um ou vários bancos de dados hospedados em um servidor. Tem a responsabilidade de manipular e manter a consistência dos dados, permitindo que os desenvolvedores de software se concentrem em suas funcionalidades. Assim, praticamente qualquer sistema moderno que gerencia dados utiliza algum tipo de SGBD, independentemente da quantidade de informações armazenadas.

Os criadores do **OmniDB**, Rafael Thofehrn Castro e William Ivanski, trabalharam em uma empresa onde precisavam lidar com vários bancos de dados de diferentes clientes diariamente. Esses bancos de dados eram de diferentes tecnologias de SGBD, e então eles precisavam continuar alternando entre as ferramentas de gerenciamento de banco de dados (normalmente uma para cada SGBD). Como eles não tinham uma ferramenta de gerenciamento de banco de dados unificadas (que podem gerenciar diferentes SGBD), surgiram com a ideia principal do **OmniDB**.

A primeira versão da **OmniDB** foi apresentada como um projeto final de graduação no Curso de Ciência da Computação da Universidade Federal do Paraná, no Brasil. O objetivo era traçar uma linha comum entre os SGBD populares e como tratavam seus metadados. O resultado foi uma ferramenta escrita em ASP.NET/C# capaz de conectar e identificar as estruturas principais (tabelas, chaves, índices e restrições), de forma genérica, de vários SGBDs:

- Firebird
- MariaDB / MySQL
- Oracle
- PostgreSQL
- SQLite
- Microsoft SQL Server

A primeira versão do OmniDB também permitiu a conversão entre todos os SGBDs suportados pela ferramenta. Este recurso foi desenvolvido para ser amigável, exigindo apenas algumas etapas: o usuário precisa selecionar uma conexão de origem, as estruturas que seriam convertidas (apenas tabelas e todas as suas estruturas, junto com seus dados) e a conexão de destino.

Desde o início do desenvolvimento, o OmniDB foi projetado como um aplicativo Web. Consequentemente, ele é executado em qualquer navegador, a partir de qualquer sistema operacional. Pode ser acessado por vários computadores e vários usuários, cada um deles com o seu próprio grupo de conexões. Também pode ser hospedado em qualquer sistema operacional, sem a necessidade de instalar quaisquer dependências. Veremos mais detalhes sobre a instalação nos próximos capítulos.

O objetivo principal do OmniDB é oferecer um espaço de trabalho unificado com todas as funcionalidades necessárias para manipular diferentes SGBDs. As ferramentas específicas do SGBD não são necessárias: no OmniDB, alternar entre diferentes SGBDs é feito com um simples interruptor de conexão, sem sair da mesma página. O usuário final tem a  sensação de que não há diferença quando ele / ela manipula diferentes SGBDs, ele simplesmente se sente trabalhando com diferentes conexões.

Apesar disso, o OmniDB foi construído com a simplicidade em mente, projetado para ser uma aplicação web leve e veloz. OmniDB também é alimentado pelo WebSocket Technology, permitindo ao usuário executar múltiplas consultas e procedimentos em vários bancos de dados, em vários hosts, em segundo plano.

OmniDB também é seguro. Todos os dados do usuário OmniDB são armazenados criptografados e não salva a senha onde o banco de dados está armazenado. Quando o usuário se conecta pela primeira vez a um banco de dados, OmniDB solicita a senha. Esta senha é criptografada e armazenada em memória por um período específico de tempo. Quando esse prazo expirar, OmniDB pergunta novamente a senha. Isso garante a máxima segurança para o banco de dados que o OmniDB está se conectando.
