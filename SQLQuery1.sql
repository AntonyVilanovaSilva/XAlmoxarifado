--Atividade

--Questão 1: Notas Fiscais
Select ID_NOTA,ID_FOR,ID_SEC,NUM_NOTA,VALOR_NOTA,
QTD_ITEM,ISS,ANO,MES,DATA_NOTA,ID_TIPO_NOTA,OBSERVACAO_NOTA,EMPENHO_NUM From NOTA_FISCAL

--Questão 2: Itens de entrada de uma nota fiscal
Select ITEM_NUM,ID_PRO,ID_NOTA,ID_SEC,QTD_PRO,
PRE_UNIT,TOTAL_ITEM,EST_LIN From ITENS_NOTA

--Questão 3: Requisições
Select ID_REQ,ID_CLI,TOTAL_REQ,QTD_ITEN,DATA_REQ,
ANO,MES,ID_SEC,OBSERVACAO From REQUISICAO

--Questão 4: Itens de saída (req)
Select NUM_ITEM,ID_PRO,ID_REQ,ID_SEC,QTD_PRO
PRE_UNIT,TOTAL_ITEM,TOTAL_REAL From ITENS_REQ

--Questão 5: Itens de um nota fiscal
Select * From ITENS_NOTA Where ID_NOTA IN (2271,2987)

--Questão 6: Todos os itens de uma nota fiscal


--Questão 7: Todas as notas fiscais do mes de competencia janeiro
Select ID_NOTA,ID_FOR,ID_SEC,NUM_NOTA,VALOR_NOTA,
QTD_ITEM,ISS,ANO,MES,DATA_NOTA,ID_TIPO_NOTA,OBSERVACAO_NOTA,EMPENHO_NUM From NOTA_FISCAL Where MES=1 AND  ANO=2011

--Questão 8: Todos os fornecedores
Select ID_FOR,FANTASIA,CNPJ,RESPONSAVEL,INS_MUNICIPAL,
INS_ESTADUAL,ENDERECO,BAIRRO,UF,TELEFONE,FAX,EMAIL,CELULAR From FORNECEDOR

--Questão 9: Todas todas as notas de um fornecedor
Select * From NOTA_FISCAL Where ID_FOR=274

--Questão 10: Todas as secretarias
Select ID_SEC,NOME_SEC,ENDRECO_SEC,BAIRRO_SEC,EMAIL,TEL From SECRETARIA

--Questão 11: Retornar todos os fornecesores que contém a palavra "can" em fantasia
Select * From FORNECEDOR Where FANTASIA LIKE '%can%'

--Questão 12: Retornar todos os itens que o total do item for maior que 100  e menor que 500

Select * From ITENS_NOTA Where TOTAL_ITEM>100 AND TOTAL_ITEM<500

--Questão 13: Retornar todos os produtos que o estoque for maior que 20
SELECT * FROM ITENS_NOTA WHERE TOTAL_ITEM BETWEEN 101 AND 499
ORDER BY TOTAL_ITEM DESC
SELECT * FROM ESTOQUE WHERE QTD_PRO>20
ORDER BY QTD_PRO DESC

--Questão 14: Retornar valor total comprado agrupado a fornecedor
SELECT TOP 10 F.ID_FOR, F.FANTASIA, COUNT(N.ID_NOTA) AS QTD, 
AVG(VALOR_NOTA) AS MEDIA, SUM(N.VALOR_NOTA) AS TOTAL FROM FORNECEDOR F
JOIN NOTA_FISCAL N ON F.ID_FOR=N.ID_FOR
GROUP BY F.ID_FOR, F.FANTASIA
ORDER BY TOTAL DESC

--Questão 15: Retornar valor total comprado agrupado por UF
SELECT F.UF, COUNT(N.ID_NOTA) AS QTD, 
AVG(VALOR_NOTA) AS MEDIA, SUM(N.VALOR_NOTA) AS TOTAL FROM FORNECEDOR F
JOIN NOTA_FISCAL N ON F.ID_FOR=N.ID_FOR
WHERE F.UF IS NOT NULL
GROUP BY F.UF
ORDER BY F.UF ASC

--Questão 16: Retornar a quantidade de produtos em estoque por secretaria
SELECT S.ID_SEC, S.NOME_SEC, SUM(E.QTD_PRO) AS QUANTIDADE_TOTAL
FROM SECRETARIA S
JOIN ESTOQUE E ON S.ID_SEC = E.ID_SEC
GROUP BY S.ID_SEC, S.NOME_SEC;

--Questão 17: Retornar o top 10 de produtos com maior entrada pelo valor
SELECT TOP 10 P.ID_PRO, SUM(I.QTD_PRO) AS VALOR_TOTAL_ENTRADA
FROM PRODUTO P
JOIN ITENS_NOTA I ON P.ID_PRO = I.ID_PRO
GROUP BY P.ID_PRO
ORDER BY VALOR_TOTAL_ENTRADA DESC;

--Questão 18: Retornar o top 10 dos produtos com menos entrada pela quantidade
SELECT TOP 10 P.ID_PRO, SUM(I.QTD_PRO) AS VALOR_TOTAL_ENTRADA
FROM PRODUTO P
JOIN ITENS_NOTA I ON P.ID_PRO = I.ID_PRO
GROUP BY P.ID_PRO
ORDER BY VALOR_TOTAL_ENTRADA ASC;

--Questão 19: Retornar o valor comprado (Nota Fiscal) por mês e ano

--Questão 20: Retorna o valor total de entrada e o valor total de saída de todo o histórico

select * from ESTOQUE
Select * from PRODUTO