create or replace package cliente is
  
  -- Author  : elias
  
  type typ_cliente is record (idcliente  pls_integer,
                              nomecliente varchar2(1000),
                              datanascimento date,
                              faturamentoanual number,
                              cpfcnpj     varchar2(14),
                              tipopessoa  integer);
   
  type typ_tab_cliente is table of typ_cliente index by pls_integer;
  
  c_tipoPessoaFisica constant number := 1;
  c_tipoPessoaJuridica constant number := 2;
  
  e_validacao EXCEPTION;
  
  type t_cursor is ref cursor;
  
  function fnc_retorna_colecao(r typ_tab_cliente) return typ_tab_cliente_obj;

end;
/
create or replace package body cliente is

  function fnc_monta_colecao(r typ_cliente) return typ_cliente_obj is
  begin 
    return typ_cliente_obj(r.idcliente,
                           r.nomecliente,
                           r.datanascimento,
                           r.faturamentoanual,
                           r.cpfcnpj,
                           r.tipopessoa);
  end;

  function fnc_retorna_colecao(r typ_tab_cliente) return typ_tab_cliente_obj is
    tab typ_tab_cliente_obj := typ_tab_cliente_obj();
  begin
    for i in 1 .. nvl(r.last, 0) loop
      tab.extend(1);
      tab(i) := fnc_monta_colecao(r(i));
    end loop;
    return tab;
  end;
  
end;
/
