clc;            % limpa janela de comando
clear;          % limpa as variaveis
close all;      % fecha todas as figuras

addpath('Funcoes_plotagem\');
addpath('Funcoes_orbita\');

% TLE do NOAA 15
tle = [
        "1 25338U 98030A   25277.48592711  .00000361  00000-0  16595-3 0  9990";
        "2 25338  98.5302 299.7772 0010640  23.2038 336.9621 14.27029511424824"
        ];

% W -> nodo ascendente
% c -> inclinacao
% w -> argumento de periastro

[R_peri,V_peri, W, c, w] = tle_para_RV_perifocal(tle);
% obtem a matriz de rotacao para converter do perifocal para inercial
Mat_per2iner = matriz_rotacao_perifocal_para_inercial(0, W, c, w);

u = 3.986 * (10^5); 
R = Mat_per2iner * R_peri;
V = Mat_per2iner * V_peri;

% inicia a simulacaoo e visualizacaoo da trajetoria orbital
% a função lida com todo o processo,
% desde a integracaoo numerica ate a plotagem.
simular_e_plotar_orbita(R, V);