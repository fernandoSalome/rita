
/*
DROP TABLE T_AULA27_CATEGORIA CASCADE CONSTRAINTS 
;
DROP TABLE T_AULA27_CD CASCADE CONSTRAINTS 
;
DROP TABLE T_AULA27_FAIXA_CD CASCADE CONSTRAINTS 
;
DROP TABLE T_AULA27_MUSICA CASCADE CONSTRAINTS 
;
*/

CREATE TABLE T_AULA27_CATEGORIA 
    ( 
     cd_categoria NUMBER (4)  NOT NULL , 
     ds_categoria VARCHAR2 (30)  NOT NULL , 
     vl_inicial NUMBER (5,2)  NOT NULL , 
     vl_final NUMBER (6,2)  NOT NULL 
    ) 
;



ALTER TABLE T_AULA27_CATEGORIA 
    ADD CONSTRAINT PK_AULA27_CATEGORIA PRIMARY KEY ( cd_categoria ) ;



CREATE TABLE T_AULA27_CD 
    ( 
     cd_codigo_cd NUMBER (5)  NOT NULL , 
     ds_cd VARCHAR2 (30)  NOT NULL , 
     dt_lancamento DATE  NOT NULL , 
     vl_preco_venda NUMBER (6,2)  NOT NULL 
    ) 
;



ALTER TABLE T_AULA27_CD 
    ADD CONSTRAINT PK_AULA27_CD PRIMARY KEY ( cd_codigo_cd ) ;



CREATE TABLE T_AULA27_FAIXA_CD 
    ( 
     cd_codigo_cd NUMBER (5)  NOT NULL , 
     nr_faixa NUMBER (2)  NOT NULL , 
     cd_musica NUMBER (5)  NOT NULL , 
     vl_duracao NUMBER (3)  NOT NULL 
    ) 
;



ALTER TABLE T_AULA27_FAIXA_CD 
    ADD CONSTRAINT PK_AULA27_FAIXA_CD PRIMARY KEY ( cd_codigo_cd, nr_faixa ) ;



CREATE TABLE T_AULA27_MUSICA 
    ( 
     cd_musica NUMBER (5)  NOT NULL , 
     ds_musica VARCHAR2 (30)  NOT NULL 
    ) 
;



ALTER TABLE T_AULA27_MUSICA 
    ADD CONSTRAINT PK_AULA27_MUSICA PRIMARY KEY ( cd_musica ) ;




ALTER TABLE T_AULA27_FAIXA_CD 
    ADD CONSTRAINT FK_AULA27_CD_FAIXA FOREIGN KEY 
    ( 
     cd_codigo_cd
    ) 
    REFERENCES T_AULA27_CD 
    ( 
     cd_codigo_cd
    ) 
;


ALTER TABLE T_AULA27_FAIXA_CD 
    ADD CONSTRAINT FK_AULA27_MUSICA_FAIXA FOREIGN KEY 
    ( 
     cd_musica
    ) 
    REFERENCES T_AULA27_MUSICA 
    ( 
     cd_musica
    ) 
;

