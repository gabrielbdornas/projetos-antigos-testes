Post title: Terminal AWS e comandos iniciais
Post author: Gabriel Braico Dornas
Post reading_time: 07 minutos
Post status: true
Post picture_url:
Post resume: Ambiente de desenvolvimento Cloud 9 do AWS e comandos básico do uso do terminal, como navegar, criar e excluir arquivos e pastas.



Post content:
Então vamos lá pessoal!

Neste tutorial, explicaremos o ambiente de desenvolvimento em nuvem AWS, além de aprendermos alguns comandos básicos no terminal.

Vamos então criar nosso login em https://aws.amazon.com/console/ e pesquisar pelo serviço Cloud9, onde será possível montar nosso ambiente de trabalho ou Enviroment. O processo de criação do ambiente deverá basicamente seguir os itens já previamente marcados, com exceção da plataforma que deve ser "Ubuntu Server 18.04 LTS".

No ambiente montado é possível ver diferentes áreas na tela à esquerda. Aqui temos nossa árvore de arquivos, onde será possível trabalhar com diferentes arquivos e pastas. Você pode pensar nessa estrutura como a exibição visual de seus arquivos e pastas em seu ambiente de desenvolvimento em nuvem.

A área principal à direita da árvore de arquivos é o editor de texto. Quando você clicar em qualquer arquivo com o qual deseja trab
alhar na sua árvore de arquivos, eles serão abertos aqui, por exemplo, este arquivo README.md. Se clicar duas vezes nele, é possível editá-lo como quiser. Depois, basta salvar as alterações. É possível visualizar o atalho para a ação de salvar o arquivo na aba "File > Save".

A área logo abaixo ao editor de texto é o nosso terminal. E é aqui que podemos executar nossos comandos. Ele é o equivalente ao terminal em máquinas Linux,  Mac ou a linha de comando no Windows. E lembre-se de que este é um ambiente Linux.

Você também pode explorar diferentes partes da tela para se familiarizar. Por exemplo, você pode expandir sua área de editor de texto, se estiver trabalhando com várias telas e precisar de mais espaço. Você também pode abrir e fechar o terminal a hora que quiser, assim como abrir e fechar qualquer arquivo quando desejar.

Para trabalhar com terminal é possível aumentar e diminuir a área arrastando a tela para cima, alterando o tamanho conforme necessidade.
Nosso principal objetivo aqui é explorar alguns comandos básicos do terminal, então veremos:

```
$ ls -- lista arquivos e pastas dentro do diretório atual
$ pwd -- impressão do diretório que estou trabalhando
$ mkdir -- criar ou novo diretório (make directory) prestando atenção na convenção teste_dir
$ cd nome_diretorio -- muda de diretório (change directory), utilizando tab como ajuda
$ cd .. -- volta para o diretório pai
$ clear -- limpa o terminal, mas posso utilizar setas para ver comandos anteriores
$ touch nome_arquivo -- criar um arquivo
$ rm nome_arquivo -- apaga arquivo
$ rmdir nome_diretorio -- remove diretórios vazios
$ rm -rf nome_diretorio -- remove diretórios com arquivos, utilizar com cuidado
$ irb -- abre o terminal para executar comandos ruby
> exit -- para fechar o terminal ruby
$ ruby nome_arquivo
```

Bem paramos por aqui e para resumir, exploramos o ambiente de desenvolvimento Cloud 9 do AWS e também aprendemos o básico do uso do terminal, como navegar, criar e excluir arquivos e pastas. Embora obviamente haja muito mais no terminal do que aquilo que abordamos, é suficiente para começar a usá-lo.

Um abraço e tudo de bom!


