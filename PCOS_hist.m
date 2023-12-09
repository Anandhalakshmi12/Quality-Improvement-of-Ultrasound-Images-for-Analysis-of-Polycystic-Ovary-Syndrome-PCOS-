A = imread("D:\SEM 2\IVA\train copy\pco\pco_2.jpg");
A = rgb2gray(A);
figure;
B = imadjust(A,stretchlim(A));
subplot(1,2,1), imshow(A), title("Original");
subplot(1,2,2), imhist(A), title("Historam of Original image");
C = imadjust(A,[0.1 0.5],[]);
D = imadjust(A,stretchlim(A,[0.05 0.95]),[]);

H = histeq(A);
subplot(1,2,1), imshow(H), title("Equalized");
subplot(1,2,2), imhist(H), title("Histogram of equalized image");

[peaksnr, snr] = psnr(H, A); 
fprintf('\n The Peak-SNR value for METHOD 1 is %0.4f', peaksnr);

err = immse(H, A);
fprintf('\n The mean-squared error for METHOD 1 is %0.4f\n', err);

re = rmse(double(H(:)), double(A(:)));
fprintf('\n The root mean-squared error for M1 is %0.4f\n', re);


J = adapthisteq(A,'clipLimit',0.07,'Distribution','rayleigh');
imshowpair(A,J,'montage');
title('Original Image (left) and Contrast Enhanced Image (right)')

[peaksnr, snr] = psnr(J, A); 
fprintf('\n The Peak-SNR value for METHOD 1 is %0.4f', peaksnr);

err = immse(J, A);
fprintf('\n The mean-squared error for METHOD 1 is %0.4f\n', err);

re = rmse(double(J(:)), double(A(:)));
fprintf('\n The root mean-squared error for M1 is %0.4f\n', re);

