% Load the image
originalImage = imread('waterbody.jpg');
% Assuming originalImage contains the image with water bodies

% Extract a subset of size 15x15 containing water bodies
subsetImage = originalImage(100:114, 100:114); % Adjust coordinates as needed

% Add noise to the subset image
noisyImage = imnoise(subsetImage, 'salt & pepper', 0.5); % Adding salt and pepper noise

% Display the noisy image
subplot(2, 2, 1);
imshow(noisyImage);
title('Noisy Image');

% Remove noise using Gaussian filter
gaussianFiltered = imgaussfilt(noisyImage, 1); % Sigma value of 1 for Gaussian filter

% Display the filtered image using Gaussian filter
subplot(2, 2, 2);
imshow(gaussianFiltered);
title('Gaussian Filtered');

% Remove noise using mean filter
meanFiltered = imfilter(noisyImage, fspecial('average', [3 3])); % 3x3 mean filter

% Display the filtered image using mean filter
subplot(2, 2, 3);
imshow(meanFiltered);
title('Mean Filtered');

% Remove noise using median filter
medianFiltered = medfilt2(noisyImage, [3 3]); % 3x3 median filter

% Display the filtered image using median filter
subplot(2, 2, 4);
imshow(medianFiltered);
title('Median Filtered');
