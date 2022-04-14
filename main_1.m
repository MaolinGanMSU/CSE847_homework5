clear; clear clc; clear all;


rng(620);
k_cluster = 3;
number_point = 500;

left_data = randi([0,100], number_point, 2);
middle_data = randi([200,400], number_point, 2);
right_data = randi([500,800], number_point, 2);
data = [left_data;middle_data;right_data];

[kmeans_clusters, kmeans_centroid] = k_means(data, k_cluster);
[spectral_labels, spectral_centroid] = k_means_spectral(data, k_cluster);

figure(1)
hold on;
scatter(data(:,1), data(:,2),[],kmeans_clusters, 'filled')
scatter(kmeans_centroid(:, 1), kmeans_centroid(:, 2), 100, 'o', 'linewidth', 3)
title('K-means clustering')
saveas(gcf, 'problem-1-kmeans-1.png');

figure(2)
hold on;
scatter(data(:,1), data(:,2),[],spectral_labels, 'filled')
scatter(spectral_centroid(:, 1), spectral_centroid(:, 2), 100, 'o', 'linewidth', 3)
title('Spectral clustering')
saveas(gcf, 'problem-1-spectral-1.png');


data = [];
for i = 1:k_cluster
    randnumber = randi([1,5],1);
    theta = linspace(randnumber,randnumber+1,300);
    x = exp(theta).*sin(1000*theta);
    y = exp(theta).*cos(1000*theta);
	data = [data;[x' y']];
end
figure(3)
hold on;
[kmeans_clusters, kmeans_centroid] = k_means(data, k_cluster);
scatter(data(:,1), data(:,2),[],kmeans_clusters, 'filled')
scatter(kmeans_centroid(:, 1), kmeans_centroid(:, 2), 100, 'o', 'linewidth', 3)
title('K-means clustering')
saveas(gcf, 'problem-1-kmeans-2.png');

figure(4)
hold on;
[spectral_labels, spectral_centroid] = k_means_spectral(data, k_cluster);
scatter(data(:,1), data(:,2),[],spectral_labels, 'filled')
scatter(spectral_centroid(:, 1), spectral_centroid(:, 2), 100, 'o', 'linewidth', 3)
title('Spectral clustering')
saveas(gcf, 'problem-1-spectral-2.png');


data = []
for i = 1:k_cluster
    randnumber = randi([1,1000],1);
    theta = linspace(0., 2*pi);
    x = sin(theta)*randnumber;
    y = cos(theta)*randnumber;
	data = [data;[x' y']];
end
figure(5)
hold on;
[kmeans_clusters, kmeans_centroid] = k_means(data, k_cluster);
scatter(data(:,1), data(:,2),[],kmeans_clusters, 'filled')
scatter(kmeans_centroid(:, 1), kmeans_centroid(:, 2), 100, 'o', 'linewidth', 3)
title('K-means clustering')
saveas(gcf, 'problem-1-kmeans-3.png');

figure(6)
hold on;
[spectral_labels, spectral_centroid] = k_means_spectral(data, k_cluster);
scatter(data(:,1), data(:,2),[],spectral_labels, 'filled')
scatter(spectral_centroid(:, 1), spectral_centroid(:, 2), 100, 'o', 'linewidth', 3)
title('Spectral clustering')
saveas(gcf, 'problem-1-spectral-3.png');