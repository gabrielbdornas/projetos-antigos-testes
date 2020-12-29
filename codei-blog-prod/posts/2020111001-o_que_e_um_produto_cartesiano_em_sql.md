Post name: O que é um produto cartesiano em SQL
Post author: Gabriel Braico Dornas
Post reading time: 07 minutos
Post status: false
Post resume: De maneira simples e direta, produto cartesiano em SQL é combinar todas as linhas de duas ou mais tabelas, não sendo para tanto necessário relacionamento entre estas tabelas.



Post content:
Hoje me deparei com um erro ao tentar realizar um JOIN entre duas tabelas em um banco de dados SQL. Bem, ao examinar a questão reparei que os registros estavam, não sabia até então por qual motivo, sendo duplicados. Foi quando me lembrei de sempre ouvir falar em "produtos cartesianos". Seria este meu erro. Após breve pesquisa percebi que diretamente não, mas os conceitos aprendidos me ajudaram a resolver a questão e, sendo assim, *bora* compartilhar.

De maneira simples e direta, produto cartesiano em SQL é combinar todas as linhas de duas ou mais tabelas, não sendo para tanto necessário relacionamento entre estas tabelas.
A combinação entre a tabela "usuarios" com 3 registros e uma tabela "produtos" com 3 registros retorná 9 linhas (não parece tão assustador, mas pense em tabelas maiores, digamos 10.000 registros, pode ficar enorme já que o número de registros obtidos será a multiplicação dos registros das tabelas envolvidas no JOIN). Vamos colocar este exemplo em prática utilizando PostgreSQL e https://sqliteonline.com/.

1- Vamos criar a tabela de usuários e 3 registros através dos comandos:

```sql
CREATE TABLE usuarios(
  usuario_id INTEGER PRIMARY KEY,
  nome VARCHAR(15) NOT NULL);

INSERT INTO usuarios (usuario_id, nome) VALUES(1, 'João');
INSERT INTO usuarios (usuario_id, nome) VALUES(2, 'Maria');
INSERT INTO usuarios (usuario_id, nome) VALUES(3, 'Pedro');
```
Caso deseje conferir o resultado:

```sql
SELECT * FROM usuários -- retornará a tabela usuários com suas duas colunas e 3 registros

SELECT COUNT(*) from usuarios -- contará os três registros criados na tabela usuários
```

2- Vamos criar a tabela de pedidos e 3 registros através dos comandos:

```sql
CREATE TABLE pedidos(
  pedido_id INTEGER PRIMARY KEY,
  produto VARCHAR(15) NOT NULL);

INSERT INTO pedidos (pedido_id, produto) VALUES(1, 'celular');
INSERT INTO pedidos (pedido_id, produto) VALUES(2, 'bateria');
INSERT INTO pedidos (pedido_id, produto) VALUES(3, 'tablet');
```
Caso deseje conferir o resultado:

```sql
SELECT * FROM pedidos -- retornará a tabela pedidos com suas duas colunas e 3 registros

SELECT COUNT(*) from pedidos -- contará os três registros criados na tabela pedidos
```

3- Gerar um produto cartesiano que combine todos os usuarios com todos pedidos, através de um select simples e um CROSS JOIN:

```sql
SELECT u.nome, p.produto
FROM usuarios u
CROSS JOIN pedidos p
```

Ou simplesmente *chame* as duas tabelas na clausula FROM:

```sql
SELECT u.nome, p.produto
FROM usuarios u, pedidos p
```

Caso queira também é possível definir algum critério na consulta:

```sql
SELECT u.nome, p.produto
FROM usuarios u, pedidos p
where p.produto = 'tablet'
```

Como é possível perceber, não existe entre as tabelas do exemplo nenhuma ligação (chave primária / chave estrangeira). Caso esta ligação exista e o JOIN for feito corretamente o produto cartesiano desaparecerá. E a cereja do bolo: chave primária e chave estrangeira devem ter o mesmo tipo de dado, e foi este o meu erro. Ao tentar fazer o JOIN não havia percebido que o campo na primeira tabela tinha *string* como tipo de dado e *integer* na segunda. Voltando ao nosso exemplo, se criarmos, de maneira errônea, na tabela pedidos uma chave estrangeira do tipo *CHAR* para receber o usuário dono daquele pedido teríamos:

```sql
ALTER TABLE pedidos
ADD usuario_id CHAR(1);

UPDATE pedidos
SET usuario_id = '3'
WHERE produto = 'celular';

UPDATE pedidos
SET usuario_id = '2'
WHERE produto = 'tablet';

UPDATE pedidos
SET usuario_id = '1'
WHERE produto = 'bateria';
```

Ao rodarmos a consulta abaixo, executando o JOIN, receberíamo uma mensagem de erro informando que os campos das duas tabelas deverão ter o mesmo tipo de dado.

```sql
SELECT p.pedido_id, p.produto, u.nome FROM usuarios u
JOIN pedidos p
on u.usuario_id = p.usuario_id
```

<incluir figura>

Como corrigir? Criar a nova coluna com o mesmo tipo de dado:

```sql
ALTER TABLE pedidos
DROP COLUMN usuario_id;

ALTER TABLE pedidos
add usuario_id integer;

UPDATE pedidos
SET usuario_id = 3
WHERE produto = 'celular';

UPDATE pedidos
SET usuario_id = 2
WHERE produto = 'tablet';

UPDATE pedidos
SET usuario_id = 1
WHERE produto = 'bateria';
```

Agora te pergunto: será que este comportamente, ou este erro, ocorrerá em outros SGBDS, como MySql ou MariaDb? A resposta poderá te surpreender, como prática sugiro que você mesmo descubra!!!!


Um forte abraço e tudo de bom!

Testando!!!!
