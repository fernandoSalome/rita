/*

DROP TABLE T_SPV_CLASSIFICAO_FISCAL CASCADE CONSTRAINTS ;

DROP TABLE T_SPV_CLIENTE CASCADE CONSTRAINTS ;

DROP TABLE T_SPV_ITEM_NOTA_FISCAL CASCADE CONSTRAINTS ;

DROP TABLE T_SPV_NOTA_FISCAL CASCADE CONSTRAINTS ;

DROP TABLE T_SPV_PRODUTO CASCADE CONSTRAINTS ;

DROP TABLE T_SPV_UNIDADE_MEDIDA CASCADE CONSTRAINTS ;
*/


CREATE TABLE T_SPV_CLASSIFICAO_FISCAL
  (
    cd_classificacao_fiscal NUMBER (4)    NOT NULL ,
    nr_cfop                 NUMBER (5)    NOT NULL ,
    ds_natureza_operacao    VARCHAR2 (30) NOT NULL
  ) ;
  
ALTER TABLE T_SPV_CLASSIFICAO_FISCAL 
      ADD CONSTRAINT PK_SPV_CLASSIFICAO_FISCAL 
      PRIMARY KEY ( cd_classificacao_fiscal ) ;
      
ALTER TABLE T_SPV_CLASSIFICAO_FISCAL 
      ADD CONSTRAINT UN_SPV_CLASSIF_NATUREZA 
      UNIQUE ( ds_natureza_operacao ) ;

CREATE TABLE T_SPV_CLIENTE
  (
    cd_cliente    NUMBER (5)        NOT NULL ,
    nm_cliente    VARCHAR2 (60)     NOT NULL ,
    dt_nascimento DATE                  NULL ,
    ds_sexo       CHAR (1)          NOT NULL ,
    nr_cpf        NUMBER (9)        NOT NULL ,
    nr_cpf_dig    NUMBER (2)        NOT NULL ,
    nr_rg         NUMBER (9)        NOT NULL ,
    nr_rg_dig     CHAR (1)          NOT NULL ,
    ds_email      VARCHAR2 (80)         NULL
  ) ;
  
ALTER TABLE T_SPV_CLIENTE 
      ADD CONSTRAINT CK_SPV_CLIENTE_SEXO 
      CHECK (upper(ds_sexo) = 'F' OR upper(ds_sexo) = 'M') ;
      
ALTER TABLE T_SPV_CLIENTE 
      ADD CONSTRAINT PK_SPV_CLIENTE 
      PRIMARY KEY ( cd_cliente ) ;

CREATE TABLE T_SPV_ITEM_NOTA_FISCAL
  (
    nr_nota_fiscal    NUMBER (6)    NOT NULL ,
    cd_item           NUMBER (3)    NOT NULL ,
    cd_produto        NUMBER (6)    NOT NULL ,
    qt_vendida        NUMBER (3)    NOT NULL ,
    vl_preco_unitario NUMBER (6,2)  NOT NULL
  ) ;
  
ALTER TABLE T_SPV_ITEM_NOTA_FISCAL 
      ADD CONSTRAINT CK_SPV_ITEM_NF_QTDEVEND 
      CHECK (qt_vendida > 0) ;
      
ALTER TABLE T_SPV_ITEM_NOTA_FISCAL 
      ADD CONSTRAINT PK_SPV_ITEM_NOTA_FISCAL 
      PRIMARY KEY ( nr_nota_fiscal, cd_item ) ;

CREATE TABLE T_SPV_NOTA_FISCAL
  (
    nr_nota_fiscal          NUMBER (6)      NOT NULL ,
    cd_classificacao_fiscal NUMBER (4)      NOT NULL ,
    cd_cliente              NUMBER (5)      NOT NULL ,
    dt_emissao              DATE            NOT NULL ,
    vl_total_nf             NUMBER (8,2)    NOT NULL ,
    ds_tipo                 NUMBER (1)      NOT NULL ,
    vl_desconto             NUMBER (3,1)
  ) ;
ALTER TABLE T_SPV_NOTA_FISCAL 
      ADD CONSTRAINT CK_SPV_NF_DESCONTO 
      CHECK (vl_desconto >= 0 AND vl_desconto <= 25) ;
      
