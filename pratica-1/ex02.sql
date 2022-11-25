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
