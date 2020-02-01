-- Selecionar toda a informação dos cromos
SELECT *
FROM Cromo;

-- Selecionar um atributo dos cromos
SELECT Nr
FROM Cromo;

SELECT Tipo
FROM Cromo;

-- Selecionar o número dos cromos ordenados por um atributo
SELECT Nr
FROM Cromo
ORDER BY Tipo asc;

SELECT Nr
FROM Cromo
ORDER BY PagCaderneta asc;

-- Número de cromos
SELECT count(Nr)
FROM Cromo;

-- Cromos ordenados pelo nome do jodador
SELECT c.Nr, j.Nome
FROM Cromo c, Jogador j
ORDER BY j.Nome asc;

-- Cromos de um jogador ordenados pelo número do primeiro
SELECT c.Nr
FROM Cromo c, Jogador j
WHERE Nome='Anderson Luis'
ORDER BY c.Nr asc;

SELECT c.Nr
FROM Cromo c, Jogador j
WHERE Nome='Anderson Luis'
ORDER BY c.Nr asc;

SELECT count(cromo.Nr)
FROM Cromo
WHERE cromo.adquirido='N';

SELECT count(j.Nr), p.designacao
FROM Jogador j, Localidade l, Pais p
WHERE j.LocalNascimento = l.Id AND 
l.pais = p.Id 
GROUP BY p.designacao;

-- > PL6

-- 1) Quais	os cromos que fazem	parte da caderneta? Ordene-o por equipa, posição e nome do jogador
SELECT *
FROM Cromo, Equipa, Posicao, Jogador
WHERE Cromo.jogador = Jogador.Nr and Jogador.Posicao = Posicao.id and Jogador.Equipa = Equipa.Id
ORDER BY Equipa.designacao, Posicao.designacao, Jogador.nome;

-- 2) Quais	são	os nomes dos jogadores cujos cromos	ainda não foram	adquiridos?
SELECT Jogador.nome
FROM Cromo INNER JOIN Jogador ON Cromo.jogador = Jogador.Nr
WHERE Cromo.Adquirido = 'N';

SELECT *
FROM Cromo, Jogador
WHERE Cromo.jogador = Jogador.Nr and Cromo.Adquirido = 'N';

-- 3) Quantos cromos faltam adquirir para cada uma das equipas da coleção?
SELECT e.designacao, COUNT(j.nome)
FROM Cromo c, Jogador j, Equipa e
WHERE c.Adquirido = 'N' and c.jogador = j.nr and j.equipa = e.id
GROUP BY e.designacao;

-- 4) Quais são os números dos cromos que têm jogadores do ‘Clube de Futebol os Belenenses’ ou do ‘Vitória Sport Clube’?
SELECT c.nr
FROM Cromo c, Jogador j, Equipa e
WHERE c.jogador = j.nr and j.equipa = e.id 
		and ((e.designacao = 'Clube de Futebol os Belenenses') 
        or (e.designacao = 'Vitoria Sport Clube'));
        
-- > PL7

-- 1) Em que páginas da	caderneta estão	os jogadores do	‘Sporting Clube	de Braga’ e	do ‘Rio	Ave Futebol	Clube’ que jogam na	posição	‘Defesa’	
Futebol	Clube’	que	jogam	na	posição	‘Defesa’?
SELECT c.PagCaderneta, j.nome
From Cromo c, Jogador j, Equipa e, posicao p
WHERE c.jogador = j.Nr and j.equipa = e.id and j.Posicao = p.Id
        and (p.Designacao = 'Defesa')
		and (e.Designacao = 'Sporting Clube de Braga'
			or e.designacao = 'Rio Ave Futebol Clube');

-- 2) Quais	os	números	dos	cromos	dos	jogadores	que	não	jogam como ‘Médio’ ou ‘Defesa’,
-- cujos treinadoresn são ‘Jorge Jesus’ e ‘Nuno Espírito Santo’. Apresente a lista ordenada, de forma crescente,
-- por número de cromo.
SELECT Cromo.nr, Jogador.nome, Posicao.designacao
FROM Cromo, Jogador, Equipa, Posicao
WHERE Cromo.Jogador = Jogador.Nr
	AND Jogador.equipa = Equipa.id
    AND (Posicao.Designacao <> 'Médio' AND Posicao.Designacao <> 'Defesa')
    AND Jogador.posicao = Posicao.id
    AND (Equipa.Treinador = 'Jorge Jesus' OR Equipa.Treinador = 'Nuno Espírito Santo')
    ORDER BY Cromo.nr;


SELECT Cromo.nr, Jogador.nome, Posicao.designacao
FROM Cromo, Jogador, Equipa, Posicao
WHERE Cromo.Jogador = Jogador.Nr
	AND Jogador.equipa = Equipa.id
    AND Jogador.posicao = Equipa.id
    AND (Posicao.designacao = 'Médio' OR Posicao.designacao = 'Defesa');
    