ALTER TABLE T_SPV_NOTA_FISCAL 
      ADD CONSTRAINT CK_SPV_NF_TIPO 
      CHECK (ds_tipo IN(1,2)) ;
      
ALTER TABLE T_SPV_NOTA_FISCAL 
      ADD CONSTRAINT PK_SPV_NOTA_FISCAL 
      PRIMARY KEY ( nr_nota_fiscal ) ;

CREATE TABLE T_SPV_PRODUTO
  (
    cd_produto          NUMBER (6)      NOT NULL ,
    cd_unidade_medida   NUMBER (2)      NOT NULL ,
    ds_produto          VARCHAR2 (20)   NOT NULL ,
    ds_completa_produto VARCHAR2 (128)  NOT NULL ,
    qt_estoque          NUMBER (4)      NOT NULL ,
    vl_preco_unitario   NUMBER (6,2)    NOT NULL
  ) ;
ALTER TABLE T_SPV_PRODUTO 
      ADD CONSTRAINT CK_SPV_PROD_QTDE
      CHECK (qt_estoque > 0) ;
      
ALTER TABLE T_SPV_PRODUTO 
      ADD CONSTRAINT CK_SPV_PROD_PRECO 
      CHECK (vl_preco_unitario > 0) ;
      
ALTER TABLE T_SPV_PRODUTO 
      ADD CONSTRAINT PK_SPV_PRODUTO 
      PRIMARY KEY ( cd_produto ) ;
      
ALTER TABLE T_SPV_PRODUTO 
      ADD CONSTRAINT UN_SPV_PRODUTO_DESCRICAO 
      UNIQUE ( ds_produto ) ;

CREATE TABLE T_SPV_UNIDADE_MEDIDA
  (
    cd_unidade_medida NUMBER (2)    NOT NULL ,
    ds_sigla          CHAR (3)      NOT NULL ,
    ds_unidade_medida VARCHAR2 (30) NOT NULL
  ) ;
  
ALTER TABLE T_SPV_UNIDADE_MEDIDA 
      ADD CONSTRAINT PK_SPV_UNIDADE_MEDIDA 
      PRIMARY KEY ( cd_unidade_medida ) ;
      
ALTER TABLE T_SPV_UNIDADE_MEDIDA 
      ADD CONSTRAINT UN_SPV_UNID_MED_DESCRICAO 
      UNIQUE ( ds_unidade_medida ) ;

-- CHAVES ESTRANGEIRAS --

ALTER TABLE T_SPV_ITEM_NOTA_FISCAL 
      ADD CONSTRAINT FK_SPV_ITEMNF_NOTA_FISCAL 
      FOREIGN KEY ( nr_nota_fiscal ) 
      REFERENCES T_SPV_NOTA_FISCAL ( nr_nota_fiscal ) ;

ALTER TABLE T_SPV_ITEM_NOTA_FISCAL 
      ADD CONSTRAINT FK_SPV_ITEMNF_PRODUTO 
      FOREIGN KEY ( cd_produto ) 
      REFERENCES T_SPV_PRODUTO ( cd_produto ) ;

ALTER TABLE T_SPV_NOTA_FISCAL 
      ADD CONSTRAINT FK_SPV_NF_CLASSIF 
      FOREIGN KEY ( cd_classificacao_fiscal ) 
      REFERENCES T_SPV_CLASSIFICAO_FISCAL ( cd_classificacao_fiscal ) ;

ALTER TABLE T_SPV_NOTA_FISCAL 
      ADD CONSTRAINT FK_SPV_NF_CLIENTE 
      FOREIGN KEY ( cd_cliente ) 
      REFERENCES T_SPV_CLIENTE ( cd_cliente ) ;

ALTER TABLE T_SPV_PRODUTO 
      ADD CONSTRAINT FK_SPV_PROD_UNID_MEDIDA 
      FOREIGN KEY ( cd_unidade_medida ) 
      REFERENCES T_SPV_UNIDADE_MEDIDA ( cd_unidade_medida ) ;
