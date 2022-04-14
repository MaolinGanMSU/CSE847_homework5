function [clusters, centroids] = k_means(data, k)
[n, d] = size(data);
rand_permutation = randperm(n);
centroids = data(rand_permutation(1:k), :);
old_centroids = zeros(k,d);
clusters = zeros(n, 1);
iter = 0;
max_iter = 1000;
threshold = 0.00001;
while 1
    for i = 1:n
        min_dist = -1;
        for j = 1:k
            data_row = data(i, :);
            centroids_row = centroids(j, :);
            dist = sum(abs(data_row - centroids_row).^2);
            if dist < min_dist || min_dist == -1
                min_dist = dist;
                clusters(i) = j;
            end
        end
    end

    for i = 1:k
        cluster = data(clusters==i, :);
        new_centroid_row= sum(cluster, 1) / size(cluster, 1);
        centroids(i, :) = new_centroid_row;
    end

    iter = iter + 1;
    
    if norm(centroids - old_centroids) < threshold
        break;
    elseif iter > max_iter
        break;
    else
        old_centroids = centroids;
    end
end