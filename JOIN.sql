SELECT NOME, SEXO, EMAIL /* PROJEÇÃO */
FROM CLIENTE /* ORIGEM */
WHERE SEXO = 'F'; /* SELEÇÃO */

SELECT NUMERO
FROM TELEFONE
WHERE TIPO = 'MOVEL';

/* JUNÇÃO -> JOIN */

SELECT NOME, EMAIL, IDCLIENTE
FROM CLIENTE;

SELECT ID_CLIENTE, BAIRRO, CIDADE
FROM ENDERECO;

mysql> SELECT NOME, EMAIL, IDCLIENTE
    -> FROM CLIENTE;
+--------+---------------+-----------+
| NOME   | EMAIL         | IDCLIENTE |
+--------+---------------+-----------+
| JOÃO   | JOAO@IG.COM   |         1 |
| CARLOS | CARLOS@IG.COM |         2 |
| ANA    | ANA@IG.COM    |         3 |
| CLARA  | NULL          |         4 |
| JORGE  | JORGE@IG.COM  |         5 |
| CELIA  | CELIA@IG.COM  |         6 |
+--------+---------------+-----------+
6 rows in set (0.00 sec)

mysql> SELECT ID_CLIENTE, BAIRRO, CIDADE
    -> FROM ENDERECO;
+------------+----------+----------------+
| ID_CLIENTE | BAIRRO   | CIDADE         |
+------------+----------+----------------+
|          4 | CENTRO   | BELO HORIZONTE |
|          1 | CENTRO   | BRASÍLIA       |
|          3 | CENTRO   | TAGUATINGA     |
|          2 | CENTRO   | SANTOS         |
|          6 | FLAMENGO | RIO DE JANEIRO |
+------------+----------+----------------+
5 rows in set (0.00 sec)

/* JUNTAR NOME, SEXO, BAIRRO, CIDADE DE TODOS OS CLIENTES */

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE;

mysql> SELECT NOME, SEXO, BAIRRO, CIDADE
    -> FROM CLIENTE, ENDERECO
    -> WHERE IDCLIENTE = ID_CLIENTE;
+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| CLARA  | F    | CENTRO   | BELO HORIZONTE |
| JOÃO   | M    | CENTRO   | BRASÍLIA       |
| ANA    | F    | CENTRO   | TAGUATINGA     |
| CARLOS | M    | CENTRO   | SANTOS         |
| CELIA  | F    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+
5 rows in set (0.00 sec)

/* WHERE = SELEÇÃO
FROM 
*/

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE
AND SEXO = 'F';

mysql> SELECT NOME, SEXO, BAIRRO, CIDADE
    -> FROM CLIENTE, ENDERECO
    -> WHERE IDCLIENTE = ID_CLIENTE
    -> AND SEXO = 'F';
+-------+------+----------+----------------+
| NOME  | SEXO | BAIRRO   | CIDADE         |
+-------+------+----------+----------------+
| ANA   | F    | CENTRO   | TAGUATINGA     |
| CLARA | F    | CENTRO   | BELO HORIZONTE |
| CELIA | F    | FLAMENGO | RIO DE JANEIRO |
+-------+------+----------+----------------+
3 rows in set (0.02 sec)

/* WHERE IDCLIENTE = ID_CLIENTE 
AND SEXO = 'F'; -> TABELA VERDADE. 
*/

/*
JOIN = CLÁUSULA DE JUNÇÃO 
INNER = DENTRO
INNER JOIN = JUNÇÃO DE DENTRO
*/

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE;

mysql>  SELECT NOME, SEXO, BAIRRO, CIDADE
    -> FROM CLIENTE
    -> INNER JOIN ENDERECO
    -> ON IDCLIENTE = ID_CLIENTE;
+--------+------+----------+----------------+
| NOME   | SEXO | BAIRRO   | CIDADE         |
+--------+------+----------+----------------+
| CLARA  | F    | CENTRO   | BELO HORIZONTE |
| JOÃO   | M    | CENTRO   | BRASÍLIA       |
| ANA    | F    | CENTRO   | TAGUATINGA     |
| CARLOS | M    | CENTRO   | SANTOS         |
| CELIA  | F    | FLAMENGO | RIO DE JANEIRO |
+--------+------+----------+----------------+
5 rows in set (0.00 sec)

/*FILTRANDO COM JOIN*/

SELECT NOME, SEXO, BAIRRO, CIDADE
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE
WHERE SEXO = 'F';

mysql> SELECT NOME, SEXO, BAIRRO, CIDADE
    -> FROM CLIENTE
    -> INNER JOIN ENDERECO
    -> ON IDCLIENTE = ID_CLIENTE
    -> WHERE SEXO = 'F';
