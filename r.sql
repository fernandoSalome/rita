--1
SELECT cd_produto,
u.ds_sigla,
u.cd_unidade_medida,
ds_produto,
qt_estoque,
vl_preco_unitario,
ds_completa_produto
FROM T_SPV_UNIDADE_MEDIDA U INNER JOIN T_SPV_PRODUTO 
    USING(CD_UNIDADE_MEDIDA)
ORDER BY ds_produto;    
--2
SELECT cd_produto,u.ds_sigla,u.cd_unidade_medida,p.ds_produto,p.qt_estoque,p.vl_preco_unitario,p.ds_completa_produto
FROM T_SPV_UNIDADE_MEDIDA U , T_SPV_PRODUTO P
WHERE p.cd_unidade_medida=u.cd_unidade_medida    
ORDER BY p.ds_produto; 
--3
select nf.nr_nota_fiscal,cf.nr_cfop,cf.ds_natureza_operacao,nf.dt_emissao,nf.vl_total_nf,nf.vl_desconto,(nf.vl_total_nf*(nf.vl_desconto/100)) "vl desconto"
from T_SPV_CLASSIFICAO_FISCAL CF INNER JOIN T_SPV_NOTA_FISCAL NF ON ( CF.CD_CLASSIFICACAO_FISCAL = NF.CD_CLASSIFICACAO_FISCAL )
AND NF.VL_DESCONTO IS NOT NULL
ORDER BY NF.NR_NOTA_FISCAL;
--4
SELECT nf.nr_nota_fiscal,cf.nr_cfop,cf.ds_natureza_operacao,nf.dt_emissao,nf.vl_total_nf,nf.vl_desconto,(nf.vl_total_nf*(nf.vl_desconto/100)) "% desconto"
FROM T_SPV_CLASSIFICAO_FISCAL CF, T_SPV_NOTA_FISCAL NF
WHERE (cf.cd_classificacao_fiscal=nf.cd_classificacao_fiscal) AND nf.vl_desconto IS NOT NULL
ORDER BY NF.NR_NOTA_FISCAL;
--5
SELECT nf.nr_nota_fiscal,cf.nr_cfop,cf.ds_natureza_operacao,nf.dt_emissao,nf.vl_total_nf,nf.vl_desconto,(nf.vl_total_nf*(nf.vl_desconto/100)) "% desconto"
from T_SPV_CLASSIFICAO_FISCAL CF INNER JOIN T_SPV_NOTA_FISCAL NF ON ( CF.CD_CLASSIFICACAO_FISCAL = NF.CD_CLASSIFICACAO_FISCAL )
where TO_CHAR(nf.dt_emissao,'YYYY') IN ('2013','2014') AND nf.vl_desconto IS NOT NULL
ORDER BY nf.nr_nota_fiscal;
--6
SELECT nf.nr_nota_fiscal,cf.nr_cfop,cf.ds_natureza_operacao,nf.dt_emissao,nf.vl_total_nf,nf.vl_desconto,(nf.vl_total_nf*(nf.vl_desconto/100)) "% desconto"
from T_SPV_CLASSIFICAO_FISCAL CF, T_SPV_NOTA_FISCAL NF 
WHERE ( CF.CD_CLASSIFICACAO_FISCAL = NF.CD_CLASSIFICACAO_FISCAL )
AND TO_CHAR(nf.dt_emissao,'YYYY') IN ('2013','2014') AND nf.vl_desconto IS NOT NULL
ORDER BY nf.nr_nota_fiscal;
--7
SELECT nf.nr_nota_fiscal,cl.nm_cliente,cf.nr_cfop,cf.ds_natureza_operacao,nf.dt_emissao,nf.vl_total_nf,nf.vl_desconto,(nf.vl_total_nf*(nf.vl_desconto/100)) "% desconto"
from T_SPV_CLASSIFICAO_FISCAL CF 
INNER JOIN T_SPV_NOTA_FISCAL NF ON ( CF.CD_CLASSIFICACAO_FISCAL = NF.CD_CLASSIFICACAO_FISCAL )
INNER JOIN T_SPV_CLIENTE CL ON (CL.CD_CLIENTE = NF.CD_CLIENTE )
where nf.vl_desconto IS NOT NULL; 
--8
SELECT nf.nr_nota_fiscal,cl.nm_cliente,cf.nr_cfop,cf.ds_natureza_operacao,nf.dt_emissao,nf.vl_total_nf,nf.vl_desconto,(nf.vl_total_nf*(nf.vl_desconto/100)) "% desconto"
from T_SPV_CLASSIFICAO_FISCAL CF, T_SPV_NOTA_FISCAL NF ,T_SPV_CLIENTE CL
where nf.vl_desconto IS NOT NULL;

