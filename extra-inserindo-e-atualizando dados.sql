use ecommerce;

## Inserindo cliente no bd
insert into cliente (Cod_Cliente,Nome,Sobre_Nome,CPF,Endereço,Telefone,Email,Estado,Data_Nascimento)
values (1,'Gabriel','Medeiros dos Santos','06197999647','Rua Ademar Moreira', '21969655145','gabriel.med25@gmail','Rio de Janeiro,RJ', '2000-04-10');

##inserindo fornecedor
insert into fornecedor values (1, 'EletroFarms', '22.879.701/0001-85', '21969655422', 'Rio de Janeiro, RJ', 1);

##inserindo produto
insert into produto values (1, 'Eletronico', 'Notebook Inspiron 15', 2599.00 , 1);

##inserindo novo pedido
insert into pedido values (1, 'Em Analise',now(),'Notebook',1,1 );

##inserindo forma de pagamento no cartão de credito
insert into tipo_de_pagamento values (1,'Cartão de Crédito', '12', 1);
insert into detalhes_do_cartao values (1, '5141110655910384', '08/2028', 1, 'Lydia Torres', '091.785.700-34' );


## Buscando informações com cruzamento de dados
select p.cliente_codcliente, c.Nome, c.Sobre_nome, p.cod_pedido, p.status_pedido, p.data_pedido, pt.descrição, pt.valor, f.razão_social as "Fabricante"
from pedido p
join produto pt on pt.cod_produto = p.cod_produto
join cliente c on c.cod_cliente = p.Cliente_codcliente
join fornecedor f on f.cod_fornecedor = pt.cod_fornecedor;

#criando uma visão de cruzamento de dados cliente_produto_fornecedor
create or replace view cliente_produto_fornecedor as 
select p.cliente_codcliente, c.Nome, c.Sobre_nome, p.cod_pedido, p.status_pedido, p.data_pedido, pt.descrição, pt.valor, f.razão_social as "Fabricante"
from pedido p
join produto pt on pt.cod_produto = p.cod_produto
join cliente c on c.cod_cliente = p.Cliente_codcliente
join fornecedor f on f.cod_fornecedor = pt.cod_fornecedor;

## Atualizar status de pedido
update pedido
set status_pedido = 'APROVADO'
where Cliente_Codcliente = 1;

##executando view para visualizar os dados atuaalizados
select * from cliente_produto_fornecedor;

## visualizando cliente, pedido, forma de pagamento
select c.nome, c.sobre_nome, c.cpf, c.estado, p.cod_pedido,
	   p.status_pedido, p.data_pedido, p.descrição, tdp.metodo_de_pagamento,
       tdp.numero_de_parcelas, ddc.nome_do_titular
from cliente c
inner join pedido p on p.cliente_codcliente = c.cod_cliente
inner join tipo_de_pagamento tdp on tdp.cod_pedido = p.cod_pedido
inner join detalhes_do_cartao ddc on ddc.Tipo_de_pagamento_Cod_Tipo_de_pagamento = tdp.Cod_Tipo_de_pagamento;

## criando visão do cruzamento de dados cliente, pedido e forma de pagamento

create or replace view cliente_pedido_pagamento as 
select c.nome, c.sobre_nome, c.cpf, c.estado, p.cod_pedido,
	   p.status_pedido, p.data_pedido, pdt.valor, pdt.descrição as "produto",
       p.descrição, tdp.metodo_de_pagamento,tdp.numero_de_parcelas,
       ddc.nome_do_titular
from cliente c
join pedido p on p.cliente_codcliente = c.cod_cliente
join tipo_de_pagamento tdp on tdp.cod_pedido = p.cod_pedido
join detalhes_do_cartao ddc on ddc.Tipo_de_pagamento_Cod_Tipo_de_pagamento = tdp.Cod_Tipo_de_pagamento
join produto pdt on pdt.cod_produto = p.cod_produto;

## chamando view
select * from cliente_pedido_pagamento



