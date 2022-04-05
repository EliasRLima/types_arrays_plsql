create or replace package cliente is

  -- Author  : elias
  
  type typ_cliente is record (id  pls_integer,
                              nomecliente varchar2(1000),
                              datanascimento date,
                              faturamentoanual number,
                              cpfcnpj     varchar2(14),
                              tipopessoa  integer);
   
  type typ_tab_cliente is table of typ_cliente index by pls_integer;
  
  c_tipoPessoaFisica constant number := 1;
  c_tipoPessoaJuridica constant number := 2;
  
  e_validacao EXCEPTION;

end;
/
create or replace package body cliente is

  
  
end;
/
