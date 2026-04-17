clc;            % limpa janela de comando
clear;          % limpa as variaveis
close all;      % fecha todas as figuras

% comparar vetor posicao 
% https://www.oc.nps.edu/oc2902w/coord/llhxyz.htm
% comparar tempo sideral
% https://www.walter-fendt.de/html5/aen/siderealtime_en.htm

addpath('Funcoes_coordenadas/');
addpath('Funcoes_orbita/');
addpath('Funcoes_plotagem/');
addpath('Funcoes_simulacoes/');

% latitude e longitude em graus, altitude em metros
% latitude geodesica ; longitude ; altitude
coord_geograf = [-23.20639 -45.8611 616];

% UT - tempo solar medio com local de observacao em Greenwich
% hora ; minutos ; segundos
tempo = [12 15 13];

% data: dia ; mes ; ano
data = [4 10 2025];

% obter o tempo sideral de Greenwich = angulo horario (graus)
ang_horario = tempo_sideralGN(data, tempo);

% obter o vetor em coordenadas cartesianas terrestres
R = geografica_para_cartesiana(coord_geograf);
fprintf('\nR cart: [%.6f %.6f %.6f]\n', R(1), R(2), R(3));
versor_R = (R')/norm(R);
fprintf('\nVersor cart: [%.6f %.6f %.6f]\n', versor_R(1), versor_R(2), versor_R(3));

% encontrando o versor em coordenadas cartesianas geocentricas inerciais
Ri = rotacao_para_inercial(ang_horario, R');
fprintf('\nR iner: [%.6f %.6f %.6f]\n', Ri(1), Ri(2), Ri(3));
versor_Ri = (Ri)/norm(Ri);
fprintf('\nVersor iner: [%.6f %.6f %.6f]\n', versor_Ri(1), versor_Ri(2), versor_Ri(3));

simular_e_plotar_ponto_2D(Ri', R)


