function simular_e_plotar_orbita(R, V)
    % vetor de estado
    X = [R, V];
    % parametro gravitacional para a Terra (km^3/s^2)
    u = 3.986 * (10^5);
    
    % obtem h i e Nodo_Ascen w Anom_Verdadeira a
    elementos_orbitais_iniciais = calcular_elementos_orbitais(R, V);
    
    % frequencia angular da orbita/frequencia de Kepler
    n = sqrt( u / (elementos_orbitais_iniciais(7)^3) );
    % periodo de 50 orbitas
    T = 50*(2 * pi) / n;
    % tempo para 1 período orbital
    tempo = T /(60*50);
    % intervalo de simulacao
    t_simulacao = [0, T];

    % Mostra os elementos orbitais
    disp("Elementos orbitais iniciais:");
    fprintf('Inclinacao: %.2f graus\n', rad2deg(elementos_orbitais_iniciais(2)));
    fprintf('Excentricidade: %f\n', elementos_orbitais_iniciais(3));
    fprintf('ARNA: %.2f graus\n', rad2deg(elementos_orbitais_iniciais(4)));
    fprintf('Argumento do periapsis: %.2f graus\n', rad2deg(elementos_orbitais_iniciais(5)));
    fprintf('Anomalia verdadeira: %.2f graus\n', rad2deg(elementos_orbitais_iniciais(6)));
    fprintf('Semi-eixo maior: %.2f km\n\n', elementos_orbitais_iniciais(7));
    fprintf('Tempo para integrar uma órbita: %.2f minutos\n', tempo);
    
    % define as opções de precisão para o solver ode45
    % RelTol (tolerancia relativo) controla a precisão para grandes valores
    % AbsTol (tolerancia absoluto) controla a precisão para valores próximos de zero
    options = odeset('RelTol', 1e-10, 'AbsTol', 1e-10);
    % Resolve as equações diferenciais
    % ode45 integra as equações definidas na função @orbita_ret_vel_acel,
    % velocidade e aceleracao
    % t_simulacao é o intervalo de tempo e X são as condições iniciais (R,V)
    [t, solucao] = ode45(@derivadas_orbita_dois_corpos, t_simulacao, X, options);
    
    % inicia a figura que plotada a orbita e a representacao da Terra
    figure;
    hold on;
    
    plot1_terra();
    plot2_orbita(solucao);
    % termina edicao da figura com a orbita e a Terra
    hold off;
    
    % plota variacao da anomalia verdadeira e momento angular especifico ao
    % longo do tempo devolvido pelo ODE45
    plot3_AnomVerd_MomAng(t, solucao);

end