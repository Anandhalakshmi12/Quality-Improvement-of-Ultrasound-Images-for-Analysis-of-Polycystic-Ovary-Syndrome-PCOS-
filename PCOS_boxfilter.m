I = imread('D:\SEM 2\IVA\train copy\pco\pco_2.jpg');
I2 = rgb2gray(I);
img = im2double(I);
%BOX FILTER
filter_size = 3;
box_filter = ones(filter_size)/(filter_size^2);
f= imfilter(img, box_filter, 'replicate');
subplot(1,2,1); imshow(img), title("Orginal Image");
subplot(1,2,2); imshow(f), title("Box-DeNoise image");

[peaksnr, snr] = psnr(f, img); 
fprintf('\n The Peak-SNR value for METHOD 1 is %0.4f', peaksnr);

err = immse(f, img);
fprintf('\n The mean-squared error for METHOD 1 is %0.4f', err);

re = rmse(double(f(:)), double(img(:)));
fprintf('\n The root mean-squared error for M1 is %0.4f\n', re);

