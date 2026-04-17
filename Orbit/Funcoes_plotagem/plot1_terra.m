function plot1_terra()

    % parametos do elipsoide WGS84
    wgs84 = wgs84Ellipsoid('kilometer');
    a = wgs84.SemimajorAxis;
    b = wgs84.SemiminorAxis;
    resolution = 100;
    
    % gera a superficie do elipsoide
    % ponto de origem do elipsoide eh (0,0,0)
    % a, a, b sao os semi-eixos para tamanho e forma
    [x, y, z] = ellipsoid(0, 0, 0, a, a, b, resolution);
    
    % carrega a imagem de textura
    img = imread('2k_earth_daymap.jpg');
    
    % invertendo a imagem para que o polo norte fique na parte superior
    img_flipped = flipud(img);

    % redimensionar a imagem de textura para coincidir com a resolucao
    % da superficie do elipsoide
    img_resized = imresize(img_flipped, [size(x, 1), size(x, 2)]);
    
    % criar objeto de superficie com a textura
    % correspondencia das coordenadas da superficie do elipsoide com as 
    % coordenadas da textura eh feita pela funcao surf
    h = surf(x, y, z, 'EdgeColor', 'none', 'FaceColor', 'texturemap', 'CData', img_resized);

    % adiciona eixos de referencia
    quiver3(0, 0, 0, 2*a, 0, 0, 'LineWidth', 2, 'Color', 'r', 'MaxHeadSize', 0.5); % eixo X (vermelho)
    text(2*a, 0, 0, 'X', 'FontSize', 12, 'Color', 'r');
    quiver3(0, 0, 0, 0, 2*a, 0, 'LineWidth', 2, 'Color', 'g', 'MaxHeadSize', 0.5); % eixo Y (verde)
    text(0, 2*a, 0, 'Y', 'FontSize', 12, 'Color', 'g');
    quiver3(0, 0, 0, 0, 0, 2*a, 'LineWidth', 2, 'Color', 'b', 'MaxHeadSize', 0.5); % eixo Z (azul)
    text(0, 0, 2*a, 'Z', 'FontSize', 12, 'Color', 'b');
    
    % ajustes 
    shading interp;
    colormap([0.2 0.5 1]);
    lightangle(-45, 30);
    lighting gouraud;
    material shiny;
    light;
    

end







