-------------------------------- EXERCÍCIO 1 --------------------------------
CREATE TABLE time(
    nome VARCHAR2(50) NOT NULL,
    estado CHAR(2),
    tipo VARCHAR2(15) NOT NULL,
    saldo_gols NUMBER(4, 0 ) DEFAULT 0 NOT NULL,
    
    CONSTRAINT PK_TIME PRIMARY KEY (nome),
    CHECK (tipo IN ('AMADOR', 'PROFISSIONAL')),
    CHECK (saldo_gols >= 0)
);

CREATE TABLE joga(
    time1 VARCHAR2(50) NOT NULL,
    time2 VARCHAR2(50) NOT NULL,
    classico NUMBER(1,0) NOT NULL,
    
    CONSTRAINT PK_JOGA PRIMARY KEY (time1, time2),
    CONSTRAINT FK_TIME1_JOGA FOREIGN KEY (time1) REFERENCES time
                ON DELETE CASCADE,
    CONSTRAINT FK_TIME2_JOGA FOREIGN KEY (time2) REFERENCES time
                ON DELETE CASCADE,
    CHECK (time1 <> time2),
    CHECK (classico IN (0, 1))
);

CREATE TABLE partida(
    time1 VARCHAR2(50) NOT NULL,
    time2 VARCHAR2(50) NOT NULL,
    data_partida DATE,
    placar VARCHAR2(5) DEFAULT '0X0' NOT NULL,
    local VARCHAR2(50),
    
    CONSTRAINT PK_PARTIDA PRIMARY KEY (time1, time2, data_partida),
    CONSTRAINT FK_TIME1_TIME2_PARTIDA FOREIGN KEY (time1, time2) REFERENCES joga
                ON DELETE CASCADE,
    CHECK (REGEXP_LIKE(placar, '[0-9]X[0-9]'))
);

CREATE TABLE jogador(
    cpf CHAR(11) NOT NULL,
    rg VARCHAR2(11) NOT NULL,
    nome VARCHAR2(50) NOT NULL,
    data_nasc DATE NOT NULL,
    naturalidade VARCHAR2(50),
    time VARCHAR2(50) NOT NULL,
    
    CONSTRAINT PK_JOGADOR PRIMARY KEY (cpf),
    CONSTRAINT FK_TIME_JOGADOR FOREIGN KEY (time) REFERENCES time
                ON DELETE CASCADE, -- já que um jogador não pode existir sem um time
    UNIQUE (rg, nome),
    CHECK (REGEXP_LIKE(cpf, '[0-9]{11}'))
);

CREATE TABLE posicao_jogador(
    jogador CHAR(11) NOT NULL,
    posicao VARCHAR2(20) NOT NULL,
    
    CONSTRAINT PK_POSICAO_JOGADOR PRIMARY KEY (jogador, posicao),
    CONSTRAINT FK_JOGADOR_POSICAO_JOGADOR FOREIGN KEY (jogador) REFERENCES jogador
                ON DELETE CASCADE
);

CREATE TABLE diretor(
    time VARCHAR2(50) NOT NULL,
    nome VARCHAR2(50) NOT NULL,
    
    CONSTRAINT PK_DIRETOR PRIMARY KEY(time, nome),
    CONSTRAINT FK_TIME_DIRETOR FOREIGN KEY (time) REFERENCES time
                ON DELETE CASCADE
);

CREATE TABLE uniforme(
    time VARCHAR2(50) NOT NULL,
    tipo CHAR(7) NOT NULL,
    cor_principal VARCHAR(20) NOT NULL,

    CONSTRAINT PK_UNIFORME PRIMARY KEY(time, tipo),
    CONSTRAINT FK_TIME_UNIFORME FOREIGN KEY (time) REFERENCES time
                ON DELETE CASCADE,
    CHECK(tipo IN ('TITULAR', 'RESERVA'))
);

-------------------------------- EXERCÍCIO 2 --------------------------------
INSERT INTO time (nome, estado, tipo, saldo_gols) VALUES ('santos', 'SP', 'PROFISSIONAL', 0);
INSERT INTO time (nome, estado, tipo, saldo_gols) VALUES ('corinthians', 'SP', 'PROFISSIONAL', 2);
INSERT INTO time (nome, estado, tipo, saldo_gols) VALUES ('flamengo', 'RJ', 'PROFISSIONAL', 2);
-- linhas que não são executadas por conta das restrições
-- INSERT INTO time (nome, estado, tipo, saldo_gols) VALUES ('a', 'algo', 'PROFISSIONAL', 0);
-- INSERT INTO time (nome, estado, tipo, saldo_gols) VALUES ('a', 'SP', 'algo', 0);
-- INSERT INTO time (nome, estado, tipo, saldo_gols) VALUES ('a', 'SP', 'PROFISSIONAL', -1);


