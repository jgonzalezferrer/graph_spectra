% For reproducibility
rng(999)

% DATASET 1
E1 = csvread('./data/example1.dat');
k1 = 4;
G1 = spectra(E1, k1);

% Plot final result
figure;
paletta1 = colorSpectrum(k1);
G1.Nodes.clusterColor = cell2mat(arrayfun(@(x) paletta1(x, :), G1.Nodes.cluster, 'UniformOutput', false));
plot(G1, 'NodeColor', G1.Nodes.clusterColor)

% DATASET 2
E2 = csvread('./data/example2.dat');
k2 = 2;
G2 = spectra(E2, k2);

% Plot final result
figure;
paletta2 = colorSpectrum(k2);
G2.Nodes.clusterColor = cell2mat(arrayfun(@(x) paletta2(x, :), G2.Nodes.cluster, 'UniformOutput', false));
plot(G2, 'NodeColor', G2.Nodes.clusterColor)