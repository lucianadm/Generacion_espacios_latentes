% Supongamos que 'data' es tu matriz con 3 columnas y N filas
% Ejemplo de datos aleatorios:
% data = rand(N, 3);
clear
data = readNPY('codigo.npy');
%data=load('EL_ficticio.txt');
data_norm = (data - min(data)) ./ (max(data) - min(data));

% Extrae las columnas normalizadas
x = data_norm(:, 1);
y = data_norm(:, 2);
z = data_norm(:, 3);

% Crea el gráfico 3D
figure;
scatter3(x, y, z, 20, 'filled');

% Etiquetas de los ejes
xlabel('Eje EL1');
ylabel('Eje EL2');
zlabel('Eje EL3');

xticks(linspace(0, 1, 4));
yticks(linspace(0, 1, 4));
zticks(linspace(0, 1, 4));

% Muestra la rejilla
grid on;

% Muestra el gráfico
view(3);
%____hist 3D
%        CALCULA EL HISTOGRAMA CONDICIONAL
clear
data = readNPY('codigo.npy');
data_norm = (data - min(data)) ./ (max(data) - min(data));


% Inicializa la matriz del histograma
numBins = 3;

% Calcula los bordes de los bins para cada dimensión
edges1 = linspace(min(data_norm(:,1)), max(data_norm(:,1)), numBins + 1);
edges2 = linspace(min(data_norm(:,2)), max(data_norm(:,2)), numBins + 1);
edges3 = linspace(min(data_norm(:,3)), max(data_norm(:,3)), numBins + 1);

% Inicializa la matriz del histograma con el tamaño adecuado
hist1 = zeros(numBins, numBins, numBins);

% Contar las frecuencias en el espacio 3D
for i = 1:size(data_norm, 1)
    % Encuentra los índices de bin para cada dimensión
    idx1 = find(edges1 <= data_norm(i,1), 1, 'last');
    idx2 = find(edges2 <= data_norm(i,2), 1, 'last');
    idx3 = find(edges3 <= data_norm(i,3), 1, 'last');
    
    % Verifica que los índices no excedan los límites
    if idx1 > 0 && idx1 <= numBins && idx2 > 0 && idx2 <= numBins && idx3 > 0 && idx3 <= numBins
        % Incrementa el conteo en el histograma
        hist1(idx1, idx2, idx3) = hist1(idx1, idx2, idx3) + 1;
    end
end

%______
