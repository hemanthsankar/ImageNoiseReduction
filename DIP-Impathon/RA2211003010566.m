water_img = imread('waterbody.png');

% Display original image
figure;
subplot(2, 2, 1);
imshow(water_img);
title('Original Image');

% Create a subset image (15x15) from the original image
subset_img = water_img(30:44, 30:44);

% Add noise to the subset image
noisy_img = subset_img;
[m, n] = size(noisy_img);
noise_density = 0.1; % Noise density
num_noise_pixels = ceil(noise_density * m * n);
noise_indices = randperm(m*n, num_noise_pixels);
noisy_img(noise_indices) = randi([0, 1], num_noise_pixels, 1);

% Display noisy image
subplot(2, 2, 2);
imshow(noisy_img);
title('Noisy Image');

% Remove noise using Gaussian filter
gaussian_filtered = imgaussfilt(noisy_img, 1); % Standard deviation of 1

% Display image after Gaussian filtering
subplot(2, 2, 3);
imshow(gaussian_filtered);
title('Gaussian Filtered');

% Remove noise using Mean filter
mean_filtered = imfilter(noisy_img, fspecial('average', 3), 'symmetric');

% Display image after Mean filtering
subplot(2, 2, 4);
imshow(mean_filtered);
title('Mean Filtered');

% Remove noise using Median filter
median_filtered = medfilt2(noisy_img, [3, 3]);

% Display image after Median filtering
figure;
subplot(1, 2, 1);
imshow(median_filtered);
title('Median Filtered');

% Display the original subset image for comparison
subplot(1, 2, 2);
imshow(subset_img);
title('Original Subset Image');
