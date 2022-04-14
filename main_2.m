clear; clear clc; clear all;

% Draw them on a 2-d plot
x = [0, -1, -3, 1, 3];
y = [0, 2, 6, -2, -6];

figure;
scatter(x, y, 100, 'filled');
xlabel('X');
ylabel('Y');
saveas(gcf, 'problem-2-points-scatter.png');

% Implement Principal Component Analysis (PCA)
data = load('USPS.mat');
images = data.A;
p_components = [10, 50, 100, 200];
image_size = size(images,1);
error = zeros(image_size,1);

mean_A = images - mean(images);
reconstruction_error = zeros(length(p_components),1);
[U, S, V] = svd(mean_A);
coeff = V;
score = mean_A*coeff;

sub_image1 = reshape(images(1,:), 16, 16);
sub_image2 = reshape(images(2,:), 16, 16);

figure;
imshow(sub_image1', 'InitialMagnification','fit');
title(['Sub Image 1']);
saveas(gcf, 'problem-2-sub-image1.png');
figure;
imshow(sub_image2', 'InitialMagnification','fit');
title(['Sub Image 2']);
saveas(gcf, 'problem-2-sub-image2.png');

figure;
index = 1;
for i = 1:size(p_components,2)
    subplot(1, 4, index);
    pca_i = score(:,1:p_components(i))*coeff(:,1:p_components(i))';
    mean_i = mean(images);
    for j = 1:image_size
        pca_i(j, :) = pca_i(j, :)+mean_i;
    end
    diff = images - pca_i;
    for j = 1:image_size
        error(j) = norm(diff(j,:),'fro')^2;
    end
    reconstruction_error(i) = sum(error);
    sub_image1 = reshape(pca_i(1,:),16,16);
    imshow(sub_image1');
    title(['P =',num2str(p_components(i))]);
    pic_name = ['subset1','PCA',num2str(p_components(i)),'.png'];
    imwrite(sub_image1', pic_name);
    index = index + 1;
end

figure;
index = 1;
for i = 1:size(p_components,2)
    subplot(1, 4, index);
    pca_i = score(:,1:p_components(i))*coeff(:,1:p_components(i))';
    mean_i = mean(images);
    for j = 1:image_size
        pca_i(j, :) = pca_i(j, :)+mean_i;
    end
    diff = images - pca_i;
    for j = 1:image_size
        error(j) = norm(diff(j,:),'fro')^2;
    end
    sub_image2 = reshape(pca_i(2,:),16,16);
    imshow(sub_image2');
    title(['P =',num2str(p_components(i))]);
    pic_name = ['subset2','PCA',num2str(p_components(i)),'.png'];
    imwrite(sub_image2', pic_name);
    index = index + 1;
end

% The total reconstruction error
figure;
plot(reconstruction_error, '-o');
xlabel('Principal components');
ylabel('Reconstruction error');
saveas(gcf, 'problem-2-reconstruction-error.png');

