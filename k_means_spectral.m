function [clusters, centroids] = k_means_spectral(data, k)
[n, d] = size(data);
adj = squareform(pdist(data));
degree = diag(ones(n, 1) * n-1);
lap = degree - adj;
[V, D] = eig(lap);
[clusters, centroids] = k_means(V(:, 1:k), k);
    