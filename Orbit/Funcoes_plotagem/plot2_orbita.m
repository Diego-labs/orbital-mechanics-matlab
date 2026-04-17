function plot2_orbita(x_solucao)
    x = x_solucao(:, 1);
    y = x_solucao(:, 2);
    z = x_solucao(:, 3);

    % plota a órbita 3D
    plot3(x, y, z, 'LineWidth', 2, 'Color', 'b');
    
    % adiciona rótulos e título
    axis equal;
    grid on;
    xlabel('Posição X (Km)');
    ylabel('Posição Y (Km)');
    zlabel('Posição Z (Km)');
    title('Trajetória da Órbita e Representação da Terra');
    
end