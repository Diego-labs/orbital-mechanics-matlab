function simular_e_plotar_ponto_2D(R_iner, R_cart)
    
    % obter valores da latitude e longitude para cada posição
    [lat_iner, long_iner] = Vetor_estado_para_lat_long_ponto(R_iner);
    [lat_cart, long_cart] = Vetor_estado_para_lat_long_ponto(R_cart);
        
    % inicia a figura que plotada os pontos e a representacao da Terra
    figure;
    hold on;
    
    plot4_terra_plana();
    plot5_orbita_2d(lat_iner, long_iner);
    plot5_orbita_2d(lat_cart, long_cart);
    % termina edicao da figura com a orbita e a Terra
    hold off;
    
end