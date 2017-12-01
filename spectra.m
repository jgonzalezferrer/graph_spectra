function [ G ] = spectra(E, k, maxIter)

if ~exist('maxIter','var')
    maxIter = 1000;
end

% Converting Edge list to adjacency matrix
col1 = E(:,1);
col2 = E(:,2);
max_ids = max(max(col1,col2));
As = sparse(col1, col2, 1, max_ids, max_ids); 

% Affinity matrix, in this case the adjacency matrix.
A = full(As);

% Diagonal matrix
D = diag(sum(A, 2));

% L matrix
L = D^(-1/2)*A*D^(-1/2);

% K largest eigenvectors of L
[X, ~] = eigs(L, k, 'LA'); %LA means largest real

% Renormalizing each X's row to have unit length.
Y = bsxfun(@rdivide, X, sum(X.^2, 2).^(1/2));

% Cluster each point (row) of Y using k-means
idx = kmeans(Y, k, 'MaxIter', maxIter);

% Construct graph from A and cluster each point
G = graph(full(As));
G.Nodes.cluster = idx;