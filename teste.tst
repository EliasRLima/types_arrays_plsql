PL/SQL Developer Test script 3.0
60
-- Created on 05/04/2022 by elias
declare 
  v_lista_clientes cliente.typ_tab_cliente := cliente.typ_tab_cliente();
begin
  
  v_lista_clientes.delete;
  AdicionarCliente(p_id                      => 1,
                   p_nomecliente             => 'Ryan Yuri Almada',
                   p_datanascimento          => '18/05/1975',
                   p_faturamentoanual        => 0,
                   p_cpfcnpj                 => '953.731.960-10',
                   p_tipopessoa              => cliente.c_tipoPessoaFisica,
                   p_tab_clientes_atualizada => v_lista_clientes);
                   
   AdicionarCliente(p_id                      => 2,
                   p_nomecliente             => 'Marcos Carlos Eduardo',
                   p_datanascimento          => '25/12/1982',
                   p_faturamentoanual        => 0,
                   p_cpfcnpj                 => '936.373.310-63',
                   p_tipopessoa              => cliente.c_tipoPessoaFisica,
                   p_tab_clientes_atualizada => v_lista_clientes);
                   
   AdicionarCliente(p_id                      => 3,
                   p_nomecliente             => 'Nicolas e Márcio Alimentos ME',
                   p_datanascimento          => null,
                   p_faturamentoanual        => 500000,
                   p_cpfcnpj                 => '52.863.067/0001-53',
                   p_tipopessoa              => cliente.c_tipoPessoaJuridica,
                   p_tab_clientes_atualizada => v_lista_clientes);
                   
   AdicionarCliente(p_id                      => 4,
                   p_nomecliente             => 'Hadassa e Theo Comercio de Bebidas LTDA',
                   p_datanascimento          => null,
                   p_faturamentoanual        => 1405000,
                   p_cpfcnpj                 => '67.022.821/0001-08',
                   p_tipopessoa              => cliente.c_tipoPessoaJuridica,
                   p_tab_clientes_atualizada => v_lista_clientes);
                   
   AdicionarCliente(p_id                      => 5,
                   p_nomecliente             => 'Tiago Cauê César',
                   p_datanascimento          => '10/02/1995',
                   p_faturamentoanual        => 0,
                   p_cpfcnpj                 => '614.579.220-53',
                   p_tipopessoa              => cliente.c_tipoPessoaFisica,
                   p_tab_clientes_atualizada => v_lista_clientes);   
                   
   dbms_output.put_line('Sem ordem.');
   RetornarClientes(p_tab_clientes => v_lista_clientes);  
   
   dbms_output.put_line('Por nome.');
   RetornarClientes(p_tab_clientes => v_lista_clientes, p_order_nome => 1);  
   
   dbms_output.put_line('Por faturamento.');
   RetornarClientes(p_tab_clientes => v_lista_clientes, p_order_faturamento => 1);  
   
   dbms_output.put_line('Por nome e faturamento.');
   RetornarClientes(p_tab_clientes => v_lista_clientes, p_order_nome => 1, p_order_faturamento => 1);      

  
end;
0
0