+-------+------+----------+----------------+
| NOME  | SEXO | BAIRRO   | CIDADE         |
+-------+------+----------+----------------+
| ANA   | F    | CENTRO   | TAGUATINGA     |
| CLARA | F    | CENTRO   | BELO HORIZONTE |
| CELIA | F    | FLAMENGO | RIO DE JANEIRO |
+-------+------+----------+----------------+
3 rows in set (0.00 sec)

SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJEÇÃO */
FROM CLIENTE /* ORIGEM */
	INNER JOIN ENDERECO /* JUNÇÃO */
	ON IDCLIENTE = ID_CLIENTE 
WHERE BAIRRO = 'CENTRO'; /* SELEÇÃO */

mysql> SELECT NOME, SEXO, BAIRRO, CIDADE
    -> FROM CLIENTE
    -> INNER JOIN ENDERECO
    -> ON IDCLIENTE = ID_CLIENTE
    -> WHERE BAIRRO = 'CENTRO';
+--------+------+--------+----------------+
| NOME   | SEXO | BAIRRO | CIDADE         |
+--------+------+--------+----------------+
| CLARA  | F    | CENTRO | BELO HORIZONTE |
| JOÃO   | M    | CENTRO | BRASÍLIA       |
| ANA    | F    | CENTRO | TAGUATINGA     |
| CARLOS | M    | CENTRO | SANTOS         |
+--------+------+--------+----------------+
4 rows in set (0.00 sec)

/*PROJETE A TABELA TELEFONE COM NOME, EMAIL E SEXO */

SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
FROM TELEFONE
	INNER JOIN CLIENTE
	ON IDCLIENTE = ID_CLIENTE;

mysql> SELECT NOME, SEXO, EMAIL, TIPO, NUMERO
    -> FROM TELEFONE
    -> INNER JOIN CLIENTE
    -> ON IDCLIENTE = ID_CLIENTE;
+--------+------+---------------+-----------+------------+
| NOME   | SEXO | EMAIL         | TIPO      | NUMERO     |
+--------+------+---------------+-----------+------------+
| JOÃO   | M    | JOAO@IG.COM   | MOVEL     | 91259-7689 |
| JOÃO   | M    | JOAO@IG.COM   | COMERCIAL | 2011-3668  |
| JOÃO   | M    | JOAO@IG.COM   | MOVEL     | 2023-1156  |
| CARLOS | M    | CARLOS@IG.COM | MOVEL     | 99645-1468 |
| CARLOS | M    | CARLOS@IG.COM | COMERCIAL | 3399-6489  |
| ANA    | F    | ANA@IG.COM    | FIXO      | 95639-7799 |
| ANA    | F    | ANA@IG.COM    | FIXO      | 3373-2597  |
| CLARA  | F    | NULL          | FIXO      | 99469-7129 |
| JORGE  | M    | JORGE@IG.COM  | COMERCIAL | 3369-6879  |
| JORGE  | M    | JORGE@IG.COM  | FIXO      | 96381-7654 |
| CELIA  | F    | CELIA@IG.COM  | COMERCIAL | 3351-9632  |
+--------+------+---------------+-----------+------------+
11 rows in set (0.00 sec)

/*NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO*/

SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE
	INNER JOIN ENDERECO
	ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
	INNER JOIN TELEFONE
	ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

mysql> SELECT CLIENTE.NOME, CLIENTE.SEXO, ENDERECO.BAIRRO, ENDERECO.CIDADE, TELEFONE.TIPO, TELEFONE.NUMERO
    -> FROM CLIENTE
    -> INNER JOIN ENDERECO
    -> ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
    -> INNER JOIN TELEFONE
    -> ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;
+--------+------+----------+----------------+-----------+------------+
| NOME   | SEXO | BAIRRO   | CIDADE         | TIPO      | NUMERO     |
+--------+------+----------+----------------+-----------+------------+
| CLARA  | F    | CENTRO   | BELO HORIZONTE | FIXO      | 99469-7129 |
| JOÃO   | M    | CENTRO   | BRASÍLIA       | MOVEL     | 91259-7689 |
| JOÃO   | M    | CENTRO   | BRASÍLIA       | COMERCIAL | 2011-3668  |
| JOÃO   | M    | CENTRO   | BRASÍLIA       | MOVEL     | 2023-1156  |
| ANA    | F    | CENTRO   | TAGUATINGA     | FIXO      | 95639-7799 |
| ANA    | F    | CENTRO   | TAGUATINGA     | FIXO      | 3373-2597  |
| CARLOS | M    | CENTRO   | SANTOS         | MOVEL     | 99645-1468 |
| CARLOS | M    | CENTRO   | SANTOS         | COMERCIAL | 3399-6489  |
| CELIA  | F    | FLAMENGO | RIO DE JANEIRO | COMERCIAL | 3351-9632  |
+--------+------+----------+----------------+-----------+------------+
9 rows in set (0.00 sec)
