use sistema_estoque;


DELIMITER $$
CREATE PROCEDURE insere_usuario(in vnome varchar(100), in vsobrenome varchar(100), in vemail varchar(100), 
in vsenha varchar(100), in vendereco varchar(100), in vcidade varchar(100), in vestado varchar(100), in vcep varchar(100))
BEGIN
	DECLARE sql_erro TINYINT DEFAULT FALSE;
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET sql_erro = TRUE;
    START TRANSACTION;
		INSERT INTO usuario (nome, sobrenome, email, senha, endereco, cidade, estado, cep) 
        VALUES (vnome, vsobrenome, vemail, vsenha, vendereco, vcidade, vestado, vcep);
        IF sql_erro = FALSE THEN
			COMMIT;
            SELECT 'Transação efetuada com sucesso!' AS Resultado;
        ELSE
			ROLLBACK;
            SELECT 'Erro na transação!' AS Resultado;
        END IF;    
END
$$


DELIMITER $$
	CREATE PROCEDURE lista_usuario()
	BEGIN
		SELECT usuario.id, usuario.nome, usuario.sobrenome, usuario.email,
        usuario.endereco, usuario.cidade, estado.nome AS estado, usuario.cep,
        usuario.receberAtualizacoes, usuario.status FROM usuario 
        join estado 
		on estado = estado.id;
        
    END
$$