INSERT INTO joga (time1, time2, classico) VALUES ('santos', 'corinthians', 1);
-- linhas que não são executadas por conta das restrições
-- INSERT INTO joga (time1, time2, classico) VALUES ('santos', 'santos', 1);
-- INSERT INTO joga (time1, time2, classico) VALUES ('time inexistente', 'flamengo', 0);


INSERT INTO partida (time1, time2, data_partida, placar, local) VALUES ('santos', 'corinthians', TO_DATE('02/03/2022', 'DD/MM/YYYY'), '0X0', 'vila belmiro');
-- linhas que não são executadas por conta das restrições
-- INSERT INTO partida (time1, time2, data_partida, placar, local) VALUES ('santos', 'flamengo', TO_DATE('02/03/2022', 'DD/MM/YYYY'), '0X0', 'vila belmiro');
-- INSERT INTO partida (time1, time2, data_partida, placar, local) VALUES ('santos', 'corinthians', TO_DATE('02/03/2022', 'DD/MM/YYYY'), '0 a 0', 'vila belmiro');


INSERT INTO jogador (cpf, rg, nome, data_nasc, naturalidade, time) VALUES ('12345678900', '123456789', 'neymar da silva santos junior', TO_DATE('05/02/1992', 'DD/MM/YYYY'), 'mogi das cruzes', 'santos');
INSERT INTO jogador (cpf, rg, nome, data_nasc, naturalidade, time) VALUES ('12345678911', '234567891', 'cassio roberto ramos', TO_DATE('06/06/1987', 'DD/MM/YYYY'), 'veranopolis', 'corinthians');
INSERT INTO jogador (cpf, rg, nome, data_nasc, naturalidade, time) VALUES ('12345678922', '345678912', 'bruno henrique pinto', TO_DATE('30/12/1990', 'DD/MM/YYYY'), 'belo horizonte', 'flamengo');
-- linhas que não são executadas por conta das restrições
-- INSERT INTO jogador (cpf, rg, nome, data_nasc, naturalidade, time) VALUES ('12345678933', '456789123', 'joao da silva', TO_DATE('01/01/1990', 'DD/MM/YYYY'), 'sao paulo', 'time inexistente');
-- INSERT INTO jogador (cpf, rg, nome, data_nasc, naturalidade, time) VALUES ('123456789123', '456789123', 'joao da silva', TO_DATE('01/01/1990', 'DD/MM/YYYY'), 'sao paulo', 'flamengo');
-- INSERT INTO jogador (cpf, rg, nome, data_nasc, naturalidade, time) VALUES ('12345678911', '123456789123', 'joao da silva', TO_DATE('01/01/1990', 'DD/MM/YYYY'), 'sao paulo', 'flamengo');


INSERT INTO posicao_jogador (jogador, posicao) VALUES ('12345678900', 'ponta esquerda');
INSERT INTO posicao_jogador (jogador, posicao) VALUES ('12345678911', 'goleiro');
INSERT INTO posicao_jogador (jogador, posicao) VALUES ('12345678922', 'ponta esquerda');
-- linhas que não são executadas por conta das restrições
-- INSERT INTO posicao_jogador (jogador, posicao) VALUES ('00000000000', 'ponta esquerda');


INSERT INTO diretor (time, nome) VALUES ('santos', 'paulo autuori');
INSERT INTO diretor (time, nome) VALUES ('corinthians', 'duilio monteiro alves');
INSERT INTO diretor (time, nome) VALUES ('flamengo', 'rodolfo landim');
-- linhas que não são executadas por conta das restrições
-- INSERT INTO diretor (time, nome) VALUES ('time inexistente', 'diretor');


INSERT INTO uniforme (time, tipo, cor_principal) VALUES ('santos', 'TITULAR', 'branco');
INSERT INTO uniforme (time, tipo, cor_principal) VALUES ('santos', 'RESERVA', 'azul');
INSERT INTO uniforme (time, tipo, cor_principal) VALUES ('corinthians', 'TITULAR', 'branco');
INSERT INTO uniforme (time, tipo, cor_principal) VALUES ('flamengo', 'TITULAR', 'vermelho');
-- linhas que não são executadas por conta das restrições
-- INSERT INTO uniforme (time, tipo, cor_principal) VALUES ('time inexistente', 'TITULAR', 'branco');
-- INSERT INTO uniforme (time, tipo, cor_principal) VALUES ('santos', 'tipo', 'branco');



-- deletando os times de SP
DELETE FROM time WHERE estado = 'SP';

-- tabelas afetadas:
-- time, com 2 linhas afetadas
-- joga, com 1 linha afetada
-- partida, com 1 linha afetada
-- jogador, com 2 linha afetada
-- posicao_jogador, com 2 linhas afetadas
-- diretor, com 2 linhas afetadas
-- uniforme, com 3 linhas afetadas

-------------------------------- EXERCÍCIO 3 --------------------------------
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
