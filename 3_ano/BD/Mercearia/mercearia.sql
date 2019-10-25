-- Quais são os clientes da merciaria
select * 
from Cliente;

select nome
from Cliente;
-- Quais são os nomes dos clientes que moram em 'Aguada do Queixo'
select nome 
from Cliente As C 
where C.Localidade = 'Aguada do Queixo';

-- Quais são os nomes dos produtos, e preço, que são catalogados na base de dados? Ordenados alfabeticamente
select Designacao, Preco
from Produto 
order by Designacao;

-- Quais as vendas e respetivos valores que foram realizadas no dia 2017/10/05
select * 
from venda as V
where V.Data = '2017-10-05';

-- Inserir um cliente
INSERT INTO cliente(Numero,Nome,DataNascimento,Profissao,Rua,Localidade,CodPostal,Contribuinte,eMail,Compras)
	VALUE
    (8,"João Silva","2017-03-01","Mecanico","Rua da Travessa","Aguada do Queixo","4506-230",121332,"aa@gmail.com",null);
    
-- Modificar a rua do cliente anterior
UPDATE cliente as C
SET C.Rua = "Rua do Carioca"
where C.Numero = 8;

-- Aumentar o preço em 10% em todos os produtos do tipo Peixe

-- Inserir uma venda para o cliente criando na alina1, na qual ele adquiriu 4 produtos distintos

-- Remover da base de dados todos os registos relativos à venda realizada na alinea anterior
