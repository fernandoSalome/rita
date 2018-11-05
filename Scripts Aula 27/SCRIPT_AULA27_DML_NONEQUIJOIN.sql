-- DELETANDO O CONTE�DO DAS TABELAS --
/*
DELETE FROM T_AULA27_CATEGORIA;
DELETE FROM T_AULA27_FAIXA_CD;
DELETE FROM T_AULA27_MUSICA; 
DELETE FROM T_AULA27_CD; 
*/


-- INSERINDO DADOS NA TABELA CATEGORIA
INSERT INTO T_AULA27_CATEGORIA (CD_CATEGORIA,DS_CATEGORIA,VL_INICIAL, VL_FINAL) VALUES (1, 'FAIXA VERDE', 0, 19.90);
INSERT INTO T_AULA27_CATEGORIA (CD_CATEGORIA,DS_CATEGORIA,VL_INICIAL, VL_FINAL) VALUES (2, 'FAIXA AMARELA', 19.91, 30);
INSERT INTO T_AULA27_CATEGORIA (CD_CATEGORIA,DS_CATEGORIA,VL_INICIAL, VL_FINAL) VALUES (3, 'FAIXA VERMELHA', 30.01, 100);
-- EFETIVANDO AS TRANSA��ES DE INSER��O NA TABELA
COMMIT;
-- CONSULTANDO A TABELA
SELECT * FROM T_AULA27_CATEGORIA;  

-- INSERINDO DADOS NA TABELA MUSICA
INSERT INTO T_AULA27_MUSICA (CD_MUSICA, DS_MUSICA) VALUES (1, 'IRIS');
INSERT INTO T_AULA27_MUSICA (CD_MUSICA, DS_MUSICA) VALUES (2, 'YOUR SONG');
INSERT INTO T_AULA27_MUSICA (CD_MUSICA, DS_MUSICA) VALUES (3, 'FUSC�O PRETO');
INSERT INTO T_AULA27_MUSICA (CD_MUSICA, DS_MUSICA) VALUES (4, 'BRAS�LIA AMARELA');
INSERT INTO T_AULA27_MUSICA (CD_MUSICA, DS_MUSICA) VALUES (5, 'ESPERAN�A');
INSERT INTO T_AULA27_MUSICA (CD_MUSICA, DS_MUSICA) VALUES (6, 'SEGUNDO SOL');
INSERT INTO T_AULA27_MUSICA (CD_MUSICA, DS_MUSICA) VALUES (7, 'TEMPO PERDIDO');
INSERT INTO T_AULA27_MUSICA (CD_MUSICA, DS_MUSICA) VALUES (8, 'QUEM DE N�S DOIS');
INSERT INTO T_AULA27_MUSICA (CD_MUSICA, DS_MUSICA) VALUES (9, 'DANIEL');
INSERT INTO T_AULA27_MUSICA (CD_MUSICA, DS_MUSICA) VALUES (10, 'FLOR DO SERT�O');
-- EFETIVANDO AS TRANSA��ES DE INSER��O NA TABELA
COMMIT;
-- CONSULTANDO A TABELA
SELECT * FROM T_AULA27_MUSICA;  


