clc;            % limpa janela de comando
clear;          % limpa as variaveis
close all;      % fecha todas as figuras

addpath('Funcoes_plotagem\');
addpath('Funcoes_orbita\');

R = [10016.34, -17012.52, 7899.28];
V = [2.5, -1.05, 3.88];

% inicia a simulacaoo e visualizacaoo da trajetoria orbital
% a função lida com todo o processo,
% desde a integracaoo numerica ate a plotagem.
simular_e_plotar_orbita(R, V);


