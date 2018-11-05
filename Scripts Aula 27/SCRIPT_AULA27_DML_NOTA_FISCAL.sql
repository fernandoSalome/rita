-- DELETANDO O CONTEÚDO DAS TABELAS --
/*
DELETE FROM T_SPV_ITEM_NOTA_FISCAL;
DELETE FROM T_SPV_NOTA_FISCAL;
DELETE FROM T_SPV_CLIENTE; 
DELETE FROM T_SPV_CLASSIFICAO_FISCAL; 
DELETE FROM T_SPV_PRODUTO;
DELETE FROM T_SPV_UNIDADE_MEDIDA; 
*/

-- ALTERANDO O FORMATO DA DATA/HORA PADRÃO --
ALTER SESSION SET NLS_DATE_FORMAT = 'dd/mm/yyyy hh24:mi:ss';

-- INSERINDO DADOS NA TABELA UNIDADE DE MEDIDA
INSERT INTO T_SPV_UNIDADE_MEDIDA (cd_unidade_medida, ds_sigla, ds_unidade_medida) VALUES (1,'CXA', 'CAIXA');
INSERT INTO T_SPV_UNIDADE_MEDIDA (cd_unidade_medida, ds_sigla, ds_unidade_medida) VALUES (2,'PCT', 'PACOTE');
INSERT INTO T_SPV_UNIDADE_MEDIDA (cd_unidade_medida, ds_sigla, ds_unidade_medida) VALUES (3,'PCA', 'PEÇA');
INSERT INTO T_SPV_UNIDADE_MEDIDA (cd_unidade_medida, ds_sigla, ds_unidade_medida) VALUES (4,'MAQ', 'MAQUINA');
INSERT INTO T_SPV_UNIDADE_MEDIDA (cd_unidade_medida, ds_sigla, ds_unidade_medida) VALUES (5,'EQP', 'EQUIPAMENTO');
-- EFETIVANDO AS TRANSAÇÕES DE INSERÇÃO NA TABELA
COMMIT;
-- CONSULTANDO A TABELA
SELECT * FROM T_SPV_UNIDADE_MEDIDA;  

-- INSERINDO DADOS NA TABELA CLASSIFICACAO_FISCAL
INSERT INTO T_SPV_CLASSIFICAO_FISCAL (cd_classificacao_fiscal, nr_cfop, ds_natureza_operacao) VALUES (1,5012, 'VENDA');
INSERT INTO T_SPV_CLASSIFICAO_FISCAL (cd_classificacao_fiscal, nr_cfop, ds_natureza_operacao) VALUES (2,5012, 'BRINDE');
INSERT INTO T_SPV_CLASSIFICAO_FISCAL (cd_classificacao_fiscal, nr_cfop, ds_natureza_operacao) VALUES (3,2365, 'COMPRA');
INSERT INTO T_SPV_CLASSIFICAO_FISCAL (cd_classificacao_fiscal, nr_cfop, ds_natureza_operacao) VALUES (4,1234, 'DEVOLUÇÃO');
-- EFETIVANDO AS TRANSAÇÕES DE INSERÇÃO NA TABELA
COMMIT;
-- CONSULTANDO A TABELA
SELECT * FROM T_SPV_CLASSIFICAO_FISCAL;  

-- INSERINDO DADOS NA TABELA CLIENTE
INSERT INTO T_SPV_CLIENTE 
    (cd_cliente, nm_cliente, dt_nascimento, ds_sexo, nr_cpf, nr_cpf_dig, nr_rg, nr_rg_dig, ds_email) 
  VALUES 
    (1,'MARIA DAS DORES', TO_DATE('21/04/1987','DD/MM/YYYY'), 'F', 92876345,01, 21356789 , 'X','MARIAJOSE@MARIAJOSE.COM.BR');
    
INSERT INTO T_SPV_CLIENTE 
    (cd_cliente, nm_cliente, dt_nascimento, ds_sexo, nr_cpf, nr_cpf_dig, nr_rg, nr_rg_dig, ds_email) 
  VALUES 
    (2,'ANA MARIA', TO_DATE('10/02/1986','DD/MM/YYYY'), 'F', 98764532, 18, 12345678, 9,'ANAMARIA@ANAMARIA.COM.BR');
    
INSERT INTO T_SPV_CLIENTE 
    (cd_cliente, nm_cliente, dt_nascimento, ds_sexo, nr_cpf, nr_cpf_dig, nr_rg, nr_rg_dig, ds_email) 
  VALUES 
    (3,'JOÃO DA SILVA', TO_DATE('08/09/1991','DD/MM/YYYY'), 'M', 12387654, 31, 98765432, 1,'JOAOSILVA@JOAOSILVA.COM.BR');

INSERT INTO T_SPV_CLIENTE 
    (cd_cliente, nm_cliente, dt_nascimento, ds_sexo, nr_cpf, nr_cpf_dig, nr_rg, nr_rg_dig, ds_email) 
  VALUES 
    (4,'JOAQUIM XAVIER', TO_DATE('21/04/1988','DD/MM/YYYY'), 'M', 213141516, 11, 198273641, 'X','JOAQUIMXAVIER@JOAQUIMXAVIER.COM.BR');