-- INSERINDO DADOS NA TABELA CD
INSERT INTO T_AULA27_CD (CD_CODIGO_CD, DS_CD, DT_LANCAMENTO,VL_PRECO_VENDA) VALUES (1, 'CD BREGA' , TO_DATE('02/10/1988','DD/MM/YYYY'), 9.90);
INSERT INTO T_AULA27_CD (CD_CODIGO_CD, DS_CD, DT_LANCAMENTO,VL_PRECO_VENDA) VALUES (2, 'CD MAIS OU MENOS' , TO_DATE('20/05/1991','DD/MM/YYYY'), 11.90);
INSERT INTO T_AULA27_CD (CD_CODIGO_CD, DS_CD, DT_LANCAMENTO,VL_PRECO_VENDA) VALUES (3, 'CD TOP' , TO_DATE('02/10/1995','DD/MM/YYYY'), 20.50);
INSERT INTO T_AULA27_CD (CD_CODIGO_CD, DS_CD, DT_LANCAMENTO,VL_PRECO_VENDA) VALUES (4, 'CD AI AI AI' , TO_DATE('02/10/2000','DD/MM/YYYY'), 22.00);
INSERT INTO T_AULA27_CD (CD_CODIGO_CD, DS_CD, DT_LANCAMENTO,VL_PRECO_VENDA) VALUES (5, 'CD BREGA PLUS' , TO_DATE('02/10/2005','DD/MM/YYYY'), 35.00);
-- EFETIVANDO AS TRANSA��ES DE INSER��O NA TABELA
COMMIT;
-- CONSULTANDO A TABELA
SELECT * FROM T_AULA27_CD;

-- INSERINDO DADOS NA TABELA FAIXA_CD
INSERT INTO T_AULA27_FAIXA_CD (CD_CODIGO_CD, NR_FAIXA, CD_MUSICA, VL_DURACAO) VALUES (1,1,3,3);
INSERT INTO T_AULA27_FAIXA_CD (CD_CODIGO_CD, NR_FAIXA, CD_MUSICA, VL_DURACAO) VALUES (1,2,4,3);
INSERT INTO T_AULA27_FAIXA_CD (CD_CODIGO_CD, NR_FAIXA, CD_MUSICA, VL_DURACAO) VALUES (1,3,8,4);
INSERT INTO T_AULA27_FAIXA_CD (CD_CODIGO_CD, NR_FAIXA, CD_MUSICA, VL_DURACAO) VALUES (2,1,4,3);
INSERT INTO T_AULA27_FAIXA_CD (CD_CODIGO_CD, NR_FAIXA, CD_MUSICA, VL_DURACAO) VALUES (2,2,8,4);
INSERT INTO T_AULA27_FAIXA_CD (CD_CODIGO_CD, NR_FAIXA, CD_MUSICA, VL_DURACAO) VALUES (3,1,1,5);
INSERT INTO T_AULA27_FAIXA_CD (CD_CODIGO_CD, NR_FAIXA, CD_MUSICA, VL_DURACAO) VALUES (3,2,2,4);
INSERT INTO T_AULA27_FAIXA_CD (CD_CODIGO_CD, NR_FAIXA, CD_MUSICA, VL_DURACAO) VALUES (3,3,9,3);
INSERT INTO T_AULA27_FAIXA_CD (CD_CODIGO_CD, NR_FAIXA, CD_MUSICA, VL_DURACAO) VALUES (4,1,5,3);
INSERT INTO T_AULA27_FAIXA_CD (CD_CODIGO_CD, NR_FAIXA, CD_MUSICA, VL_DURACAO) VALUES (4,2,7,3);
INSERT INTO T_AULA27_FAIXA_CD (CD_CODIGO_CD, NR_FAIXA, CD_MUSICA, VL_DURACAO) VALUES (4,3,8,4);
INSERT INTO T_AULA27_FAIXA_CD (CD_CODIGO_CD, NR_FAIXA, CD_MUSICA, VL_DURACAO) VALUES (5,1,4,3);
INSERT INTO T_AULA27_FAIXA_CD (CD_CODIGO_CD, NR_FAIXA, CD_MUSICA, VL_DURACAO) VALUES (5,2,8,4);
INSERT INTO T_AULA27_FAIXA_CD (CD_CODIGO_CD, NR_FAIXA, CD_MUSICA, VL_DURACAO) VALUES (5,3,10,4);
-- EFETIVANDO AS TRANSA��ES DE INSER��O NA TABELA
COMMIT;
-- CONSULTANDO A TABELA
SELECT * FROM T_AULA27_FAIXA_CD;