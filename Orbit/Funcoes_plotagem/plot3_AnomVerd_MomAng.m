function plot3_AnomVerd_MomAng(t, solucao)
    %addpath('elementos_orbitais\');
    R_sol = solucao(:, 1:3);
    V_sol = solucao(:, 4:6);
    
    % elementos da funcao
    % h incli  e nodo_ascen w theta a
    elementos = zeros(1, 7);
    
    for i = 1:size(R_sol, 1)
        elementos(i, :) = calcular_elementos_orbitais(R_sol(i, :), V_sol(i, :));
        
    end
    
    anomalia_verdadeira = rad2deg(elementos(:, 6));
    h = elementos(:, 1);
       
    figure;
    plot(t/60, anomalia_verdadeira, 'ro'); % 'ro' vermelho circular
    
    grid on; 
    xlabel('Tempo (min)'); 
    ylabel('Anomalia verdadeira (º)'); 
    title('Variacao da anomalia verdadeira'); 

    figure;
    plot(t/60, h, 'ro'); % 'ro' vermelho circular
    grid on; 
    xlabel('Tempo (min)'); 
    ylabel('Momento angular especifico (Km^2 / s)');
    title('Variacao do momento angular especifico'); 
end