-- EFETIVANDO AS TRANSAÇÕES DE INSERÇÃO NA TABELA
COMMIT;
-- CONSULTANDO A TABELA
SELECT * FROM T_SPV_CLIENTE; 

-- INSERINDO DADOS NA TABELA PRODUTO
INSERT INTO T_SPV_PRODUTO 
    (cd_produto, cd_unidade_medida, ds_produto, ds_completa_produto, qt_estoque, vl_preco_unitario) 
  VALUES 
    (1,1,'NOTEBOOK SENSACIONAL', 'NOTEBOOK XPTO SUPER ESPECIAL', 3,1980.56);

INSERT INTO T_SPV_PRODUTO 
    (cd_produto, cd_unidade_medida,ds_produto,ds_completa_produto,qt_estoque,vl_preco_unitario) 
  VALUES 
    (2,1, 'IMPRESSORA X3', 'IMPRESSORA MULTIFUNCIONAL HP', 5,432.89);

INSERT INTO T_SPV_PRODUTO 
    (cd_produto, cd_unidade_medida,ds_produto,ds_completa_produto,qt_estoque,vl_preco_unitario) 
  VALUES 
    (3,1, 'PEN DRIVE - 16GB', 'PEN DRIVE 16GB KINGSTON', 10,60.00);
    
INSERT INTO T_SPV_PRODUTO 
    (cd_produto, cd_unidade_medida,ds_produto,ds_completa_produto,qt_estoque,vl_preco_unitario) 
  VALUES 
    (4,1, 'PEN DRIVE - 32GB', 'PEN DRIVE 32GB KINGSTON', 10,108.00);
    
INSERT INTO T_SPV_PRODUTO 
    (cd_produto, cd_unidade_medida,ds_produto,ds_completa_produto,qt_estoque,vl_preco_unitario) 
  VALUES 
    (5,1, 'HD EXTERNO - 500GB', 'HD EXTERNO SANSUMG - 500 GB', 10,305.00);

INSERT INTO T_SPV_PRODUTO 
    (cd_produto, cd_unidade_medida,ds_produto,ds_completa_produto,qt_estoque,vl_preco_unitario) 
  VALUES 
    (6,1, 'HD EXTERNO - 1TB', 'HD EXTERNO SANSUMG -1 TB', 10,870.00);  
  
-- EFETIVANDO AS TRANSAÇÕES DE INSERÇÃO NA TABELA
COMMIT;
-- CONSULTANDO A TABELA
SELECT * FROM T_SPV_PRODUTO; 

-- INSERINDO DADOS NA TABELA NOTA_FISCAL
INSERT INTO T_SPV_NOTA_FISCAL 
    (nr_nota_fiscal, cd_classificacao_fiscal, cd_cliente, dt_emissao, vl_total_nf, ds_tipo, vl_desconto) 
  VALUES 
    (1234, 1,1, TO_DATE('09/08/2014','DD/MM/YYYY'),870.00,2,2.5);

INSERT INTO T_SPV_NOTA_FISCAL 
    (nr_nota_fiscal, cd_classificacao_fiscal, cd_cliente, dt_emissao, vl_total_nf, ds_tipo, vl_desconto) 
  VALUES 
    (1235, 1,2, TO_DATE('11/08/2014','DD/MM/YYYY'),990.00,2,2);
    
INSERT INTO T_SPV_NOTA_FISCAL 
    (nr_nota_fiscal, cd_classificacao_fiscal, cd_cliente, dt_emissao, vl_total_nf, ds_tipo, vl_desconto) 
  VALUES 
    (1236, 2,3, TO_DATE('15/08/2014','DD/MM/YYYY'),60.00,2, NULL);
-- EFETIVANDO AS TRANSAÇÕES DE INSERÇÃO NA TABELA
COMMIT;
-- CONSULTANDO A TABELA
SELECT * FROM T_SPV_NOTA_FISCAL; 

-- INSERINDO DADOS NA TABELA ITEM_NOTA_FISCAL
INSERT INTO T_SPV_ITEM_NOTA_FISCAL 
    (nr_nota_fiscal, cd_item, cd_produto, qt_vendida, vl_preco_unitario) 
  VALUES 
    (1234, 1,6,1,870.00);
    
INSERT INTO T_SPV_ITEM_NOTA_FISCAL 
    (nr_nota_fiscal, cd_item, cd_produto, qt_vendida, vl_preco_unitario) 
  VALUES 
    (1235, 1,6,1,870.00);
    
INSERT INTO T_SPV_ITEM_NOTA_FISCAL 
    (nr_nota_fiscal, cd_item, cd_produto, qt_vendida, vl_preco_unitario) 
  VALUES 
    (1235, 2,3,2,870.00);

 INSERT INTO T_SPV_ITEM_NOTA_FISCAL 
    (nr_nota_fiscal, cd_item, cd_produto, qt_vendida, vl_preco_unitario) 
  VALUES 
    (1236, 1,3,1,870.00);   

-- EFETIVANDO AS TRANSAÇÕES DE INSERÇÃO NA TABELA
COMMIT;
-- CONSULTANDO A TABELA
SELECT * FROM T_SPV_ITEM_NOTA_FISCAL; 

