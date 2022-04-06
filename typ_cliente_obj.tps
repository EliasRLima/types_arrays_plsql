create or replace type typ_cliente_obj as object (idcliente  number,
                                                  nomecliente varchar2(1000),
                                                  datanascimento date,
                                                  faturamentoanual number,
                                                  cpfcnpj     varchar2(14),
                                                  tipopessoa  integer)
 
/