SELECT Cromo.nr, Jogador.nome, Posicao.designacao
FROM Cromo, Jogador, Equipa, Posicao
WHERE Cromo.Jogador = Jogador.Nr
	AND Jogador.equipa = Equipa.id
    AND Jogador.posicao = Posicao.id
    AND (Equipa.Treinador = 'Jorge Jesus' or Equipa.Treinador = 'Nuno Espírito Santo')
    AND Cromo.Nr NOT IN (SELECT Cromo.nr
					FROM Cromo, Jogador, Equipa, Posicao
					WHERE Cromo.Jogador = Jogador.Nr
						And Jogador.equipa = Equipa.id
						AND Jogador.posicao = Posicao.id
						AND (Posicao.designacao = 'Médio' OR Posicao.designacao = 'Defesa'));
                        
-- 3) Definir uma vista (view) que permita apresentar a	lista dos cromos em	falta, apresentando	o
-- número do cromo, nome do	jogador	e nome da equipa à qual pertencem.
CREATE VIEW ListarCromoFalta As
SELECT Cromo.nr, Jogador.nome, Equipa.designacao
FROM Cromo, Jogador, Equipa
WHERE Cromo.Jogador = Jogador.Nr AND Jogador.equipa = Equipa.id
	AND Cromo.Adquirido = 'N';
    
-- 4) Implementar um procedimento (procedure) que, dado o nome de uma equipa apresente a
-- lista completa dos cromos que a ela dizem respeito, ordenando-a por número de página	e número do cromo	
CREATE PROCEDURE ListaCromosEquipa (In equipaX varchar(45))
SELECT Cromo.*
FROM Cromo, Jogador, Equipa
WHERE Cromo.jogador = Jogador.Nr AND Jogador.equipa = Equipa.id
	AND Equipa.designacao = equipaX
    ORDER BY Cromo.PagCaderneta, Cromo.nr;
    
CALL ListaCromosEquipa('Sport Lisboa e Benfica');

-- 5) Implementar	um	procedimento	que	apresente	a	caderneta	completa	da	coleção	de	cromos,	
-- indicando o número do cromo,	o tipo do cromo, o nome	do jogador,	o nome da equipa e se	
-- o cromo já foi ou não adquirido.
CREATE PROCEDURE ListarCadernetaCompleta()
SELECT Cromo.nr, Cromo.descricao, Jogador.nome, Equipa.designacao, Cromo.adquirido
FROM Cromo, Jogador, Equipa, TipoCromo
WHERE Cromo.Jogador = Jogador.nr and Jogador.equipa = Equipa.id and Cromo.tipo = TipoCromo.Nr;

CREATE PROCEDURE ListarCadernetaCompleta2()
SELECT Cromo.nr, TipoCromo.Descricao, Jogador.nome, Equipa.designacao, Cromo.adquirido
FROM Cromo LEFT OUTER JOIN Jogador ON Cromo.jogador = Jogador.Nr
			LEFT OUTER JOIN Equipa ON Jogador.equipa = Equipa.id
            INNER JOIN TipoCromo ON Cromo.tipo = TipoCromo.Nr;
            
CALL ListarCadernetaCompleta2();

-- 6) Implementar uma função (function)	que, dado o	número de um cromo,	indique	se o cromo é	
-- ou não repetido.
SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$
CREATE FUNCTION RepetidoCromo (numeroCromo int) RETURNS char(1)
NOT deterministic
BEGIN

DECLARE Adq char(1);

SELECT Cromo.Adquirido into Adq
FROM Cromo
WHERE Cromo.nr = numeroCromo;

RETURN Adq;
END $$
DELIMITER ;

SELECT RepetidoCromo(37);

-- 8) Implementar um gatilho (trigger) que registe numa tabela de auditoria (“audCromos”),	
-- criada especificamente para o efeito, a data	e a	hora em	que	um dado	cromo foi adquirido.
-- Este gatilho deverá ser ativado sempre que o valor do atributo “Adquirido” da tabela	
-- “Cromo” mude	de ‘N’ para	‘S’
CREATE TABLE audCromos (numeroCromo int, date DATETIME);

DELIMITER $$
CREATE TRIGGER after_cromo_update
AFTER UPDATE ON Cromo
FOR EACH ROW
BEGIN

if(OLD.Adquirido = 'N' and NEW.Adquirido = 'S')
then INSERT INTO audCromos VALUES (NEW.nr, NOW());
end if;

END $$
DELIMITER ;

DROP TRIGGER after_cromo_update;

UPDATE Cromo SET Adquirido='S' WHERE Nr = 37;

-- 7) Implementar  uma  função (function) que, dado o número  de um cromo, devolva o tipo do	
-- cromo, o nome do jogador	e o nome da equipa.
DELIMITER $$
CREATE FUNCTION ReturnCromo (numeroCromo int) RETURNS varchar(200)
NOT DETERMINISTIC 

BEGIN

DECLARE tipoCromo varchar(75);
DECLARE nomeJogador varchar(75);
DECLARE nomeEquipa varchar(45);

SELECT TipoCromo.Designacao, Jogador.nome, Equipa.designacao INTO tipoCromo, nomeJogador, nomeEquipa
FROM TipoCromo, Cromo, Jogador, Equipa
WHERE TipoCromo.Nr = Cromo.tipo and Cromo.jogador = Jogador.nr and Jogador.equipa = Equipa.Id
	AND Cromo.Nr = numeroCromoX;
    
RETURN CONCAT (tipoCromo, ', ', nomeJogador, ', ', nomeEquipa);
END $$
DELIMITER ;

SELECT ReturnCromo (37);