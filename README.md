## Projeto de banco de dados Ecommerce

**Venda de produtos**

**Levantamento de Requisitos**

**- Produto**

Os produtos são vendidos por uma única plataforma online.
Contudo, estes podem ter vendedores distintos(terceiros)
Cada produto possui um fornecedor.
Um ou mais produtos podem compor um pedido.

**- Cliente**

 O cliente pode se cadastrar no site com seu CPF ou CNPJ.
 O Endereço do Cliente irá determinar o valor do frete.
 Um cliente pode realizar mais de um pedido, Este tem um período de
carência para devolução do produto.

**- Pedido**

O pedido são gerados por clientes e possuem informações de compra,
endereço e status de entrega.
Um produto ou mais compõem o pedido.
O pedido pode ser cancelado.


**- Fornecedor**

Podendo haver vários fornecedores, será criada uma entidade separada,
contendo identificação, nome e CNPJ.

**- Estoque**

Haverá também uma entidade estoque com identificador único, local e
quantidade total de produtos, podendo assim ter vários em localidades
diferentes.
Produto e estoque terão ligação em uma nova tabela com os códigos de
ambas, e a quantidade de produtos disponíveis para venda.

- Outras entidades como: Entrega, Transportador, Tipo de Pagamento
e Detalhes do cartão também contemplarão o cenário.



#**SGBD Utilizado para criação de diagrama: MySQL**
