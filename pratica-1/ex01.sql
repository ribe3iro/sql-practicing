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
