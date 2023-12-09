I = imread('D:\SEM 2\IVA\train copy\pco\pco_2.jpg');
I2 = rgb2gray(I);
img = im2double(I2);


% MIDEAN FILTER
I1 = rgb2gray(I);
Q = medfilt2(I1);
subplot(1,2,1), imshow(I), title("Original");
subplot(1,2,2); imshow(Q), title("Median-De-Noise image");
Q1 = im2double(Q);

[peaksnr, snr] = psnr(Q1, img); 
fprintf('\n The Peak-SNR value for METHOD 1 is %0.4f', peaksnr);

err = immse(Q1, img);
fprintf('\n The mean-squared error for METHOD 1 is %0.4f', err);

re = rmse(double(Q1(:)), double(img(:)));
fprintf('\n The root mean-squared error for M1 is %0.4f\n', re);

