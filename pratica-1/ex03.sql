-- a)
ALTER TABLE jogador ADD endereco VARCHAR2(50);
-- todos as linhas da tabela receberam 'endereco' como null

-- b)
ALTER TABLE jogador ADD estado_civil VARCHAR2(15) DEFAULT 'SOLTEIRO' NOT NULL;
-- todas as linhas da tabela receberam 'estado_civil' como 'SOLTEIRO'

-- c)
INSERT INTO time(nome, estado, tipo, saldo_gols) VALUES ('palmeiras', 'SP', 'PROFISSIONAL', 150);
-- ALTER TABLE time ADD CHECK(saldo_gols < 100);         -- não é executada, pois não é possível validar a linha nova adicionada
ALTER TABLE time ADD CHECK(saldo_gols < 100) NOVALIDATE; -- é executada, pois ignora as linhas inválidas já presentes na tabela
-- INSERT INTO time(nome, estado, tipo, saldo_gols) VALUES ('fluminense', 'RJ', 'PROFISSIONAL', 130); -- não é executada, pois viola a nova restrição

-- d)
-- I)
INSERT INTO jogador(cpf, rg, nome, data_nasc, naturalidade, time) 
            VALUES ('12345678933', '456789123', 'gabriel barbosa almeida', TO_DATE('30/08/1996', 'DD/MM/YYYY'), 'sao bernardo do campo', 'flamengo');
INSERT INTO posicao_jogador(jogador, posicao) VALUES ('12345678933', 'centroavante');

INSERT INTO jogador(cpf, rg, nome, data_nasc, naturalidade, time) 
            VALUES ('12345678944', '567891234', 'david luiz moreira marinho', TO_DATE('22/04/1987', 'DD/MM/YYYY'), 'diadema', 'flamengo');
INSERT INTO posicao_jogador(jogador, posicao) VALUES ('12345678944', 'zagueiro');

-- III)
ALTER TABLE jogador DROP column cpf CASCADE CONSTRAINTS;
-- na tabela 'jogador', o índice e a constraint relacionados a 'cpf' (primary key) foram eliminados, assim como os dados dessa coluna em todas as linhas
-- na tabela 'posicao_jogador', o índice e a constraint relacionados a 'cpf' (foreign key) também foram eliminados, mas todas as linhas continuaram com os valores de 'cpf' de antes da remoção
