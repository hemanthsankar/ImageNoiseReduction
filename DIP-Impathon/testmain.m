% Load the original image
originalImage = imread('your_image.jpg'); % Replace 'your_image.jpg' with your image path

% Display the original image
figure;
subplot(2, 2, 1);
imshow(originalImage);
title('Original Image');

% Add Gaussian noise to the original image
gaussianNoiseSigma = 25; % Adjust sigma value as needed
gaussianNoisyImage = imnoise(originalImage, 'gaussian', 0, (gaussianNoiseSigma/255)^2);

% Display the image with added Gaussian noise
subplot(2, 2, 2);
imshow(gaussianNoisyImage);
title('Gaussian Noisy Image');

% Add salt and pepper noise to the original image
saltPepperNoiseDensity = 0.05; % Adjust noise density as needed
saltPepperNoisyImage = imnoise(originalImage, 'salt & pepper', saltPepperNoiseDensity);

% Display the image with added salt and pepper noise
subplot(2, 2, 3);
imshow(saltPepperNoisyImage);
title('Salt & Pepper Noisy Image');

% Add speckle noise to the original image
speckleNoiseVariance = 0.04; % Adjust variance as needed
speckleNoisyImage = imnoise(originalImage, 'speckle', speckleNoiseVariance);

% Display the image with added speckle noise
subplot(2, 2, 4);
imshow(speckleNoisyImage);
title('Speckle Noisy Image');

% Now let's apply filters to denoise the images

% Remove noise using Gaussian filter
gaussianFiltered = imgaussfilt(gaussianNoisyImage, 1); % Standard deviation of 1

% Remove noise using Mean filter
meanFiltered = imfilter(saltPepperNoisyImage, fspecial('average', [3 3])); % 3x3 mean filter

% Remove noise using Median filter
medianFiltered = medfilt2(speckleNoisyImage, [3, 3]); % 3x3 median filter

% Display the filtered images
figure;
subplot(2, 2, 1);
imshow(gaussianFiltered);
title('Gaussian Filtered');

subplot(2, 2, 2);
imshow(meanFiltered);
title('Mean Filtered');

subplot(2, 2, 3);
imshow(medianFiltered);
title('Median Filtered');
